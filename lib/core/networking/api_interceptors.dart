import 'package:dio/dio.dart';

import '../class/cache_helper.dart';
import '../get_it/get_it.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//options.queryParameters[]

    options.headers['Accept-Language'] = "en";

    options.headers['Content-Type'] = "application/json";

    options.headers['Authorization'] =
        getIt<CacheHelper>().getDataString(key: 'token');

    super.onRequest(options, handler);
  }
}
