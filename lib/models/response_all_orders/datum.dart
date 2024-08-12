import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  @JsonKey(name: 'orders_id')
  int? ordersId;
  @JsonKey(name: 'orders_userid')
  int? ordersUserid;
  @JsonKey(name: 'orders_adress')
  int? ordersAdress;
  @JsonKey(name: 'orders_type')
  int? ordersType;
  @JsonKey(name: 'orders_pricedelivery')
  int? ordersPricedelivery;
  @JsonKey(name: 'orders_price')
  int? ordersPrice;
  @JsonKey(name: 'orders_coupon')
  int? ordersCoupon;
  @JsonKey(name: 'order_Toatalprice')
  int? orderToatalprice;
  @JsonKey(name: 'orders_rating')
  int? ordersRating;
  @JsonKey(name: 'orders_rating_commint')
  String? ordersRatingCommint;
  @JsonKey(name: 'orders_datetime')
  String? ordersDatetime;
  @JsonKey(name: 'orders_paymentmets')
  int? ordersPaymentmets;
  @JsonKey(name: 'orders_status')
  int? ordersStatus;
  @JsonKey(name: 'orders_delivery')
  int? ordersDelivery;

  Datum({
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
      ordersDelivery.hashCode;
}
