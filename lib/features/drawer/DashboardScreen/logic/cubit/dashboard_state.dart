import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../models/response_dashpoard/response_dashpoard.dart';
part 'dashboard_state.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;

/////////////////items//////////////////

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
  const factory DashboardState.loadingDashboard() = LoadingDashboard;
  const factory DashboardState.successDashboard(ResponseDashpoard responses) =
      SuccessDashboard;
  const factory DashboardState.erorrDashboard({required String erorr}) =
      ErorrDashboard;

  ///: galer
  const factory DashboardState.galer() = Galer;
  const factory DashboardState.galer2() = Galer2;
  const factory DashboardState.galer3() = Galer3;

  ///: remofegaler
  const factory DashboardState.remofgaler() = remofgaler;
  const factory DashboardState.removegaler2() = removegaler2;
  const factory DashboardState.removegaler3() = removegaler3;

  ///: PushEdit
  const factory DashboardState.pushEdit() = PushEdit;

  ///: approveitems
  const factory DashboardState.approveitems() = ApproveiItems;

  ///: removeControll
  const factory DashboardState.removeControll() = RemoveControll;
}
