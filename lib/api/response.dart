

import 'package:json_annotation/json_annotation.dart';
import 'package:texasgrill_app/models/category_menu.dart';
import 'package:texasgrill_app/models/product_menu.dart';
import 'package:texasgrill_app/models/promotion.dart';

part 'response.g.dart';

@JsonSerializable(includeIfNull: false, createToJson: false)
class ListPromotionRes extends _ListRes{
  List<Promotion>? data;

  ListPromotionRes();

  factory ListPromotionRes.fromJson(Map<String, dynamic> json) => _$ListPromotionResFromJson(json);
}

@JsonSerializable(includeIfNull: false, createToJson: false)
class ListProductsRes extends _ListRes{
  List<ProductMenu>? data;

  ListProductsRes();

  factory ListProductsRes.fromJson(Map<String, dynamic> json) => _$ListProductsResFromJson(json);
}

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