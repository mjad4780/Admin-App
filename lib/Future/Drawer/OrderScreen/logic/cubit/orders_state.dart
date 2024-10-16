import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../models/response_detilas/datum.dart';
import '../../../../../models/response_orders/datum.dart';

part 'orders_state.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;

  /////////////Orders///////////////////////////////

  ///:update
  const factory OrdersState.loadingUpdate() = LoadingUpdate;
  const factory OrdersState.successUpdate() = SuccessUpdate;

  const factory OrdersState.erorrUpdate({required String erorr}) = ErorrUpdate;

  ///:viewdetails
  const factory OrdersState.loadingviewdetails() = Loadingviewdetails;
  const factory OrdersState.successviewdetails(
      List<DataDetails> responseDetails) = successviewdetails;
  const factory OrdersState.erorrviewdetails({required String erorr}) =
      Erorrviewdetails;

////////////////////viewOrders///////////////////

  ///:viewapprove
  const factory OrdersState.loadingviewapprove() = Loadingviewapprove;
  const factory OrdersState.successviewapprove(List<Datum> vieworders) =
      Successviewapprove;
  const factory OrdersState.erorrviewapprove({required String erorr}) =
      Erorrviewapprove;

  ///:viewCancel
  const factory OrdersState.loadingviewCancel() = LoadingviewCancel;
  const factory OrdersState.successviewCancel(List<Datum> vieworders) =
      SuccessviewCancel;
  const factory OrdersState.erorrviewCancel({required String erorr}) =
      ErorrviewCancel;

  ///:viewdone
  const factory OrdersState.loadingviewdone() = Loadingviewdone;
  const factory OrdersState.successviewdone(List<Datum> vieworders) =
      Successviewdone;
  const factory OrdersState.erorrviewdone({required String erorr}) =
      Erorrviewdone;

  ///:viewpending
  const factory OrdersState.loadingviewpending() = Loadingviewpending;
  const factory OrdersState.successviewpending(List<Datum> vieworders) =
      Successviewpending;
  const factory OrdersState.erorrviewpending({required String erorr}) =
      Erorrviewpending;

  ///:viewprepare
  const factory OrdersState.loadingviewprepare() = Loadingviewprepare;
  const factory OrdersState.successviewprepare(List<Datum> viewprepareorders) =
      Successviewprepare;
  const factory OrdersState.erorrviewprepare({required String erorr}) =
      Erorrviewprepare;

  ///:viewshipped
  const factory OrdersState.loadingviewshipped() = Loadingviewshipped;
  const factory OrdersState.successviewshipped(List<Datum> vieworders) =
      successviewshipped;
  const factory OrdersState.erorrviewshipped({required String erorr}) =
      Erorrviewshipped;

  ///:viewAllOrders
  const factory OrdersState.loadingviewAllOrders() = LoadingviewAllOrders;
  const factory OrdersState.successviewAllOrders(List<Datum> viewAllorders) =
      successviewAllOrders;
  const factory OrdersState.erorrviewAllOrders({required String erorr}) =
      ErorrviewAllOrders;

  const factory OrdersState.updateInt() = updateInt;
  const factory OrdersState.updateString() = updateString;
}
