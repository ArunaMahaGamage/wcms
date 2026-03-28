import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import 'package:wcms/models/admin/admin_complain.dart';
import 'package:wcms/models/citizen/citizen.dart';
import 'package:wcms/models/citizen/citizen_sign_in.dart';
import 'package:wcms/models/complain.dart';

class AdminComplainApiService {

  final Dio _dio = BaseApiService().getDio();

  // POST: Create a new citizen
  Future<Complain> adminCitizenComplain(Complain complain) async {
    try {
      final response = await _dio.post('/api/complain/create-complain', data: complain.toJson());
      return Complain.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // POST: Check sign in register citizen
  Future<List<AdminComplain>> readAllComplaints() async {
    try {
      final response = await _dio.post('/api/complain/read-all-complain',);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((item) => AdminComplain.fromJson(item)).toList();
      } else {
        throw "Failed to load complaints";
      }
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException e) {
    return e.response?.data['message'] ?? "An unexpected network error occurred";
  }
}
