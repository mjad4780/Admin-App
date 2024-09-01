import 'dart:convert';

import 'package:retrofit/http.dart';
import 'package:untitled/models/notification_analysis/notification_analysis_model.dart';
import 'package:untitled/models/response_categories/response_categories.dart';
import 'package:untitled/models/response_coupon/response_coupon.dart';
import 'package:untitled/models/response_orders/response_orders.dart';
import 'package:untitled/models/response_poster/response_poster.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

import '../../models/response_dashpoard/response_dashpoard.dart';
import '../../models/response_detilas/response_detilas.dart';
import '../../models/response_notification/response_notification.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
/////////test/////////

  //Add
  @POST(ApiConstants.test)
  Future<dynamic> addimages(@Body() dynamic body);

  ///////////////Categories/////////////

  //Add
  @POST(ApiConstants.addCategories)
  Future<dynamic> addCategories(@Body() dynamic body);
  //edit
  @POST(ApiConstants.editCategories)
  Future<dynamic> editCategories(@Body() dynamic body);
  //delete
  @POST(ApiConstants.deleteCategories)
  Future<dynamic> deleteCategories(@Body() dynamic body);
  //View
  @GET(ApiConstants.getCategories)
  Future<ResponseCategories> viewCategories();

  ///////////////Items/////////////

  //Add
  @POST(ApiConstants.addItems)
  Future<dynamic> addItems(
    @Body() dynamic body,
  );
  //edit
  @POST(ApiConstants.editItems)
  Future<dynamic> editItems(@Body() dynamic body);
  //delete
  @POST(ApiConstants.deleteItems)
  Future<dynamic> deleteItems(@Body() dynamic body);

  ///////////////COUPON/////////////

  //Add
  @POST(ApiConstants.addCoupon)
  Future<dynamic> addCoupon(@Body() dynamic body);
  //View
  @GET(ApiConstants.getCoupon)
  Future<ResponseCoupon> getCoupon();

  ///////////////NOTEFICATION/////////////

  //Add
  @POST(ApiConstants.addnotification)
  Future<dynamic> addnotification(@Body() dynamic body);
  //View
  @GET(ApiConstants.getnotification)
  Future<ResponseNotification> getnotification();

  //viewAnalysis
  @POST(ApiConstants.getnotificationAnalysis)
  Future<NotificationAnalysisModel> viewAnalysis(@Body() dynamic body);

  ///////////////POSTER/////////////

  //Add
  @POST(ApiConstants.addposter)
  Future<dynamic> addposter(@Body() dynamic body);
  //View
  @GET(ApiConstants.getposter)
  Future<ResponsePoster> getposter();

  ///////////////VIEWORDERS/////////////
  //viewapprove
  @GET(ApiConstants.viewAllOrders)
  Future<ResponseOrders> viewAllOrders();
  //viewapprove
  @GET(ApiConstants.viewapprove)
  Future<ResponseOrders> viewapprove();
  //viewCancel
  @GET(ApiConstants.viewCancel)
  Future<ResponseOrders> viewCancel();
  //viewdetails
  @POST(ApiConstants.viewdetails)
  Future<ResponseDetails> viewdetails(@Body() dynamic body);
  //viewdone
  @GET(ApiConstants.viewdone)
  Future<ResponseOrders> viewdone();
  //viewpending
  @GET(ApiConstants.viewpending)
  Future<ResponseOrders> viewpending();
  //viewprepare
  @GET(ApiConstants.viewprepare)
  Future<ResponseOrders> viewprepare();
  //viewdone
  @GET(ApiConstants.viewshipped)
  Future<ResponseOrders> viewshipped();

  ///////////////ORDERS/////////////

  //approve
  @POST(ApiConstants.approve)
  Future<dynamic> approve(@Body() dynamic body);
  //prepare
  @POST(ApiConstants.prepare)
  Future<dynamic> prepare(@Body() dynamic body);
  //shipped
  @POST(ApiConstants.shipped)
  Future<dynamic> shipped(@Body() dynamic body);
  //done
  @POST(ApiConstants.done)
  Future<dynamic> done(@Body() dynamic body);
  ////////////////////dashboard////////
  //viewdone
  @GET(ApiConstants.viewdashboard)
  Future<ResponseDashpoard> viewdashboard();
}
