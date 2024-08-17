import '../logic/cubit/coupon_cubit.dart';
import '../../../../widgets/RowBottomAdd.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/function/validator.dart';
import '../../../../utility/constants.dart';
import '../../../../widgets/custom_date_picker.dart';
import '../../../../widgets/custom_text_field.dart';
import 'add_coupon_bloc.dart';

class CouponSubmitForm extends StatelessWidget {
  final Function()? onPressed;
  const CouponSubmitForm({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Form(
      key: context.read<CouponCubit>().addCouponFormKey,
      autovalidateMode: context.read<CouponCubit>().autovalidateMode,
      child: Container(
        width: size.width * 0.7,
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(defaultPadding),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: context.read<CouponCubit>().couponname,
                    labelText: 'Coupon Code',
                    onSave: (val) {},
                    validator: (value) {
                      return validator(value, 'Please enter coupon code');
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    controller: context.read<CouponCubit>().count,
                    labelText: 'Count Coupon',
                    inputType: TextInputType.number,
                    onSave: (val) {},
                    validator: (value) {
                      return validator(value, 'Please enter coupon count');
                    },
                  ),
                ),
              ],
            ),
            const Gap(defaultPadding),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: context.read<CouponCubit>().discount,
                    labelText: 'Discount Amount',
                    inputType: TextInputType.number,
                    onSave: (val) {},
                    validator: (value) {
                      return validator(value, 'Please enter discount amount');
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                      controller: context.read<CouponCubit>().maxuser,
                      labelText: 'MaxUsers',
                      inputType: TextInputType.number,
                      onSave: (val) {},
                      validator: (value) {
                        return validator(value, 'Please Numepers max user');
                      }),
                ),
              ],
            ),
            const Gap(defaultPadding),
            Row(
              children: [
                Expanded(
                  child: CustomDatePicker(
                      labelText: 'Select Start Date',
                      controller: context.read<CouponCubit>().startDate,
                      onDateSelected: () =>
                          context.read<CouponCubit>().showstart(context)),
                ),
                Expanded(
                  child: CustomDatePicker(
                      labelText: 'Select End Date',
                      controller: context.read<CouponCubit>().endDateCtrl,
                      onDateSelected: () =>
                          context.read<CouponCubit>().showend(context)),
                ),
              ],
            ),
            const Gap(defaultPadding),
            RowBotttomAdd(onPressed: onPressed),
            const AddCouponBlocListener()
          ],
        ),
      ),
    ));
  }
}
