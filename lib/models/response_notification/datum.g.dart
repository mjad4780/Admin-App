// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      notificationIdSignal: json['notification_id_signal'] as String?,
      notificationId: (json['notification_id'] as num?)?.toInt(),
      notificationTitle: json['notification_title'] as String?,
      notificationBody: json['notification_body'] as String?,
      notificationUserid: (json['notification_userid'] as num?)?.toInt(),
      notificationDatetime: json['notification_datetime'] as String?,
      notificationImage: json['notification_image'] as String?,
      notificationAll: (json['notification_all'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'notification_id': instance.notificationId,
      'notification_title': instance.notificationTitle,
      'notification_body': instance.notificationBody,
      'notification_userid': instance.notificationUserid,
      'notification_datetime': instance.notificationDatetime,
      'notification_image': instance.notificationImage,
      'notification_all': instance.notificationAll,
      'notification_id_signal': instance.notificationIdSignal,
    };
