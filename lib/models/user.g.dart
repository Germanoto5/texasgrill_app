// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..correo = json['correo'] as String?
  ..contrasenia = json['contrasenia'] as String?
  ..nombre = json['nombre'] as String?
  ..apellidos = json['apellidos'] as String?;

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('correo', instance.correo);
  writeNotNull('contrasenia', instance.contrasenia);
  writeNotNull('nombre', instance.nombre);
  writeNotNull('apellidos', instance.apellidos);
  return val;
}
