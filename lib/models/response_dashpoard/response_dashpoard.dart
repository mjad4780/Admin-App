import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category.dart';
import 'datum.dart';
import 'order.dart';

part 'response_dashpoard.g.dart';

@JsonSerializable()
class ResponseDashpoard {
  final String? status;
  final List<Datum>? data;
  @JsonKey(name: 'Categories')
  final List<Category>? categories;
  @JsonKey(name: 'Orders')
  final List<Order>? orders;

  const ResponseDashpoard({
    this.status,
    this.data,
    this.categories,
    this.orders,
  });

  factory ResponseDashpoard.fromJson(Map<String, dynamic> json) {
    return _$ResponseDashpoardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseDashpoardToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseDashpoard) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      status.hashCode ^ data.hashCode ^ categories.hashCode ^ orders.hashCode;
}
