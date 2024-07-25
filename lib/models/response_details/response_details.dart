import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'size.dart';

part 'response_details.g.dart';

@JsonSerializable()
class ResponseDetails {
  @JsonKey(name: 'item_id')
  final int? itemId;
  @JsonKey(name: 'item_name')
  final String? itemName;
  @JsonKey(name: 'item_name_ar')
  final String? itemNameAr;
  @JsonKey(name: 'item_decs')
  final String? itemDecs;
  @JsonKey(name: 'item_decs_ar')
  final String? itemDecsAr;
  @JsonKey(name: 'item_image')
  final String? itemImage;
  @JsonKey(name: 'item_count')
  final int? itemCount;
  @JsonKey(name: 'item_active')
  final int? itemActive;
  @JsonKey(name: 'item_price')
  final int? itemPrice;
  @JsonKey(name: 'item_discount')
  final int? itemDiscount;
  @JsonKey(name: 'item_data')
  final String? itemData;
  @JsonKey(name: 'item_categories')
  final int? itemCategories;
  @JsonKey(name: 'items_prices')
  final int? itemsPrices;
  @JsonKey(name: 'itemprice_discount')
  final double? itempriceDiscount;
  final int? countitems;
  @JsonKey(name: 'cart_id')
  final int? cartId;
  @JsonKey(name: 'cart_itemid')
  final int? cartItemid;
  @JsonKey(name: 'cart_userid')
  final int? cartUserid;
  @JsonKey(name: 'cart_orders')
  final int? cartOrders;
  final List<String>? images;
  final List<Size>? size;

  const ResponseDetails({
    this.itemId,
    this.itemName,
    this.itemNameAr,
    this.itemDecs,
    this.itemDecsAr,
    this.itemImage,
    this.itemCount,
    this.itemActive,
    this.itemPrice,
    this.itemDiscount,
    this.itemData,
    this.itemCategories,
    this.itemsPrices,
    this.itempriceDiscount,
    this.countitems,
    this.cartId,
    this.cartItemid,
    this.cartUserid,
    this.cartOrders,
    this.images,
    this.size,
  });

  factory ResponseDetails.fromJson(Map<String, dynamic> json) {
    return _$ResponseDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseDetailsToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseDetails) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      itemId.hashCode ^
      itemName.hashCode ^
      itemNameAr.hashCode ^
      itemDecs.hashCode ^
      itemDecsAr.hashCode ^
      itemImage.hashCode ^
      itemCount.hashCode ^
      itemActive.hashCode ^
      itemPrice.hashCode ^
      itemDiscount.hashCode ^
      itemData.hashCode ^
      itemCategories.hashCode ^
      itemsPrices.hashCode ^
      itempriceDiscount.hashCode ^
      countitems.hashCode ^
      cartId.hashCode ^
      cartItemid.hashCode ^
      cartUserid.hashCode ^
      cartOrders.hashCode ^
      images.hashCode ^
      size.hashCode;
}
