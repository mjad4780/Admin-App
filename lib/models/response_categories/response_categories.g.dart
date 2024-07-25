// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseCategories _$ResponseCategoriesFromJson(Map<String, dynamic> json) =>
    ResponseCategories(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseCategoriesToJson(ResponseCategories instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
