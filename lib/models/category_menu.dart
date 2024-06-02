import 'package:json_annotation/json_annotation.dart';

part 'category_menu.g.dart';

@JsonSerializable(includeIfNull: false)
class CategoryMenu{
  String? nombre;
  int? id;

  CategoryMenu();

  factory CategoryMenu.fromJson(Map<String, dynamic> json) => _$CategoryMenuFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryMenuToJson(this);
}
