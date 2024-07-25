import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../models/response_coupon/datum.dart';

part 'coupon_state.freezed.dart';

@freezed
class CouponState with _$CouponState {
  const factory CouponState.initial() = _Initial;

  ///:view
  const factory CouponState.loadingview() = Loadingview;
  const factory CouponState.successview(List<Datum> data) = Successview;
  const factory CouponState.erorrview({required String erorr}) = Erorrview;

  ///:add
  const factory CouponState.loadingAdd() = LoadingAdd;
  const factory CouponState.successAdd() = SuccessAdd;
  const factory CouponState.erorrAdd({required String erorr}) = ErorrAdd;

  ///:timmmmmmme
  const factory CouponState.start() = Start;
  const factory CouponState.end() = End;
}
