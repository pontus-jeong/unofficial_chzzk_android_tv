import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_settings.freezed.dart';
part 'chat_settings.g.dart';

@freezed
class ChatSettings with _$ChatSettings {
  const ChatSettings._();

  const factory ChatSettings({
    required int chatPositionX,
    required int chatPositionY,
    required int chatContainerHeight,
    required int chatContainerWidth,
    required int chatFontSize,
    required int entireChatContainerTransparency,
    required int singleChatContainerTransparency,
    required int chatContainerHorizontalMargin,
    required int chatContainerVerticalMargin,
    required int showChatTime,
    required int showNickname,
    required int showDonation,
    required int badgeCollectorHeight,
    required int useBadgeCollector,
  }) = _ChatSettings;

  factory ChatSettings.fromJson(Map<String, dynamic> json) =>
      _$ChatSettingsFromJson(json);
}
