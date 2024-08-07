import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final int? status;
  final String? messege;

  ApiErrorModel({
    this.messege,
    this.status,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
  //Listالهدف منها في حاله الخطا علي شكل اكثر من
//واحد فقطString دي بتجمع كل الاخطاء وتحولها الي
  // String getAllErrorMessages() {
  //   if (errors == null || errors is List && (errors as List).isEmpty) {
  //     return messege ?? "Unknown Error occurred";
  //   }

  //   // TODO : explain this new update
  //   if (errors is Map<String, dynamic>) {
  //     final errorMessage =
  //         (errors as Map<String, dynamic>).entries.map((entry) {
  //       final value = entry.value;
  //       return "${value.join(',')}";
  //     }).join('\n');

  //     return errorMessage;
  //   } else if (errors is List) {
  //     return (errors as List).join('\n');
  //   }

  //   return messege ?? "Unknown Error occurred";
  // }
}
