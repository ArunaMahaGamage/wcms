import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import 'package:wcms/models/admin/admin_driver.dart';

class DriverApiService {
  final Dio _dio = BaseApiService().getDio();

  Future<void> createDriver(AdminDriver driver) async {
    try {
      await _dio.post('/api/driver/addDriver', data: driver.toJson());
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Failed to add driver";
    }
  }

  Future<List<AdminDriver>> readAllDrivers() async {
    try {
      final response = await _dio.get('/api/driver/read-all-driver');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((item) => AdminDriver.fromMap(item)).toList();
      } else {
        throw "Failed to load drivers";
      }
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Connection error";
    }
  }
}