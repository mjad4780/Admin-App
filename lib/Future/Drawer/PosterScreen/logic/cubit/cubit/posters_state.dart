import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/response_poster/datum.dart';

part 'posters_state.freezed.dart';

@freezed
class PostersState with _$PostersState {
  const factory PostersState.initial() = _Initial;

  ///:view
  const factory PostersState.loadingview() = Loadingview;
  const factory PostersState.successview(List<Datum> data) = Successview;
  const factory PostersState.erorrview({required String erorr}) = Erorrview;

  ///:add
  const factory PostersState.loadingAdd() = LoadingAdd;
  const factory PostersState.successAdd() = SuccessAdd;
  const factory PostersState.erorrAdd({required String erorr}) = ErorrAdd;

//galer
  const factory PostersState.galer() = Galer;
}
