import '../../../../core/get_it/get_it.dart';
import '../logic/cubit_r/orders_cubit.dart';
import '../../../../core/function/validator.dart';
import '../../../../models/ordersmodel.dart';
import '../../../../widgets/RowBottomAdd.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/constants.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/custom_dropdown.dart';
import '../../../../widgets/custom_text_field.dart';
import 'FormRow.dart';
import 'addressSection.dart';
import 'itemsSection.dart';
import 'paymentDetailsSection.dart';

class OrderSubmitForm extends StatelessWidget {
  final OrdersModel? order;

  const OrderSubmitForm({Key? key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => getIt<OrdersCubit>(),
      child: BlocConsumer<OrdersCubit, OrdersState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<OrdersCubit>();
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(defaultPadding),
              width: size.width * 0.5, // Adjust width based on screen size
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Form(
                key: cubit.orderFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: FormRow(
                                text: 'Name:',
                                widget: Text(
                                    order?.ordersUsersid.toString() ?? 'N/A',
                                    style: TextStyle(fontSize: 16)))),
                        Expanded(
                            child: FormRow(
                                text: 'Order Id:',
                                widget: Text(
                                    order?.ordersId.toString() ?? 'N/A',
                                    style: TextStyle(fontSize: 12)))),
                      ],
                    ),
                    ItemSection(
                        cubit: cubit, totalPrice: order?.ordersTotalprice ?? 0),
                    addressSection(
                      order: order!,
                    ),
                    Gap(10),
                    paymentDetailsSection(
                      order: order!,
                    ),
                    FormRow(
                        text: 'Order Status:',
                        widget: CustomDropdown(
                          hintText: 'Status',
                          initialValue:
                              context.read<OrdersCubit>().selectedOrderStatus,
                          items: [
                            'pending',
                            'processing',
                            'shipped',
                            'delivered',
                            'cancelled'
                          ],
                          displayItem: (val) => val,
                          onChanged: (newValue) {
                            // orderProvider.selectedOrderStatus =
                            //     newValue ?? 'pending';
                            // orderProvider.updateUI();
                          },
                          validator: (value) {
                            validator(value, 'Please select status');
                            return null;
                          },
                        )),
                    FormRow(
                        text: 'Tracking URL:',
                        widget: CustomTextField(
                          labelText: 'Tracking Url',
                          onSave: (val) {},
                          controller:
                              context.read<OrdersCubit>().trackingUrlCtrl,
                        )),
                    Gap(defaultPadding * 2),
                    RowBotttomAdd(
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
