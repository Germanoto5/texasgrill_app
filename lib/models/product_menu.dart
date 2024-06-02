import 'package:json_annotation/json_annotation.dart';
import 'package:texasgrill_app/models/category_menu.dart';
part 'product_menu.g.dart';

@JsonSerializable(includeIfNull: false)
class ProductMenu{
  int? id;
  String? nombre;
  String? ingredientes;
  String? urlImagen;
  double? precio;
  CategoryMenu? idCategoria;

  ProductMenu();

  factory ProductMenu.fromJson(Map<String, dynamic> json) => _$ProductMenuFromJson(json);

  Map<String, dynamic> toJson() => _$ProductMenuToJson(this);

}
