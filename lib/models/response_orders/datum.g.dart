// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      playerId: json['player_id'] as String?,
      ordersId: (json['orders_id'] as num?)?.toInt(),
      ordersUserid: (json['orders_userid'] as num?)?.toInt(),
      ordersAdress: (json['orders_adress'] as num?)?.toInt(),
      ordersType: (json['orders_type'] as num?)?.toInt(),
      ordersPricedelivery: (json['orders_pricedelivery'] as num?)?.toInt(),
      ordersPrice: (json['orders_price'] as num?)?.toInt(),
      ordersCoupon: (json['orders_coupon'] as num?)?.toInt(),
      orderToatalprice: (json['order_Toatalprice'] as num?)?.toInt(),
      ordersRating: (json['orders_rating'] as num?)?.toInt(),
      ordersRatingCommint: json['orders_rating_commint'] as String?,
      ordersDatetime: json['orders_datetime'] as String?,
      ordersPaymentmets: (json['orders_paymentmets'] as num?)?.toInt(),
      ordersStatus: (json['orders_status'] as num?)?.toInt(),
      ordersDelivery: (json['orders_delivery'] as num?)?.toInt(),
      adressId: (json['adress_id'] as num?)?.toInt(),
      adressUserid: (json['adress_userid'] as num?)?.toInt(),
      adressCity: json['adress_city'] as String?,
      adressName: json['adress_name'] as String?,
      adressStreet: json['adress_street'] as String?,
      adressLat: json['adress_lat'] as String?,
      adressLong: json['adress_long'] as String?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'orders_id': instance.ordersId,
      'orders_userid': instance.ordersUserid,
      'orders_adress': instance.ordersAdress,
      'orders_type': instance.ordersType,
      'orders_pricedelivery': instance.ordersPricedelivery,
      'orders_price': instance.ordersPrice,
      'orders_coupon': instance.ordersCoupon,
      'order_Toatalprice': instance.orderToatalprice,
      'orders_rating': instance.ordersRating,
      'orders_rating_commint': instance.ordersRatingCommint,
      'orders_datetime': instance.ordersDatetime,
      'orders_paymentmets': instance.ordersPaymentmets,
      'orders_status': instance.ordersStatus,
      'orders_delivery': instance.ordersDelivery,
      'player_id': instance.playerId,
      'adress_id': instance.adressId,
      'adress_userid': instance.adressUserid,
      'adress_city': instance.adressCity,
      'adress_name': instance.adressName,
      'adress_street': instance.adressStreet,
      'adress_lat': instance.adressLat,
      'adress_long': instance.adressLong,
    };
