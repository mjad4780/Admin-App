import 'package:untitled/Future/Drawer/CouponCodeScreen/data/repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../core/function/datetime.dart';
import 'coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  CouponCubit(this._couponRepo) : super(const CouponState.initial());

  final CouponRepo _couponRepo;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final addCouponFormKey = GlobalKey<FormState>();
  TextEditingController couponname = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDateCtrl = TextEditingController();
  TextEditingController maxuser = TextEditingController();
  TextEditingController count = TextEditingController();

  showstart(BuildContext context) async {
    startDate.text = await showDateTimePicker(context);
    emit(const CouponState.start());
  }

  showend(BuildContext context) async {
    endDateCtrl.text = await showDateTimePicker(context);
    emit(const CouponState.end());
  }

  ///:ViewCoupon
  viewCoupon() async {
    emit(const CouponState.loadingview());
    final response = await _couponRepo.viewCoupon();
    response.when(success: (data) {
      emit(CouponState.successview(data.data ?? []));
    }, failure: (error) {
      emit(CouponState.erorrview(erorr: error.messege ?? ''));
    });
  }

  ///:AddCoupon
  addCoupon() async {
    if (addCouponFormKey.currentState!.validate()) {
      emit(const CouponState.loadingAdd());
      final response = await _couponRepo.addCoupon(
          couponname.text,
          startDate.text,
          endDateCtrl.text,
          count.text,
          discount.text,
          maxuser.text);
      response.when(success: (data) {
        emit(const CouponState.successAdd());
      }, failure: (error) {
        emit(CouponState.erorrAdd(erorr: error.messege ?? ''));
      });
    } else {}
  }
}
