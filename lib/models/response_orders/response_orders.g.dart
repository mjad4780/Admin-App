// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseOrders _$ResponseOrdersFromJson(Map<String, dynamic> json) =>
    ResponseOrders(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseOrdersToJson(ResponseOrders instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
