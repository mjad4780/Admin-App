import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'size.dart';

part 'datum.g.dart';

@JsonSerializable()
class DataDetails {
  @JsonKey(name: 'item_id')
  int? itemId;
  @JsonKey(name: 'item_name')
  String? itemName;
  @JsonKey(name: 'item_name_ar')
  String? itemNameAr;
  @JsonKey(name: 'item_decs')
  String? itemDecs;
  @JsonKey(name: 'item_decs_ar')
  String? itemDecsAr;
  @JsonKey(name: 'item_image')
  String? itemImage;
  @JsonKey(name: 'item_count')
  int? itemCount;
  @JsonKey(name: 'item_active')
  int? itemActive;
  @JsonKey(name: 'item_price')
  int? itemPrice;
  @JsonKey(name: 'item_discount')
  int? itemDiscount;
  @JsonKey(name: 'item_data')
  String? itemData;
  @JsonKey(name: 'item_categories')
  int? itemCategories;
  @JsonKey(name: 'items_prices')
  int? itemsPrices;
  @JsonKey(name: 'itemprice_discount')
  double? itempriceDiscount;
  int? countitems;
  @JsonKey(name: 'cart_id')
  int? cartId;
  @JsonKey(name: 'cart_itemid')
  int? cartItemid;
  @JsonKey(name: 'cart_userid')
  int? cartUserid;
  @JsonKey(name: 'cart_orders')
  int? cartOrders;
  @JsonKey(name: 'cart_size')
  String? cartSize;
  @JsonKey(name: 'cart_color')
  String? cartColor;
  List<String>? images;
  List<ItemSize>? size;

  DataDetails({
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
    this.cartColor,
    this.cartSize,
    this.images,
    this.size,
  });

  factory DataDetails.fromJson(Map<String, dynamic> json) =>
      _$DataDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DataDetailsToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DataDetails) return false;
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
