import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  @JsonKey(name: 'categories_id')
  final int? categoriesId;
  @JsonKey(name: 'categories_name')
  final String? categoriesName;
  @JsonKey(name: 'categories_name_ar')
  final String? categoriesNameAr;
  @JsonKey(name: 'categories_Image')
  final String? categoriesImage;
  @JsonKey(name: 'categories_Data')
  final String? categoriesData;

  const Datum({
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesData,
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
      categoriesId.hashCode ^
      categoriesName.hashCode ^
      categoriesNameAr.hashCode ^
      categoriesImage.hashCode ^
      categoriesData.hashCode;
}
