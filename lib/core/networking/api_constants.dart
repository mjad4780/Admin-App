class ApiConstants {
  static const String baseUrl = "http://localhost/e-ecommerse";

//ده خاص باالاميلوتر لانه غير مرفوع علي استضافه
  static const String test = "$baseUrl/admin/items/test.php";
  ////////////////admin////////////

  //notification
  static const String addnotification = '$baseUrl/admin/notification/add.php';
  static const String getnotification =
      '$baseUrl/admin/notification/get_notification.php';

//image
  static const String imageCat = '$baseUrl/upload/categories';
  static const String imageItem = '$baseUrl/upload/item';
  static const String imageposter = '$baseUrl/upload/poster';

//Categories
  static const String addCategories = '$baseUrl/admin/categories/add.php';
  static const String getCategories = '$baseUrl/admin/categories/view.php';
  static const String editCategories = '$baseUrl/admin/categories/edit.php';
  static const String deleteCategories = '$baseUrl/admin/categories/delete.php';

//coupon
  static const String addCoupon = '$baseUrl/admin/copon/add.php';
  static const String getCoupon = '$baseUrl/admin/copon/get.php';

  //Items
  static const String addItems = '$baseUrl/admin/items/add.php';
  static const String getItems = '$baseUrl/admin/items/view.php';
  static const String editItems = '$baseUrl/admin/items/edit.php';
  static const String deleteItems = '$baseUrl/admin/items/delete.php';

  //poster
  static const String addposter = '$baseUrl/admin/poster/add.php';
  static const String getposter = '$baseUrl/admin/poster/get.php';

  //orders
  static const String approve = '$baseUrl/admin/orders/approve.php';
  static const String done = '$baseUrl/admin/orders/done.php';
  static const String prepare = '$baseUrl/admin/orders/prepare.php';
  static const String shipped = '$baseUrl/admin/orders/shipped.php';

  //viewOrders
  static const String viewAllOrders = '$baseUrl/admin/orders/all_orders.php';
  static const String viewapprove = '$baseUrl/admin/orders/viewapprove.php';
  static const String viewdone = '$baseUrl/admin/orders/viewdone.php';
  static const String viewCancel = '$baseUrl/admin/orders/viewCancel.php';
  static const String viewpending = '$baseUrl/admin/orders/viewpending.php';
  static const String viewprepare = '$baseUrl/admin/orders/viewprepare.php';
  static const String viewshipped = '$baseUrl/admin/orders/viewshipped.php';
  static const String viewdetails = '$baseUrl/admin/orders/viewdetails.php';
  //dashboard
  static const String viewdashboard =
      '$baseUrl/admin/dashboard/get_dashboard.php';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
