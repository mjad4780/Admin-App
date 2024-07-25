// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_notifacation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseNotifacation _$ResponseNotifacationFromJson(
        Map<String, dynamic> json) =>
    ResponseNotifacation(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseNotifacationToJson(
        ResponseNotifacation instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
