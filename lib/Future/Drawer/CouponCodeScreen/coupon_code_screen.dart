import '../../../core/get_it/get_it.dart';
import 'logic/cubit/coupon_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/function/showAddForm.dart';
import '../../../utility/constants.dart';
import '../../../widgets/Heder.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'widget/add_coupon_form.dart';
import 'widget/coupon_list_section.dart';

class CouponCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => getIt<CouponCubit>(),
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Header(
                title: 'Coupon',
              ),
              Gap(defaultPadding),
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
                                padding: EdgeInsets.symmetric(
                                  horizontal: defaultPadding * 1.5,
                                  vertical: defaultPadding,
                                ),
                              ),
                              onPressed: () {
                                showAddForm(
                                    context, "Add Coupon", CouponSubmitForm());
                              },
                              icon: Icon(Icons.add),
                              label: Text("Add New"),
                            ),
                            Gap(20),
                            IconButton(
                                onPressed: () {
                                  //TODO: should complete call getAllCoupons
                                },
                                icon: Icon(Icons.refresh)),
                          ],
                        ),
                        Gap(defaultPadding),
                        CouponListSection(
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
