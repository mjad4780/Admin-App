import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final orderFormKey = GlobalKey<FormState>();
  TextEditingController trackingUrlCtrl = TextEditingController();
  String selectedOrderStatus = 'pending';
  String playerId = '';

  List<String> item = [
    'All order',
    'pending',
    'been approved',
    'prepare',
    'shipped',
    'done',
    'Cancelled'
  ];
  String? dataOrder = 'All order';
  filterOrders(String value) {
    if (value == 'All order') {
      viewAllOrders();
      dataOrder = value;
    } else if (value == 'pending') {
      viewpending();
      dataOrder = value;
    } else if (value == 'been approved') {
      viewapprove();
      dataOrder = value;
    } else if (value == 'prepare') {
      viewprepare();
      dataOrder = value;
    } else if (value == 'shipped') {
      viewshipped();
      dataOrder = value;
    } else if (value == 'done') {
      viewdone();
      dataOrder = value;
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
    emit(const OrdersState.updateInt());
  }

  // String? updateStatus;

  updatestatus(String value) {
    if (value == 'pending') {
      selectedOrderStatus = 'pending';
    } else if (value == 'been approved') {
      selectedOrderStatus = 'been approved';
    } else if (value == 'prepare') {
      selectedOrderStatus = 'prepare';
    } else if (value == 'shipped') {
      selectedOrderStatus = 'shipped';
    } else if (value == 'done') {
      selectedOrderStatus = 'done';
    } else {}
    emit(const OrdersState.updateString());
  }

  updateOrders(int orderid, int userid, int type, String playerId) {
    if (selectedOrderStatus == 'pending') {
    } else if (selectedOrderStatus == 'been approved') {
      approve(orderid, userid, playerId);
    } else if (selectedOrderStatus == 'prepare') {
      prepare(orderid, userid, type, playerId);
    } else if (selectedOrderStatus == 'shipped') {
      shipped(orderid, userid, playerId);
    } else if (selectedOrderStatus == 'done') {
      done(orderid, userid, playerId);
    } else {}
  }

  ///:approve
  approve(int orderid, int userid, String playerId) async {
    emit(const OrdersState.loadingUpdate());
    final response = await _ordersRepo.approve(orderid, userid, playerId);
    response.when(success: (data) {
      emit(const OrdersState.successUpdate());
    }, failure: (error) {
      emit(OrdersState.erorrUpdate(erorr: error.messege ?? ''));
    });
  }

  ///:prepare
  prepare(int orderid, int userid, int type, String playerId) async {
    emit(const OrdersState.loadingUpdate());
    final response = await _ordersRepo.prepare(type, orderid, userid, playerId);
    response.when(success: (data) {
      emit(const OrdersState.successUpdate());
    }, failure: (error) {
      emit(OrdersState.erorrUpdate(erorr: error.messege ?? ''));
    });
  }

  ///:done
  done(int orderid, int userid, String playerId) async {
    emit(const OrdersState.loadingUpdate());
    final response = await _ordersRepo.done(orderid, userid, playerId);
    response.when(success: (data) {
      emit(const OrdersState.successUpdate());
    }, failure: (error) {
      emit(OrdersState.erorrUpdate(erorr: error.messege ?? ''));
    });
  }

  ///:shipped
  shipped(int orderid, int userid, String playerId) async {
    emit(const OrdersState.loadingUpdate());
    final response = await _ordersRepo.shipped(orderid, userid, playerId);
    response.when(success: (data) {
      emit(const OrdersState.successUpdate());
    }, failure: (error) {
      emit(OrdersState.erorrUpdate(erorr: error.messege ?? ''));
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
      emit(OrdersState.erorrviewdetails(erorr: error.messege ?? ''));
    });
  }

  ///:viewAllOrders
  viewAllOrders() async {
    itemorders.clear();
    emit(const OrdersState.loadingviewAllOrders());
    final response = await _viewOrdersRepo.viewAllOrders();
    response.when(success: (data) {
      itemorders = data.data ?? [];
      emit(OrdersState.successviewAllOrders(data.data ?? []));
    }, failure: (error) {
      emit(OrdersState.erorrviewAllOrders(erorr: error.messege ?? ''));
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
      emit(OrdersState.erorrviewapprove(erorr: error.messege ?? ''));
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
      emit(OrdersState.erorrviewCancel(erorr: error.messege ?? ''));
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
      emit(OrdersState.erorrviewdone(erorr: error.messege ?? ''));
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
      emit(OrdersState.erorrviewdone(erorr: error.messege ?? ''));
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
      emit(OrdersState.erorrviewprepare(erorr: error.messege ?? ''));
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
      emit(OrdersState.erorrviewshipped(erorr: error.messege ?? ''));
    });
  }
}
