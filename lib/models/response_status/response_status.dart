import 'package:json_annotation/json_annotation.dart';
part 'response_status.g.dart';

@JsonSerializable()
class ResponseStatus {
  final int? status;
  final String? messege;
  ResponseStatus({
    required this.status,
    required this.messege,
  });

  factory ResponseStatus.fromJson(Map<String, dynamic> json) =>
      _$ResponseStatusFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseStatusToJson(this);
}
