// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDashboard _$ResponseDashboardFromJson(Map<String, dynamic> json) =>
    ResponseDashboard(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ItemsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['Categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      orders: (json['Orders'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseDashboardToJson(ResponseDashboard instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'Categories': instance.categories,
      'Orders': instance.orders,
    };
