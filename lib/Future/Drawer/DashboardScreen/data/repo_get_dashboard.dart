import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../models/response_dashboard/response_dashboard.dart';

class DashboardRepo {
  final ApiService _apiService;

  DashboardRepo(this._apiService);

  Future<ApiResult<ResponseDashboard>> viewdashboard() async {
    try {
      final response = await _apiService.viewdashboard();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
