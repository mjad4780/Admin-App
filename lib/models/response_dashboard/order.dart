import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  @JsonKey(name: 'TotalOrders')
  String? totalOrders;
  @JsonKey(name: 'TotalPending')
  String? totalPending;
  @JsonKey(name: 'TotalApprove')
  String? totalApprove;
  @JsonKey(name: 'TotalPrepare')
  String? totalPrepare;
  @JsonKey(name: 'TotalShipped')
  String? totalShipped;
  @JsonKey(name: 'TotalDone')
  String? totalDone;
  @JsonKey(name: 'TotalCancel')
  String? totalCancel;

  Order({
    this.totalOrders,
    this.totalPending,
    this.totalApprove,
    this.totalPrepare,
    this.totalShipped,
    this.totalDone,
    this.totalCancel,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Order) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      totalOrders.hashCode ^
      totalPending.hashCode ^
      totalApprove.hashCode ^
      totalPrepare.hashCode ^
      totalShipped.hashCode ^
      totalDone.hashCode ^
      totalCancel.hashCode;
}
