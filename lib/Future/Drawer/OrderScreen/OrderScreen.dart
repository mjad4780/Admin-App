import '../../../core/function/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/get_it/get_it.dart';
import '../../../utility/constants.dart';
import '../../../widgets/Heder.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../widgets/custom_dropdown.dart';
import 'logic/cubit_r/orders_cubit.dart';
import 'widget/order_list_section.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      primary: false,
      padding: EdgeInsets.all(defaultPadding),
      child: BlocProvider(
        create: (context) => getIt<OrdersCubit>(),
        child: BlocConsumer<OrdersCubit, OrdersState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                Header(
                  title: 'Orders',
                ),
                SizedBox(height: defaultPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  "My Orders",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              Gap(20),
                              SizedBox(
                                width: 280,
                                child: CustomDropdown(
                                  hintText: 'Filter Order By status',
                                  initialValue: 'All order',
                                  items: context.read<OrdersCubit>().item,
                                  displayItem: (val) => val,
                                  onChanged: (newValue) {
                                    if (newValue?.toLowerCase() ==
                                        'all order') {
                                      //TODO: should complete call filterOrders
                                    } else {
                                      //TODO: should complete call filterOrders
                                    }
                                  },
                                  validator: (value) {
                                    validator(value, 'Please select status');
                                    return null;
                                  },
                                ),
                              ),
                              Gap(40),
                              IconButton(
                                  onPressed: () {
                                    //TODO: should complete call getAllOrders
                                  },
                                  icon: Icon(Icons.refresh)),
                            ],
                          ),
                          Gap(defaultPadding),
                          OrderListSection(),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    ));
  }
}
