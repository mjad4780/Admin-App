import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  @JsonKey(name: 'notification_id')
  final int? notificationId;
  @JsonKey(name: 'notification_title')
  final String? notificationTitle;
  @JsonKey(name: 'notification_body')
  final String? notificationBody;
  @JsonKey(name: 'notification_userid')
  final int? notificationUserid;
  @JsonKey(name: 'notification_datetime')
  final String? notificationDatetime;
  @JsonKey(name: 'notification_image')
  final String? notificationImage;

  const Datum({
    this.notificationId,
    this.notificationTitle,
    this.notificationBody,
    this.notificationUserid,
    this.notificationDatetime,
    this.notificationImage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Datum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      notificationId.hashCode ^
      notificationTitle.hashCode ^
      notificationBody.hashCode ^
      notificationUserid.hashCode ^
      notificationDatetime.hashCode ^
      notificationImage.hashCode;
}
