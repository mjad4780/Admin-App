// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseItems _$ResponseItemsFromJson(Map<String, dynamic> json) =>
    ResponseItems(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ItemsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseItemsToJson(ResponseItems instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
