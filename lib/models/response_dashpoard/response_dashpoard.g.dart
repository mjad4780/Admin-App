// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_dashpoard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDashpoard _$ResponseDashpoardFromJson(Map<String, dynamic> json) =>
    ResponseDashpoard(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['Categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      orders: (json['Orders'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseDashpoardToJson(ResponseDashpoard instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'Categories': instance.categories,
      'Orders': instance.orders,
    };
