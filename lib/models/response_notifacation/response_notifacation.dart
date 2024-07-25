import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'response_notifacation.g.dart';

@JsonSerializable()
class ResponseNotifacation {
  final String? status;
  final List<Datum>? data;

  const ResponseNotifacation({this.status, this.data});

  factory ResponseNotifacation.fromJson(Map<String, dynamic> json) {
    return _$ResponseNotifacationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseNotifacationToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseNotifacation) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}
