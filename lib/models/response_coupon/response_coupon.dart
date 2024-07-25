import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'response_coupon.g.dart';

@JsonSerializable()
class ResponseCoupon {
  final String? status;
  final List<Datum>? data;

  const ResponseCoupon({this.status, this.data});

  factory ResponseCoupon.fromJson(Map<String, dynamic> json) {
    return _$ResponseCouponFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseCouponToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseCoupon) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}
