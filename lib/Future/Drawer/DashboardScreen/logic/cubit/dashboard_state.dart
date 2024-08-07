import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../models/response_items/datum.dart';
part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;

/////////////////items//////////////////
  ///:view
  const factory DashboardState.loadingview() = Loadingview;
  const factory DashboardState.successview(List<ItemsData> response) =
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

  ///:view
  const factory DashboardState.loadingviewCat() = LoadingviewCat;
  const factory DashboardState.successviewCat() = SuccessviewCat;
  const factory DashboardState.erorrviewCat({required String erorr}) =
      ErorrviewCat;

  ///:view
  const factory DashboardState.loadingvimage() = Loadingimage;
  const factory DashboardState.successimage() = Successimage;
  const factory DashboardState.erorrvimage({required String erorr}) =
      Erorrimage;

  ///: galer
  const factory DashboardState.galer() = Galer;
  const factory DashboardState.galer2() = Galer2;
  const factory DashboardState.galer3() = Galer3;

  ///: PushEdit
  const factory DashboardState.pushEdit() = PushEdit;
}
