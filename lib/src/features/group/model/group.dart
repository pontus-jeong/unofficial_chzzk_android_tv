import 'package:freezed_annotation/freezed_annotation.dart';

part 'group.freezed.dart';
part 'group.g.dart';

@freezed
class Groups with _$Groups {
  const Groups._();

  const factory Groups({
    required List<Group> groups,
    required int lastActivatedGroupIndex,
  }) = _Groups;

  factory Groups.fromJson(Map<String, dynamic> json) => _$GroupsFromJson(json);
}

@freezed
class Group with _$Group {
  const Group._();

  const factory Group({
    required String id,
    required String groupName,
    required List<String> members,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
