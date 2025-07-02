import 'package:freezed_annotation/freezed_annotation.dart';

import 'vod_chat.dart';

part 'vod_chat_response.freezed.dart';
part 'vod_chat_response.g.dart';

@freezed
class VodChatResponse with _$VodChatResponse {
  const VodChatResponse._();

  const factory VodChatResponse({
    int? nextPlayerMessageTime,
    List<VodChat>? previousVideoChats,
    List<VodChat>? videoChats,
  }) = _VodChatResponse;

  factory VodChatResponse.fromJson(Map<String, dynamic> json) =>
      _$VodChatResponseFromJson(json);
}
