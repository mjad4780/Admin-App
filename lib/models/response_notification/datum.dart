import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  @JsonKey(name: 'notification_id')
  int? notificationId;
  @JsonKey(name: 'notification_title')
  String? notificationTitle;
  @JsonKey(name: 'notification_body')
  String? notificationBody;
  @JsonKey(name: 'notification_userid')
  int? notificationUserid;
  @JsonKey(name: 'notification_datetime')
  String? notificationDatetime;
  @JsonKey(name: 'notification_image')
  String? notificationImage;
  @JsonKey(name: 'notification_all')
  int? notificationAll;
  @JsonKey(name: 'notification_id_signal')
  String? notificationIdSignal;

  Datum({
    this.notificationIdSignal,
    this.notificationId,
    this.notificationTitle,
    this.notificationBody,
    this.notificationUserid,
    this.notificationDatetime,
    this.notificationImage,
    this.notificationAll,
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
      notificationImage.hashCode ^
      notificationAll.hashCode;
}
