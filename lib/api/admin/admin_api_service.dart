import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import 'package:wcms/models/admin/admin_model.dart';

class AdminApiService {
  final Dio _dio = BaseApiService().getDio();

  Future<void> createAdmin(AdminModel admin) async {
    try {
      await _dio.post('/api/admin/create-admin', data: admin.toJson());
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Failed to add administrator";
    }
  }
}