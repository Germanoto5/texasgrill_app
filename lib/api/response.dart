

import 'package:json_annotation/json_annotation.dart';
import 'package:texasgrill_app/models/category_menu.dart';

part 'response.g.dart';

@JsonSerializable(includeIfNull: false, createToJson: false)
class ListCategoriesRes extends _ListRes{
  List<CategoryMenu>? data;

  ListCategoriesRes();

  factory ListCategoriesRes.fromJson(Map<String, dynamic> json) => _$ListCategoriesResFromJson(json);
}


//@JsonSerializable(includeIfNull: false, createToJson: false)
class _ListRes {

  //List<dynamic>? data;

  _ListRes();

 //factory _ListRes.fromJson(Map<String, dynamic> json) => $_ListResFromJson(json);
}