// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseStatus _$ResponseStatusFromJson(Map<String, dynamic> json) =>
    ResponseStatus(
      status: (json['status'] as num?)?.toInt(),
      messege: json['messege'] as String?,
    );

Map<String, dynamic> _$ResponseStatusToJson(ResponseStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'messege': instance.messege,
    };
