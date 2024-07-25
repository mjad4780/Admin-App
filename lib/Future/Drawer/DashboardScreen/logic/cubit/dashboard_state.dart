import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../models/response_items/response_items.dart';
part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;

/////////////////items//////////////////
  ///:view
  const factory DashboardState.loadingview() = Loadingview;
  const factory DashboardState.successview(List<ResponseItems> response) =
      Successview;
  const factory DashboardState.erorrview({required String erorr}) = Erorrview;

  ///:add
  const factory DashboardState.loadingAdd() = LoadingAdd;
  const factory DashboardState.successAdd() = SuccessAdd;
  const factory DashboardState.erorrAdd({required String erorr}) = ErorrAdd;

  ///:edit
  const factory DashboardState.loadingedit() = Loadingedit;
  const factory DashboardState.successedit() = Successedit;
  const factory DashboardState.erorredit({required String erorr}) = Erorredit;

  ///:delete
  const factory DashboardState.loadingdelete() = Loadingdelete;
  const factory DashboardState.successdelete() = Successdelete;
  const factory DashboardState.erorrdelete({required String erorr}) =
      Erorrdelete;

  ///: galer
  const factory DashboardState.galer() = Galer;

  ///: PushEdit
  const factory DashboardState.PushEdit() = PushEdit;
}
