import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'response_orders.g.dart';

@JsonSerializable()
class ResponseOrders {
  final String? status;
  final List<Datum>? data;

  const ResponseOrders({this.status, this.data});

  factory ResponseOrders.fromJson(Map<String, dynamic> json) {
    return _$ResponseOrdersFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseOrdersToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseOrders) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}
