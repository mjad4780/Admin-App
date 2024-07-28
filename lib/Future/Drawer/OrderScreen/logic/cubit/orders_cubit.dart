import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../models/response_orders/datum.dart';
import '../../data/repo_orders.dart';
import '../../data/repo_view_order.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this._ordersRepo, this._viewOrdersRepo)
      : super(const OrdersState.initial());
  final OrdersRepo _ordersRepo;
  final ViewOrdersRepo _viewOrdersRepo;
  List<Datum> itemorders = [];

  final orderFormKey = GlobalKey<FormState>();
  TextEditingController trackingUrlCtrl = TextEditingController();
  String selectedOrderStatus = 'pending';
  List<Datum> orderData = [
    const Datum(
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
    'done',
    'Cancelled'
  ];

  filterOrders(String value) {
    if (value == 'pending') {
      viewpending();
    } else if (value == 'been approved') {
      viewapprove();
    } else if (value == 'prepare') {
      viewprepare();
    } else if (value == 'shipped') {
      viewshipped();
    } else if (value == 'done') {
      viewdone();
    } else {
      viewCancel();
    }
  }

  orderStatus(int status) {
    if (status == 0) {
      selectedOrderStatus = 'pending';
    } else if (status == 1) {
      selectedOrderStatus = 'been approved';
    } else if (status == 2) {
      selectedOrderStatus = 'prepare';
    } else if (status == 3) {
      selectedOrderStatus = 'shipped';
    } else if (status == 4) {
      selectedOrderStatus = 'done';
    } else {
      selectedOrderStatus = 'Cancelled';
    }
  }

  String? status;

  updatestatus(String value) {
    if (value == 'pending') {
      status = 'pending';
    } else if (value == 'been approved') {
      status = 'been approved';
    } else if (value == 'prepare') {
      status = 'prepare';
    } else if (value == 'shipped') {
      status = 'shipped';
    } else if (value == 'done') {
      status = 'done';
    } else {}
  }

  updateOrders(int orderid, int userid, int type) {
    if (status == 'pending') {
    } else if (status == 'been approved') {
      approve(orderid, userid);
    } else if (status == 'prepare') {
      prepare(orderid, userid, type);
    } else if (status == 'shipped') {
      shipped(orderid, userid);
    } else if (status == 'done') {
      done(orderid, userid);
    } else {}
  }

  ///:approve
  approve(int orderid, int userid) async {
    emit(const OrdersState.loadingapprove());
    final response = await _ordersRepo.approve(orderid, userid);
    response.when(success: (data) {
      emit(const OrdersState.successapprove());
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
    final response = await _ordersRepo.viewdetails(
      orderid,
    );
    response.when(success: (data) {
      emit(OrdersState.successviewdetails(data.data ?? []));
    }, failure: (error) {
      emit(OrdersState.erorrviewdetails(
          erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:viewapprove
  viewapprove() async {
    itemorders.clear();
    emit(const OrdersState.loadingviewapprove());
    final response = await _viewOrdersRepo.viewapprove();
    response.when(success: (data) {
      itemorders = data.data ?? [];
      emit(OrdersState.successviewapprove(data.data ?? []));
    }, failure: (error) {
      emit(OrdersState.erorrviewapprove(
          erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:viewCancel
  viewCancel() async {
    itemorders.clear();

    emit(const OrdersState.loadingviewCancel());
    final response = await _viewOrdersRepo.viewCancel();
    response.when(success: (data) {
      itemorders = data.data ?? [];

      emit(OrdersState.successviewCancel(data.data ?? []));
    }, failure: (error) {
      emit(OrdersState.erorrviewCancel(
          erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:viewdone
  viewdone() async {
    itemorders.clear();

    emit(const OrdersState.loadingviewdone());
    final response = await _viewOrdersRepo.viewdone();
    response.when(success: (data) {
      itemorders = data.data ?? [];

      emit(OrdersState.successviewdone(data.data ?? []));
    }, failure: (error) {
      emit(OrdersState.erorrdone(erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:viewpending
  viewpending() async {
    itemorders.clear();

    emit(const OrdersState.loadingviewpending());
    final response = await _viewOrdersRepo.viewpending();
    response.when(success: (data) {
      itemorders = data.data ?? [];

      emit(OrdersState.successviewpending(data.data ?? []));
    }, failure: (error) {
      emit(OrdersState.erorrviewdone(erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:viewprepare
  viewprepare() async {
    itemorders.clear();

    emit(const OrdersState.loadingviewprepare());
    final response = await _viewOrdersRepo.viewprepare();
    response.when(success: (data) {
      itemorders = data.data ?? [];

      emit(OrdersState.successviewprepare(data.data ?? []));
    }, failure: (error) {
      emit(OrdersState.erorrviewprepare(
          erorr: error.apiErrorModel.messege ?? ''));
    });
  }

  ///:viewshipped
  viewshipped() async {
    itemorders.clear();
    emit(const OrdersState.loadingviewshipped());
    final response = await _viewOrdersRepo.viewshipped();
    response.when(success: (data) {
      itemorders = data.data ?? [];

      emit(OrdersState.successviewshipped(data.data ?? []));
    }, failure: (error) {
      emit(OrdersState.erorrviewshipped(
          erorr: error.apiErrorModel.messege ?? ''));
    });
  }
}
