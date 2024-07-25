import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../models/cartmodel.dart';
import '../../../../../models/ordersmodel.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  final orderFormKey = GlobalKey<FormState>();
  TextEditingController trackingUrlCtrl = TextEditingController();
  String selectedOrderStatus = 'pending';
  OrdersModel? orderForUpdate;
  List<OrdersModel> orderData = [
    OrdersModel(
      ordersUsersid: 100,
      ordersDatetime: '2000-4-22',
      ordersId: 2,
      ordersPaymentmethod: 3,
      ordersTotalprice: 555,
      ordersType: 44,
      ordersStatus: 0,
      ordersCoupon: 66,
    )
  ];
  List<CartModel> cartdata = [
    CartModel(itemsName: 'hp', itemsPrice: 22, itemsCount: 2)
  ];
  List<String> item = [
    'All order',
    'pending',
    'processing',
    'shipped',
    'delivered',
    'cancelled'
  ];
  //       if (cubit.cartdata.isEmpty) {
  //   return Text('No items', style: TextStyle(fontSize: 16));
  // }
}
