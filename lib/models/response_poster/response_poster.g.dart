// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_poster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponsePoster _$ResponsePosterFromJson(Map<String, dynamic> json) =>
    ResponsePoster(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponsePosterToJson(ResponsePoster instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
