import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_playback_json.freezed.dart';
part 'live_playback_json.g.dart';

@freezed
class LivePlaybackJson with _$LivePlaybackJson {
  const LivePlaybackJson._();

  const factory LivePlaybackJson({
    required Meta meta,
    required ServiceMeta serviceMeta,
    required Live live,
    required List<Map<String, String>> api,
    required List<Media> media,
    required Thumbnail thumbnail,
  }) = _LivePlaybackJson;

  factory LivePlaybackJson.fromJson(Map<String, dynamic> json) =>
      _$LivePlaybackJsonFromJson(json);
}

@freezed
class Meta with _$Meta {
  const Meta._();

  const factory Meta({
    required String videoId,
    required int streamSeq,
    required String liveId,
    required bool paidLive,
    required CdnInfo cdnInfo,
    bool? p2p,
    bool? cmcdEnabled,
    String? playbackAuthType,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class CdnInfo with _$CdnInfo {
  const CdnInfo._();

  const factory CdnInfo({
    required String cdnType,
    bool? zeroRating,
  }) = _CdnInfo;

  factory CdnInfo.fromJson(Map<String, dynamic> json) =>
      _$CdnInfoFromJson(json);
}

@freezed
class ServiceMeta with _$ServiceMeta {
  const ServiceMeta._();

  const factory ServiceMeta({
    required String contentType,
  }) = _ServiceMeta;

  factory ServiceMeta.fromJson(Map<String, dynamic> json) =>
      _$ServiceMetaFromJson(json);
}

@freezed
class Live with _$Live {
  const Live._();

  const factory Live({
    required String start,
    required String open,
    required bool timeMachine,
    required String status,
  }) = _Live;

  factory Live.fromJson(Map<String, dynamic> json) => _$LiveFromJson(json);
}

@freezed
class Media with _$Media {
  const Media._();

  const factory Media({
    required String mediaId,
    required String protocol,
    required String path,
    String? latency,
    required List<EncodingTrack> encodingTrack,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}

@freezed
class EncodingTrack with _$EncodingTrack {
  const EncodingTrack._();

  const factory EncodingTrack({
    String? encodingTrackId,
    String? videoProfile,
    String? audioProfile,
    String? videoCodec,
    int? videoBitRate,
    int? audioBitRate,
    String? videoFrameRate,
    int? videoWidth,
    int? videoHeight,
    int? audioSamplingRate,
    int? audioChannel,
    bool? avoidReencoding,
    String? videoDynamicRange,
    String? p2pPath,
    String? p2pPathUrlEncoding,
    String? path,
    String? audioCodec,
    bool? audioOnly,
  }) = _EncodingTrack;

  factory EncodingTrack.fromJson(Map<String, dynamic> json) =>
      _$EncodingTrackFromJson(json);
}

@freezed
class Thumbnail with _$Thumbnail {
  const Thumbnail._();

  const factory Thumbnail({
    required String snapshotThumbnailTemplate,
    required List<String> types,
  }) = _Thumbnail;

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);
}

class LivePlaybackConverter implements JsonConverter<LivePlaybackJson, String> {
  const LivePlaybackConverter();

  @override
  LivePlaybackJson fromJson(String json) {
    final playbackJson = jsonDecode(json);

    return LivePlaybackJson.fromJson(playbackJson);
  }

  @override
  String toJson(LivePlaybackJson object) {
    final jsonMap = object.toJson();

    return jsonEncode(jsonMap);
  }
}
