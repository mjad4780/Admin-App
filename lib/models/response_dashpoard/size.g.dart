// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Size _$SizeFromJson(Map<String, dynamic> json) => Size(
      id: (json['id'] as num?)?.toInt(),
      size: json['size'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      color: json['color'] as String?,
    );

Map<String, dynamic> _$SizeToJson(Size instance) => <String, dynamic>{
      'id': instance.id,
      'size': instance.size,
      'quantity': instance.quantity,
      'color': instance.color,
    };
