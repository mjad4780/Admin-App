import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'response_notification.g.dart';

@JsonSerializable()
class ResponseNotification {
  String? status;
  List<Datum>? data;

  ResponseNotification({this.status, this.data});

  factory ResponseNotification.fromJson(Map<String, dynamic> json) {
    return _$ResponseNotificationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResponseNotificationToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseNotification) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}
