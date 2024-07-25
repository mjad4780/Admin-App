import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'size.dart';

part 'response_items.g.dart';

@JsonSerializable()
class ResponseItems {
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
  List<String>? images;
  List<ItemSize>? size;

  ResponseItems({
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
    this.images,
    this.size,
  });

  factory ResponseItems.fromJson(Map<String, dynamic> json) {
    return _$ResponseItemsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseItemsToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseItems) return false;
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
      images.hashCode ^
      size.hashCode;
}
