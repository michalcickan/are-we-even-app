import 'package:json_annotation/json_annotation.dart';

import 'group.dart';
import 'user.dart';

part 'invitation.g.dart';

@JsonSerializable()
class Invitation {
  final int id;
  final User invitedBy;
  final Group group;

  Invitation({
    required this.id,
    required this.invitedBy,
    required this.group,
  });

  factory Invitation.fromJson(Map<String, dynamic> json) =>
      _$InvitationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$InvitationToJson(this);
}
