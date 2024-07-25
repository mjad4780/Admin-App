import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../models/response_details/response_details.dart';
import '../../../../../models/response_orders/datum.dart';

part 'orders_state.freezed.dart';

@freezed
class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;

  /////////////Orders///////////////////////////////

  ///:approve
  const factory OrdersState.loadingapprove() = Loadingapprove;
  const factory OrdersState.successapprove() = Successapprove;

  const factory OrdersState.erorrapprove({required String erorr}) =
      Erorrapprove;

  ///:prepare
  const factory OrdersState.loadingprepare() = Loadingprepare;
  const factory OrdersState.successprepare() = Successprepare;
  const factory OrdersState.erorrprepare({required String erorr}) =
      Erorrprepare;

  ///:done
  const factory OrdersState.loadingdone() = Loadingdone;
  const factory OrdersState.successdone() = Successdone;
  const factory OrdersState.erorrdone({required String erorr}) = Erorrdone;

  ///:shipped
  const factory OrdersState.loadingshipped() = Loadingshipped;
  const factory OrdersState.successshipped() = Successshipped;
  const factory OrdersState.erorrshipped({required String erorr}) =
      Erorrshipped;

  ///:viewdetails
  const factory OrdersState.loadingviewdetails() = Loadingviewdetails;
  const factory OrdersState.successviewdetails(
      ResponseDetails responseDetails) = successviewdetails;
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
}
