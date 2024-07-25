import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'response_categories.g.dart';

@JsonSerializable()
class ResponseCategories {
  final String? status;
  final List<Datum>? data;

  const ResponseCategories({this.status, this.data});

  factory ResponseCategories.fromJson(Map<String, dynamic> json) {
    return _$ResponseCategoriesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseCategoriesToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseCategories) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}
