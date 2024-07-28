// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_detilas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDetails _$ResponseDetailsFromJson(Map<String, dynamic> json) =>
    ResponseDetails(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseDetailsToJson(ResponseDetails instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
