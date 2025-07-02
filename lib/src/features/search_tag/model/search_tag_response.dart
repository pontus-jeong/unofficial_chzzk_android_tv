import 'package:freezed_annotation/freezed_annotation.dart';

import '../../live/model/live_info.dart';
import '../../vod/model/vod.dart';

part 'search_tag_response.freezed.dart';
part 'search_tag_response.g.dart';

/* LIVE */
@freezed
class SearchTagLiveResponse with _$SearchTagLiveResponse {
  const SearchTagLiveResponse._();

  const factory SearchTagLiveResponse({
    required int size,
    SearchTagLivePage? page,
    required List<LiveInfo> data,
  }) = _SearchTagLiveResponse;

  factory SearchTagLiveResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchTagLiveResponseFromJson(json);
}

@freezed
class SearchTagLivePage with _$SearchTagLivePage {
  const SearchTagLivePage._();

  const factory SearchTagLivePage({
    SearchTagLiveNext? next,
  }) = _SearchTagLivePage;

  factory SearchTagLivePage.fromJson(Map<String, dynamic> json) =>
      _$SearchTagLivePageFromJson(json);
}

@freezed
class SearchTagLiveNext with _$SearchTagLiveNext {
  const SearchTagLiveNext._();

  const factory SearchTagLiveNext({
    required int concurrentUserCount,
    required int liveId,
  }) = _SearchTagLiveNext;

  factory SearchTagLiveNext.fromJson(Map<String, dynamic> json) =>
      _$SearchTagLiveNextFromJson(json);
}

/* VOD */
@freezed
class SearchTagVodResponse with _$SearchTagVodResponse {
  const SearchTagVodResponse._();

  const factory SearchTagVodResponse({
    required int size,
    SearchTagVodPage? page,
    required List<Vod> data,
  }) = _SearchTagVodResponse;

  factory SearchTagVodResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchTagVodResponseFromJson(json);
}

@freezed
class SearchTagVodPage with _$SearchTagVodPage {
  const SearchTagVodPage._();

  const factory SearchTagVodPage({
    SearchTagVodNext? next,
  }) = _SearchTagVodPage;

  factory SearchTagVodPage.fromJson(Map<String, dynamic> json) =>
      _$SearchTagVodPageFromJson(json);
}

@freezed
class SearchTagVodNext with _$SearchTagVodNext {
  const SearchTagVodNext._();

  const factory SearchTagVodNext({
    required int start,
  }) = _SearchTagVodNext;

  factory SearchTagVodNext.fromJson(Map<String, dynamic> json) =>
      _$SearchTagVodNextFromJson(json);
}
