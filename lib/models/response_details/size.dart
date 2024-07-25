import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'size.g.dart';

@JsonSerializable()
class Size {
  final int? id;
  final String? size;
  final int? quantity;
  final String? color;

  const Size({this.id, this.size, this.quantity, this.color});

  factory Size.fromJson(Map<String, dynamic> json) => _$SizeFromJson(json);

  Map<String, dynamic> toJson() => _$SizeToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Size) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^ size.hashCode ^ quantity.hashCode ^ color.hashCode;
}
