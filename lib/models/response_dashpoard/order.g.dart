// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      totalOrders: json['TotalOrders'] as String?,
      totalPending: json['TotalPending'] as String?,
      totalApprove: json['TotalApprove'] as String?,
      totalPrepare: json['TotalPrepare'] as String?,
      totalShipped: json['TotalShipped'] as String?,
      totalDone: json['TotalDone'] as String?,
      totalCancel: json['TotalCancel'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'TotalOrders': instance.totalOrders,
      'TotalPending': instance.totalPending,
      'TotalApprove': instance.totalApprove,
      'TotalPrepare': instance.totalPrepare,
      'TotalShipped': instance.totalShipped,
      'TotalDone': instance.totalDone,
      'TotalCancel': instance.totalCancel,
    };
