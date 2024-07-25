import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'response_poster.g.dart';

@JsonSerializable()
class ResponsePoster {
  final String? status;
  final List<Datum>? data;

  const ResponsePoster({this.status, this.data});

  factory ResponsePoster.fromJson(Map<String, dynamic> json) {
    return _$ResponsePosterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponsePosterToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponsePoster) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}
