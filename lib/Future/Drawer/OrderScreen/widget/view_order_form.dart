import 'package:untitled/core/get_it/get_it.dart';
import 'package:untitled/models/response_orders/datum.dart';

import '../../../../core/theming/styles.dart';
import '../../../../utility/size_config.dart';
import '../logic/cubit/orders_cubit.dart';
import '../../../../core/function/validator.dart';
import '../../../../widgets/RowBottomAdd.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/constants.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../widgets/custom_dropdown.dart';
import '../../../../widgets/custom_text_field.dart';
import 'FormRow.dart';
import 'addressSection.dart';
import 'details_orders_bloc.dart';
import 'paymentDetailsSection.dart';
import 'update_orders_bloc.dart';

class OrderSubmitForm extends StatelessWidget {
  final Datum order;
  const OrderSubmitForm({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return size.width <= SizeConfig.tablet
        ? Scaffold(
            appBar: AppBar(),
            body: BlocProvider(
              create: (context) => getIt<OrdersCubit>(),
              child: CustemSubmint(
                size: size,
                order: order,
              ),
            ))
        : BlocProvider(
            create: (context) => getIt<OrdersCubit>(),
            child: CustemSubmint(
              size: size,
              order: order,
            ));
  }
}

class CustemSubmint extends StatelessWidget {
  const CustemSubmint({super.key, required this.size, required this.order});
  final Size size;
  final Datum order;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          width: size.width >= SizeConfig.tablet
              ? size.width * 0.5
              : size.width, // Adjust width based on screen size
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Form(
            // key: context.read<OrdersCubit>().orderFormKey,
            // autovalidateMode: context.read<OrdersCubit>().autovalidateMode,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: FormRow(
                            text: 'Name:',
                            widget: Text(order.ordersUserid.toString(),
                                style: TextStyles.styleRegular16(context)))),
                    Expanded(
                        child: FormRow(
                            text: 'Order Id:',
                            widget: Text(order.ordersId.toString(),
                                style: TextStyles.styleRegular16(context)))),
                  ],
                ),
                DetailsBlocBuilder(
                  tatalPrice: order.orderToatalprice ?? 0,
                ),
                AddressSection(order: order),
                const Gap(10),
                PaymentDetailsSection(
                  order: order,
                ),
                FormRow(
                    text: 'Order Status:',
                    widget: CustomDropdown(
                      hintText: context.read<OrdersCubit>().selectedOrderStatus,
                      items: context.read<OrdersCubit>().item,
                      displayItem: (val) => val,
                      onChanged: (newValue) {
                        context
                            .read<OrdersCubit>()
                            .updatestatus(newValue ?? '');
                      },
                      validator: (value) {
                        return validator(value, 'Please select status');
                      },
                    )),
                FormRow(
                    text: 'Tracking URL:',
                    widget: CustomTextField(
                      labelText: 'Tracking Url',
                      onSave: (val) {},
                      controller: context.read<OrdersCubit>().trackingUrlCtrl,
                    )),
                const Gap(defaultPadding * 2),
                RowBotttomAdd(
                  onPressed: () {
                    context.read<OrdersCubit>().updateOrders(
                        order.ordersId!,
                        order.ordersUserid!,
                        order.ordersType!,
                        order.playerId!);
                  },
                ),
                const UpdateOrdersBlocListener()
              ],
            ),
          )),
    );
  }
}
