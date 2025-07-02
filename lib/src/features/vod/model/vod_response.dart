import 'package:freezed_annotation/freezed_annotation.dart';

import 'vod.dart';

part 'vod_response.freezed.dart';
part 'vod_response.g.dart';

/* VOD Response */
@freezed
class VodResponse with _$VodResponse {
  const VodResponse._();

  const factory VodResponse({
    required int size,
    VodPage? page,
    required List<Vod> data,
  }) = _VodResponse;

  factory VodResponse.fromJson(Map<String, dynamic> json) =>
      _$VodResponseFromJson(json);
}

@freezed
class VodPage with _$VodPage {
  const VodPage._();

  const factory VodPage({
    VodNext? next,
  }) = _VodPage;

  factory VodPage.fromJson(Map<String, dynamic> json) =>
      _$VodPageFromJson(json);
}

@freezed
class VodNext with _$VodNext {
  const VodNext._();

  const factory VodNext({
    int? publishDateAt,
    int? readCount,
  }) = _VodNext;

  factory VodNext.fromJson(Map<String, dynamic> json) =>
      _$VodNextFromJson(json);
}

/* Channel VOD */
@freezed
class ChannelVodResponse with _$ChannelVodResponse {
  const ChannelVodResponse._();

  const factory ChannelVodResponse({
    required int page,
    required int size,
    required int totalCount,
    required int totalPages,
    required List<Vod> data,
  }) = _ChannelVodResponse;

  factory ChannelVodResponse.fromJson(Map<String, dynamic> json) =>
      _$ChannelVodResponseFromJson(json);
}

/* Following VOD */
@freezed
class FollowingVodResponse with _$FollowingVodResponse {
  const FollowingVodResponse._();

  const factory FollowingVodResponse({
    required int size,
    FollowingVodPage? page,
    required List<Vod> data,
  }) = _FollowingVodResponse;

  factory FollowingVodResponse.fromJson(Map<String, dynamic> json) =>
      _$FollowingVodResponseFromJson(json);
}

@freezed
class FollowingVodPage with _$FollowingVodPage {
  const FollowingVodPage._();

  const factory FollowingVodPage({
    FollowingVodNext? next,
  }) = _FollowingVodPage;

  factory FollowingVodPage.fromJson(Map<String, dynamic> json) =>
      _$FollowingVodPageFromJson(json);
}

@freezed
class FollowingVodNext with _$FollowingVodNext {
  const FollowingVodNext._();

  const factory FollowingVodNext({
    String? nextNo,
  }) = _FollowingVodNext;

  factory FollowingVodNext.fromJson(Map<String, dynamic> json) =>
      _$FollowingVodNextFromJson(json);
}

/* Category VOD */
@freezed
class CategoryVodResponse with _$CategoryVodResponse {
  const CategoryVodResponse._();

  const factory CategoryVodResponse({
    required int size,
    CategoryVodPage? page,
    required List<Vod> data,
  }) = _CategoryVodResponse;

  factory CategoryVodResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryVodResponseFromJson(json);
}

@freezed
class CategoryVodPage with _$CategoryVodPage {
  const CategoryVodPage._();

  const factory CategoryVodPage({
    CategoryVodNext? next,
  }) = _CategoryVodPage;

  factory CategoryVodPage.fromJson(Map<String, dynamic> json) =>
      _$CategoryVodPageFromJson(json);
}

@freezed
class CategoryVodNext with _$CategoryVodNext {
  const CategoryVodNext._();

  const factory CategoryVodNext({
    int? publishDateAt,
    int? readCount,
  }) = _CategoryVodNext;

  factory CategoryVodNext.fromJson(Map<String, dynamic> json) =>
      _$CategoryVodNextFromJson(json);
}
