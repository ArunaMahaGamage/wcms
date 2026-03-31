import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import 'package:wcms/models/admin/admin_helper.dart';

class HelperApiService {
  final Dio _dio = BaseApiService().getDio();

  Future<AdminHelper> createHelper(AdminHelper helper) async {
    try {
      final response = await _dio.post('/api/helper/create-helper', data: helper.toJson());
      return AdminHelper.fromMap(response.data);
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Failed to add helper";
    }
  }

  Future<List<AdminHelper>> readAllHelper() async {
    try {
      final response = await _dio.post('/api/helper/read-all-helper');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((item) => AdminHelper.fromMap(item)).toList();
      } else {
        throw "Failed to load drivers";
      }
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Connection error";
    }
  }
}