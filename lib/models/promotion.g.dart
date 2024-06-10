// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promotion _$PromotionFromJson(Map<String, dynamic> json) => Promotion()
  ..id = (json['id'] as num?)?.toInt()
  ..nombre = json['nombre'] as String?
  ..descripcion = json['descripcion'] as String?
  ..descuento = (json['descuento'] as num?)?.toDouble()
  ..fechaInicio = json['fechaInicio'] == null
      ? null
      : DateTime.parse(json['fechaInicio'] as String)
  ..fechaFin = json['fechaFin'] == null
      ? null
      : DateTime.parse(json['fechaFin'] as String)
  ..imagen = json['imagen'] as String?
  ..activo = json['activo'] as bool?
  ..tiempoParaGastar = json['tiempoParaGastar'] == null
      ? null
      : DateTime.parse(json['tiempoParaGastar'] as String)
  ..codigo = json['codigo'] as String?;

Map<String, dynamic> _$PromotionToJson(Promotion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('nombre', instance.nombre);
  writeNotNull('descripcion', instance.descripcion);
  writeNotNull('descuento', instance.descuento);
  writeNotNull('fechaInicio', instance.fechaInicio?.toIso8601String());
  writeNotNull('fechaFin', instance.fechaFin?.toIso8601String());
  writeNotNull('imagen', instance.imagen);
  writeNotNull('activo', instance.activo);
  writeNotNull(
      'tiempoParaGastar', instance.tiempoParaGastar?.toIso8601String());
  writeNotNull('codigo', instance.codigo);
  return val;
}
