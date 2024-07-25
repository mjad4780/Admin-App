import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../models/response_orders/datum.dart';
import '../../data/repo_orders.dart';
import '../../data/repo_view_order.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this._ordersRepo, this._viewOrdersRepo)
      : super(OrdersState.initial());
  OrdersRepo _ordersRepo;
  ViewOrdersRepo _viewOrdersRepo;

  final orderFormKey = GlobalKey<FormState>();
  TextEditingController trackingUrlCtrl = TextEditingController();
  String selectedOrderStatus = 'pending';
  List<Datum> orderData = [
    Datum(
      ordersUserid: 100,
      ordersDatetime: '2000-4-22',
      ordersId: 2,
      ordersPaymentmets: 3,
      orderToatalprice: 555,
      ordersType: 44,
      ordersStatus: 0,
      ordersCoupon: 66,
    )
  ];
  // List<CartModel> cartdata = [
  //   CartModel(itemsName: 'hp', itemsPrice: 22, itemsCount: 2)
  // ];
  List<String> item = [
    'All order',
    'pending',
    'been approved',
    'prepare',
    'shipped',
    'done'
        'Cancelled'
  ];

  ///:approve
  approve(int orderid, int userid) async {
    emit(const OrdersState.loadingapprove());
    final response = await _ordersRepo.approve(orderid, userid);
    response.when(success: (data) {
      emit(OrdersState.successapprove());
    }, failure: (error) {
      emit(OrdersState.erorrapprove(erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:prepare
  prepare(int orderid, int userid, int type) async {
    emit(const OrdersState.loadingprepare());
    final response = await _ordersRepo.prepare(type, orderid, userid);
    response.when(success: (data) {
      emit(const OrdersState.successprepare());
    }, failure: (error) {
      emit(OrdersState.erorrprepare(erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:done
  done(int orderid, int userid) async {
    emit(const OrdersState.loadingdone());
    final response = await _ordersRepo.done(orderid, userid);
    response.when(success: (data) {
      emit(const OrdersState.successdone());
    }, failure: (error) {
      emit(OrdersState.erorrdone(erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:shipped
  shipped(int orderid, int userid) async {
    emit(const OrdersState.loadingshipped());
    final response = await _ordersRepo.shipped(orderid, userid);
    response.when(success: (data) {
      emit(const OrdersState.successshipped());
    }, failure: (error) {
      emit(OrdersState.erorrshipped(erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:viewdetails
  viewdetails(int orderid, int userid) async {
    emit(const OrdersState.loadingviewdetails());
    final response = await _ordersRepo.viewdetails(orderid, userid);
    response.when(success: (data) {
      emit(OrdersState.successviewdetails(data));
    }, failure: (error) {
      emit(OrdersState.erorrviewdetails(
          erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:viewapprove
  viewapprove() async {
    emit(const OrdersState.loadingviewapprove());
    final response = await _viewOrdersRepo.viewapprove();
    response.when(success: (data) {
      emit(OrdersState.successviewapprove(data.data ?? []));
    }, failure: (error) {
      emit(OrdersState.erorrviewapprove(
          erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:viewCancel
  viewCancel() async {
    emit(const OrdersState.loadingviewCancel());
    final response = await _viewOrdersRepo.viewCancel();
    response.when(success: (data) {
      emit(OrdersState.successviewCancel(data.data ?? []));
    }, failure: (error) {
      emit(OrdersState.erorrviewCancel(
          erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:viewdone
  viewdone() async {
    emit(const OrdersState.loadingviewdone());
    final response = await _viewOrdersRepo.viewdone();
    response.when(success: (data) {
      emit(OrdersState.successviewdone(data.data ?? []));
    }, failure: (error) {
      emit(OrdersState.erorrdone(erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:viewpending
  viewpending() async {
    emit(const OrdersState.loadingviewpending());
    final response = await _viewOrdersRepo.viewpending();
    response.when(success: (data) {
      emit(OrdersState.successviewpending(data.data ?? []));
    }, failure: (error) {
      emit(OrdersState.erorrviewdone(erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:viewprepare
  viewprepare() async {
    emit(const OrdersState.loadingviewprepare());
    final response = await _viewOrdersRepo.viewprepare();
    response.when(success: (data) {
      emit(OrdersState.successviewprepare(data.data ?? []));
    }, failure: (error) {
      emit(OrdersState.erorrviewprepare(
          erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:viewshipped
  viewshipped(String name, String namear, String old, file) async {
    emit(const OrdersState.loadingviewshipped());
    final response = await _viewOrdersRepo.viewshipped();
    response.when(success: (data) {
      emit(OrdersState.successviewshipped(data.data ?? []));
    }, failure: (error) {
      emit(OrdersState.erorrviewshipped(
          erorr: error.apiErrorModel.messege ?? ''));
    });
  }
}
