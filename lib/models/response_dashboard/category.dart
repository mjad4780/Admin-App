import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: 'categories_id')
  int? categoriesId;
  @JsonKey(name: 'categories_name')
  String? categoriesName;
  @JsonKey(name: 'categories_name_ar')
  String? categoriesNameAr;
  @JsonKey(name: 'categories_Image')
  String? categoriesImage;
  @JsonKey(name: 'categories_Data')
  String? categoriesData;

  Category({
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesData,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Category) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      categoriesId.hashCode ^
      categoriesName.hashCode ^
      categoriesNameAr.hashCode ^
      categoriesImage.hashCode ^
      categoriesData.hashCode;
}
