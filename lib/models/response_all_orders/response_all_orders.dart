import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'response_all_orders.g.dart';

@JsonSerializable()
class ResponseAllOrders {
  String? status;
  List<Datum>? data;

  ResponseAllOrders({this.status, this.data});

  factory ResponseAllOrders.fromJson(Map<String, dynamic> json) {
    return _$ResponseAllOrdersFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseAllOrdersToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseAllOrders) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}
