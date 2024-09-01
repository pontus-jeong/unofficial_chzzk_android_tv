import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/hls_parser/hls_parser.dart';
import '../../../live/model/live.dart';
import '../../../setting/controller/stream_settings_controller.dart';
import 'live_playlist_controller.dart';

part 'live_player_controller.g.dart';

@riverpod
class SingleLivePlayerController extends _$SingleLivePlayerController {
  late LiveDetail _liveDetail;
  late int _latencyIndex;
  late int _resolutionIndex;

  @override
  FutureOr<Raw<VideoPlayerController>> build({required int index}) async {
    final streamSettings = ref.read(streamSettingsControllerProvider);
    final liveDetails = ref.read(livePlaylistControllerProvider);

    _latencyIndex = streamSettings.latencyIndex;
    _resolutionIndex = index == 0
        ? streamSettings.resolutionIndex
        : streamSettings.multiviewResolutionIndex;

    _liveDetail = liveDetails[index];

    return await init();
  }

  Future<VideoPlayerController> init({bool changeResolution = false}) async {
    try {
      final mediaList = await HlsParser(
              _liveDetail.livePlaybackJson.media[_latencyIndex].path)
          .getMediaPlaylistUris();

      int resolutionIdx = _resolutionIndex;

      if (mediaList != null) {
        if (mediaList.length < _resolutionIndex + 1) {
          resolutionIdx = mediaList.length - 1;
        }

        final mediaTrackUri = mediaList[resolutionIdx];
        final controller = _getVideoPlayerController(mediaTrackUri!);

        await controller.initialize();
        if (index != 0 && !changeResolution) controller.setVolume(0.0);

        return controller;
      }

      return _getVideoPlayerController(Uri());
    } catch (_) {
      return _getVideoPlayerController(Uri());
    }
  }

  Future<void> changeResolution(int resolutionIndex) async {
    dispose();
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () async {
        _resolutionIndex = resolutionIndex;

        return await init(changeResolution: true);
      },
    );
  }

  Future<void> changeSource() async {
    dispose();
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () async {
        _liveDetail = ref.read(livePlaylistControllerProvider)[index];

        return await init();
      },
    );
  }

  VideoPlayerController _getVideoPlayerController(Uri uri) {
    return VideoPlayerController.networkUrl(
      uri,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
  }

  void dispose() {
    if (state.value?.value.isPlaying == true) {
      state.value!.pause();
    }
    state.value?.dispose();
  }

  int getCurrentResolutionIndex() => _resolutionIndex;

  Future<void> playOrPause({required Timer? pauseTimer}) async {
    final controller = state.value!;
    // pause
    if (controller.value.isPlaying) {
      controller.pause();
      // start pause timer
      ref.read(pauseTimerProvider.notifier).pauseAndStartTimer();
    }
    // play
    else {
      // playback from pause
      if (pauseTimer != null && pauseTimer.isActive) {
        ref.read(pauseTimerProvider.notifier).cancelTimer();
        controller.play();
      }
      // play in realtime
      else {
        dispose();
        changeSource();
      }
    }
  }

  void pause() {
    final controller = state.value!;
    controller.pause();
  }

  void setMute(bool mute) {
    state.value!.setVolume(mute ? 0.0 : 1.0);
  }
}

@Riverpod(keepAlive: true)
class PauseTimer extends _$PauseTimer {
  /// Timer that measures the duration of the pause.
  ///
  /// The continuation(restart) of live streaming depends on this.
  @override
  Timer? build() {
    return null;
  }

  void pauseAndStartTimer() {
    cancelTimer();

    state = Timer(const Duration(seconds: 45), () {
      cancelTimer();
    });
  }

  void cancelTimer() {
    state?.cancel();
    state = null;
  }
}
