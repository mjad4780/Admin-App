import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  @JsonKey(name: 'coupon_id')
  final int? couponId;
  @JsonKey(name: 'coupon_name')
  final String? couponName;
  @JsonKey(name: 'coupon_count')
  final int? couponCount;
  @JsonKey(name: 'coupon_data')
  final String? couponData;
  @JsonKey(name: 'coupon_discount')
  final int? couponDiscount;
  @JsonKey(name: 'copon_maxuser')
  final int? coponMaxuser;
  @JsonKey(name: 'copon_endDate')
  final String? coponEndDate;

  const Datum({
    this.couponId,
    this.couponName,
    this.couponCount,
    this.couponData,
    this.couponDiscount,
    this.coponMaxuser,
    this.coponEndDate,
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
      couponId.hashCode ^
      couponName.hashCode ^
      couponCount.hashCode ^
      couponData.hashCode ^
      couponDiscount.hashCode ^
      coponMaxuser.hashCode ^
      coponEndDate.hashCode;
}
