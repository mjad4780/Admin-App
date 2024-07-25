import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  @JsonKey(name: 'setting_id')
  final int? settingId;
  @JsonKey(name: 'setting_title')
  final String? settingTitle;
  @JsonKey(name: 'setting_body')
  final String? settingBody;
  @JsonKey(name: 'setting_datedelvery')
  final int? settingDatedelvery;
  @JsonKey(name: 'setting_image')
  final String? settingImage;

  const Datum({
    this.settingId,
    this.settingTitle,
    this.settingBody,
    this.settingDatedelvery,
    this.settingImage,
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
      settingId.hashCode ^
      settingTitle.hashCode ^
      settingBody.hashCode ^
      settingDatedelvery.hashCode ^
      settingImage.hashCode;
}
