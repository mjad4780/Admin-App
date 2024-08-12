import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category.dart';
import 'datum.dart';
import 'order.dart';

part 'response_dashboard.g.dart';

@JsonSerializable()
class ResponseDashboard {
  String? status;
  List<ItemsData>? data;
  @JsonKey(name: 'Categories')
  List<Category>? categories;
  @JsonKey(name: 'Orders')
  List<Order>? orders;

  ResponseDashboard({this.status, this.data, this.categories, this.orders});

  factory ResponseDashboard.fromJson(Map<String, dynamic> json) {
    return _$ResponseDashboardFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseDashboardToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseDashboard) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      status.hashCode ^ data.hashCode ^ categories.hashCode ^ orders.hashCode;
}
