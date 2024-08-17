import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  @JsonKey(name: 'TotalOrders')
  final String? totalOrders;
  @JsonKey(name: 'TotalPending')
  final String? totalPending;
  @JsonKey(name: 'TotalApprove')
  final String? totalApprove;
  @JsonKey(name: 'TotalPrepare')
  final String? totalPrepare;
  @JsonKey(name: 'TotalShipped')
  final String? totalShipped;
  @JsonKey(name: 'TotalDone')
  final String? totalDone;
  @JsonKey(name: 'TotalCancel')
  final String? totalCancel;

  const Order({
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
