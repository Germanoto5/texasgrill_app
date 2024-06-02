// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductMenu _$ProductMenuFromJson(Map<String, dynamic> json) => ProductMenu()
  ..id = (json['id'] as num?)?.toInt()
  ..nombre = json['nombre'] as String?
  ..ingredientes = json['ingredientes'] as String?
  ..urlImagen = json['urlImagen'] as String?
  ..precio = (json['precio'] as num?)?.toDouble()
  ..idCategoria = json['idCategoria'] == null
      ? null
      : CategoryMenu.fromJson(json['idCategoria'] as Map<String, dynamic>);

Map<String, dynamic> _$ProductMenuToJson(ProductMenu instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('nombre', instance.nombre);
  writeNotNull('ingredientes', instance.ingredientes);
  writeNotNull('urlImagen', instance.urlImagen);
  writeNotNull('precio', instance.precio);
  writeNotNull('idCategoria', instance.idCategoria);
  return val;
}
