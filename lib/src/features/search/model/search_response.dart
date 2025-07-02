import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_response.freezed.dart';
part 'search_response.g.dart';

@freezed
class SearchChannelResponse with _$SearchChannelResponse {
  const SearchChannelResponse._();

  const factory SearchChannelResponse({
    required int size,
    required List<dynamic> data,
  }) = _SearchChannelResponse;

  factory SearchChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchChannelResponseFromJson(json);
}

@freezed
class SearchVodResponse with _$SearchVodResponse {
  const SearchVodResponse._();

  const factory SearchVodResponse({
    required int size,
    required List<dynamic> data,
  }) = _SearchVodResponse;

  factory SearchVodResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchVodResponseFromJson(json);
}

@freezed
class SearchLiveResponse with _$SearchLiveResponse {
  const SearchLiveResponse._();

  const factory SearchLiveResponse({
    required int size,
    required List<dynamic> data,
  }) = _SearchLiveResponse;

  factory SearchLiveResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchLiveResponseFromJson(json);
}
