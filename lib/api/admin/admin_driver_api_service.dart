import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import 'package:wcms/models/admin/admin_driver.dart';

class DriverApiService {
  final Dio _dio = BaseApiService().getDio();

  Future<void> createDriver(AdminDriver driver) async {
    try {
      await _dio.post('/api/driver/create-driver', data: driver.toJson());
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Failed to add driver";
    }
  }
}