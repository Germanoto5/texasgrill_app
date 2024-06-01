import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable(includeIfNull: false)
class Login {
  String? correo;
  String? contrasenia;

  Login();
  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
