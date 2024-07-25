// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_coupon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseCoupon _$ResponseCouponFromJson(Map<String, dynamic> json) =>
    ResponseCoupon(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResponseCouponToJson(ResponseCoupon instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
