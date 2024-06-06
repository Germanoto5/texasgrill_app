import 'package:json_annotation/json_annotation.dart';

part 'promotion.g.dart';

@JsonSerializable(includeIfNull: false)
class Promotion {
  int? id;
  String? nombre;
  String? descripcion;
  double? descuento;
  DateTime? fechaInicio;
  DateTime? fechaFin;

  Promotion();

  factory Promotion.fromJson(Map<String, dynamic> json) => _$PromotionFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionToJson(this);
}
