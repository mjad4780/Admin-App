import '../../../core/function/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utility/constants.dart';
import '../../../widgets/Heder.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../widgets/custom_dropdown.dart';
import 'logic/cubit/orders_cubit.dart';
import 'logic/cubit/orders_state.dart';
import 'widget/order_list_section.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    return SafeArea(
        child: SingleChildScrollView(
            primary: false,
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                const Header(
                  title: 'Orders',
                ),
                const SizedBox(height: defaultPadding),
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
                              const Gap(20),
                              Expanded(
                                child: CustomDropdown(
                                  hintText: 'Filter Order By status',
                                  initialValue: 'All order',
                                  items: context.read<OrdersCubit>().item,
                                  displayItem: (val) => val,
                                  onChanged: (newValue) {
                                    context
                                        .read<OrdersCubit>()
                                        .filterOrders(newValue ?? '');
                                  },
                                  validator: (value) {
                                    validator(value, 'Please select status');
                                    return null;
                                    // return null;
                                  },
                                ),
                              ),
                              const Gap(40),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.refresh)),
                            ],
                          ),
                          const Gap(defaultPadding),
                          BlocConsumer<OrdersCubit, OrdersState>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              return OrderListSection(
                                order: context.read<OrdersCubit>().itemorders,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )));
  }
}
