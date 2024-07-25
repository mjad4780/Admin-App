// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      settingId: (json['setting_id'] as num?)?.toInt(),
      settingTitle: json['setting_title'] as String?,
      settingBody: json['setting_body'] as String?,
      settingDatedelvery: (json['setting_datedelvery'] as num?)?.toInt(),
      settingImage: json['setting_image'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'setting_id': instance.settingId,
      'setting_title': instance.settingTitle,
      'setting_body': instance.settingBody,
      'setting_datedelvery': instance.settingDatedelvery,
      'setting_image': instance.settingImage,
    };
