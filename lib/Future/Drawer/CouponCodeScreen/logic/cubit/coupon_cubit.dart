import 'package:untitled/Future/Drawer/CouponCodeScreen/data/repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/function/datetime.dart';
import 'coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  CouponCubit(this._couponRepo) : super(const CouponState.initial());

  final CouponRepo _couponRepo;

  final addCouponFormKey = GlobalKey<FormState>();
  TextEditingController couponname = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController StartDate = TextEditingController();
  TextEditingController endDateCtrl = TextEditingController();
  TextEditingController maxuser = TextEditingController();

  showstart(BuildContext context) async {
    StartDate.text = await ShowDateTimePicker(context);
    emit(const CouponState.start());
  }

  showend(BuildContext context) async {
    endDateCtrl.text = await ShowDateTimePicker(context);
    emit(const CouponState.end());
  }

  ///:ViewCoupon
  viewCoupon() async {
    emit(const CouponState.loadingview());
    final response = await _couponRepo.ViewCoupon();
    response.when(success: (data) {
      emit(CouponState.successview(data.data ?? []));
    }, failure: (error) {
      emit(CouponState.erorrview(erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:AddCoupon
  AddCoupon(int count) async {
    emit(const CouponState.loadingAdd());
    final response = await _couponRepo.AddCoupon(couponname.text,
        StartDate.text, endDateCtrl.text, count, discount.text, maxuser.text);
    response.when(success: (data) {
      emit(const CouponState.successAdd());
    }, failure: (error) {
      emit(CouponState.erorrAdd(erorr: error.apiErrorModel.messege ?? ''));
    });
  }
}
