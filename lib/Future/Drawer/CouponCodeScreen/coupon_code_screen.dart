import '../../../core/get_it/get_it.dart';
import 'logic/cubit/coupon_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utility/constants.dart';
import '../../../widgets/Heder.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'widget/add_coupon_form.dart';
import 'widget/coupon_list_section.dart';

class CouponCodeScreen extends StatelessWidget {
  const CouponCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => getIt<CouponCubit>(),
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
                            ElevatedButton.icon(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding * 1.5,
                                  vertical: defaultPadding,
                                ),
                              ),
                              onPressed: () {
                                // showAddForm(
                                //     context, "Add Coupon", CouponSubmitForm());
                              },
                              icon: const Icon(Icons.add),
                              label: const Text("Add New"),
                            ),
                            const Gap(20),
                            IconButton(
                                onPressed: () {
                                  //TODO: should complete call getAllCoupons
                                },
                                icon: const Icon(Icons.refresh)),
                          ],
                        ),
                        const Gap(defaultPadding),
                        const CouponListSection(
                          coupon: [],
                        ),
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
