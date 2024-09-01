// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseNotification _$ResponseNotificationFromJson(
        Map<String, dynamic> json) =>
    ResponseNotification(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseNotificationToJson(
        ResponseNotification instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
