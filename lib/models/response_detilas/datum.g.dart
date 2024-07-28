// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataDetails _$DataDetailsFromJson(Map<String, dynamic> json) => DataDetails(
      itemId: (json['item_id'] as num?)?.toInt(),
      itemName: json['item_name'] as String?,
      itemNameAr: json['item_name_ar'] as String?,
      itemDecs: json['item_decs'] as String?,
      itemDecsAr: json['item_decs_ar'] as String?,
      itemImage: json['item_image'] as String?,
      itemCount: (json['item_count'] as num?)?.toInt(),
      itemActive: (json['item_active'] as num?)?.toInt(),
      itemPrice: (json['item_price'] as num?)?.toInt(),
      itemDiscount: (json['item_discount'] as num?)?.toInt(),
      itemData: json['item_data'] as String?,
      itemCategories: (json['item_categories'] as num?)?.toInt(),
      itemsPrices: (json['items_prices'] as num?)?.toInt(),
      itempriceDiscount: (json['itemprice_discount'] as num?)?.toDouble(),
      countitems: (json['countitems'] as num?)?.toInt(),
      cartId: (json['cart_id'] as num?)?.toInt(),
      cartItemid: (json['cart_itemid'] as num?)?.toInt(),
      cartUserid: (json['cart_userid'] as num?)?.toInt(),
      cartOrders: (json['cart_orders'] as num?)?.toInt(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      size: (json['size'] as List<dynamic>?)
          ?.map((e) => ItemSize.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataDetailsToJson(DataDetails instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'item_name': instance.itemName,
      'item_name_ar': instance.itemNameAr,
      'item_decs': instance.itemDecs,
      'item_decs_ar': instance.itemDecsAr,
      'item_image': instance.itemImage,
      'item_count': instance.itemCount,
      'item_active': instance.itemActive,
      'item_price': instance.itemPrice,
      'item_discount': instance.itemDiscount,
      'item_data': instance.itemData,
      'item_categories': instance.itemCategories,
      'items_prices': instance.itemsPrices,
      'itemprice_discount': instance.itempriceDiscount,
      'countitems': instance.countitems,
      'cart_id': instance.cartId,
      'cart_itemid': instance.cartItemid,
      'cart_userid': instance.cartUserid,
      'cart_orders': instance.cartOrders,
      'images': instance.images,
      'size': instance.size,
    };
