// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      categoriesId: (json['categories_id'] as num?)?.toInt(),
      categoriesName: json['categories_name'] as String?,
      categoriesNameAr: json['categories_name_ar'] as String?,
      categoriesImage: json['categories_Image'] as String?,
      categoriesData: json['categories_Data'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'categories_id': instance.categoriesId,
      'categories_name': instance.categoriesName,
      'categories_name_ar': instance.categoriesNameAr,
      'categories_Image': instance.categoriesImage,
      'categories_Data': instance.categoriesData,
    };
