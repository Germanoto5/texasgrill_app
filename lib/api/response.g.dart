// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListProductsRes _$ListProductsResFromJson(Map<String, dynamic> json) =>
    ListProductsRes()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => ProductMenu.fromJson(e as Map<String, dynamic>))
          .toList();

ListCategoriesRes _$ListCategoriesResFromJson(Map<String, dynamic> json) =>
    ListCategoriesRes()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryMenu.fromJson(e as Map<String, dynamic>))
          .toList();
