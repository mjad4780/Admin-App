// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemSize _$ItemSizeFromJson(Map<String, dynamic> json) => ItemSize(
      id: (json['id'] as num?)?.toInt(),
      size: json['size'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      color: json['color'] as String?,
    );

Map<String, dynamic> _$ItemSizeToJson(ItemSize instance) => <String, dynamic>{
      'id': instance.id,
      'size': instance.size,
      'quantity': instance.quantity,
      'color': instance.color,
    };
