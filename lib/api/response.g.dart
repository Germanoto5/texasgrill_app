// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCategoriesRes _$ListCategoriesResFromJson(Map<String, dynamic> json) =>
    ListCategoriesRes()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryMenu.fromJson(e as Map<String, dynamic>))
          .toList();
