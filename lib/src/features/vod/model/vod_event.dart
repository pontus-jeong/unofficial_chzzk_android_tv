import 'package:freezed_annotation/freezed_annotation.dart';

part 'vod_event.freezed.dart';
part 'vod_event.g.dart';

@freezed
class VodEvent with _$VodEvent {
  const VodEvent._();

  const factory VodEvent({
    required String channelId,
    required int videoNo,
    required Payload payload,
    required int totalLength,
  }) = _VodEvent;

  factory VodEvent.fromJson(Map<String, dynamic> json) =>
      _$VodEventFromJson(json);
}

@freezed
class Payload with _$Payload {
  const Payload._();

  const factory Payload({
    required String watchEventType,
    required String sessionId,
    required int duration,
    required int positionAt,
    int? awt,
  }) = _Payload;

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);
}
