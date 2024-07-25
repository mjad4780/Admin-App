import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  @JsonKey(name: 'orders_id')
  final int? ordersId;
  @JsonKey(name: 'orders_userid')
  final int? ordersUserid;
  @JsonKey(name: 'orders_adress')
  final int? ordersAdress;
  @JsonKey(name: 'orders_type')
  final int? ordersType;
  @JsonKey(name: 'orders_pricedelivery')
  final int? ordersPricedelivery;
  @JsonKey(name: 'orders_price')
  final int? ordersPrice;
  @JsonKey(name: 'orders_coupon')
  final int? ordersCoupon;
  @JsonKey(name: 'order_Toatalprice')
  final int? orderToatalprice;
  @JsonKey(name: 'orders_rating')
  final int? ordersRating;
  @JsonKey(name: 'orders_rating_commint')
  final String? ordersRatingCommint;
  @JsonKey(name: 'orders_datetime')
  final String? ordersDatetime;
  @JsonKey(name: 'orders_paymentmets')
  final int? ordersPaymentmets;
  @JsonKey(name: 'orders_status')
  final int? ordersStatus;
  @JsonKey(name: 'orders_delivery')
  final int? ordersDelivery;
  @JsonKey(name: 'adress_id')
  final int? adressId;
  @JsonKey(name: 'adress_userid')
  final int? adressUserid;
  @JsonKey(name: 'adress_city')
  final String? adressCity;
  @JsonKey(name: 'adress_name')
  final String? adressName;
  @JsonKey(name: 'adress_street')
  final String? adressStreet;
  @JsonKey(name: 'adress_lat')
  final String? adressLat;
  @JsonKey(name: 'adress_long')
  final String? adressLong;

  const Datum({
    this.ordersId,
    this.ordersUserid,
    this.ordersAdress,
    this.ordersType,
    this.ordersPricedelivery,
    this.ordersPrice,
    this.ordersCoupon,
    this.orderToatalprice,
    this.ordersRating,
    this.ordersRatingCommint,
    this.ordersDatetime,
    this.ordersPaymentmets,
    this.ordersStatus,
    this.ordersDelivery,
    this.adressId,
    this.adressUserid,
    this.adressCity,
    this.adressName,
    this.adressStreet,
    this.adressLat,
    this.adressLong,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Datum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      ordersId.hashCode ^
      ordersUserid.hashCode ^
      ordersAdress.hashCode ^
      ordersType.hashCode ^
      ordersPricedelivery.hashCode ^
      ordersPrice.hashCode ^
      ordersCoupon.hashCode ^
      orderToatalprice.hashCode ^
      ordersRating.hashCode ^
      ordersRatingCommint.hashCode ^
      ordersDatetime.hashCode ^
      ordersPaymentmets.hashCode ^
      ordersStatus.hashCode ^
      ordersDelivery.hashCode ^
      adressId.hashCode ^
      adressUserid.hashCode ^
      adressCity.hashCode ^
      adressName.hashCode ^
      adressStreet.hashCode ^
      adressLat.hashCode ^
      adressLong.hashCode;
}
