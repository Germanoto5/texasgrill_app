// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryMenu _$CategoryMenuFromJson(Map<String, dynamic> json) => CategoryMenu()
  ..nombre = json['nombre'] as String?
  ..id = (json['id'] as num?)?.toInt();

Map<String, dynamic> _$CategoryMenuToJson(CategoryMenu instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nombre', instance.nombre);
  writeNotNull('id', instance.id);
  return val;
}
