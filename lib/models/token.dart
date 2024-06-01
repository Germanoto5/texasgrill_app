import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable(includeIfNull: false)
class Token {
  String? token;

  Token();
  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
