import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'size.g.dart';

@JsonSerializable()
class ItemSize {
  int? id;
  String? size;
  int? quantity;
  String? color;

  ItemSize({this.id, this.size, this.quantity, this.color});

  factory ItemSize.fromJson(Map<String, dynamic> json) =>
      _$ItemSizeFromJson(json);

  Map<String, dynamic> toJson() => _$ItemSizeToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ItemSize) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^ size.hashCode ^ quantity.hashCode ^ color.hashCode;
}
