import '../../../core/get_it/get_it.dart';
import 'logic/cubit/coupon_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utility/constants.dart';
import '../../../widgets/Heder.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'widget/add_coupon_form.dart';
import 'widget/show_and_form_dialog.dart';
import 'widget/view_coupon_bloc.dart';

class CouponCodeScreen extends StatelessWidget {
  const CouponCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => getIt<CouponCubit>()..viewCoupon(),
        child: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              const Header(
                title: 'Coupon',
              ),
              const Gap(defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "My Sub Coupon",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            Builder(builder: (context) {
                              return ElevatedButton.icon(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding * 1.5,
                                    vertical: defaultPadding,
                                  ),
                                ),
                                onPressed: () {
                                  showAddForm(
                                      context,
                                      "Add Coupon",
                                      MediaQuery.sizeOf(context).width >= 592.0
                                          ? CouponSubmitForm(
                                              onPressed: () {
                                                context
                                                    .read<CouponCubit>()
                                                    .addCoupon();
                                              },
                                            )
                                          : CouponSubmitFormMobile(
                                              onPressed: () {
                                                context
                                                    .read<CouponCubit>()
                                                    .addCoupon();
                                              },
                                            ));
                                },
                                icon: const Icon(Icons.add),
                                label: const Text("Add New"),
                              );
                            }),
                            const Gap(20),
                            Builder(builder: (context) {
                              return IconButton(
                                  onPressed: () {
                                    context.read<CouponCubit>().viewCoupon();
                                    //TODO: should complete call getAllCoupons
                                  },
                                  icon: const Icon(Icons.refresh));
                            }),
                          ],
                        ),
                        const Gap(defaultPadding),
                        const CouponBlocBuilder()
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
