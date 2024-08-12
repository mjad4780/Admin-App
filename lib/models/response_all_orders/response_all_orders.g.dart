// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_all_orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseAllOrders _$ResponseAllOrdersFromJson(Map<String, dynamic> json) =>
    ResponseAllOrders(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseAllOrdersToJson(ResponseAllOrders instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
