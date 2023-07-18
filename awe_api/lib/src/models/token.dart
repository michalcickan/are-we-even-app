import 'package:awe_api/src/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
  String? token;
  @JsonKey(name: "access_token")
  String? accessToken;
  User? user;

  Token(
    this.token,
    this.accessToken,
    this.user,
  );

  @override
  static Token fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
