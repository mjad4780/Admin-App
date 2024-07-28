import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'response_detilas.g.dart';

@JsonSerializable()
class ResponseDetails {
  String? status;
  List<DataDetails>? data;

  ResponseDetails({this.status, this.data});

  factory ResponseDetails.fromJson(Map<String, dynamic> json) {
    return _$ResponseDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseDetailsToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseDetails) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}
