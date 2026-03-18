import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import 'package:wcms/models/admin/admin_sign_in.dart';
import 'package:wcms/models/citizen/citizen_sign_in.dart';

class AdminSignInApiService {

  final Dio _dio = BaseApiService().getDio();

  // POST: Create a new citizen
  Future<CitizenSignIn> createCitizenSignUpdate(CitizenSignIn citizenSignIn) async {
    try {
      final response = await _dio.post('api/citizen-sign-in/create-citizen-sign-in', data: citizenSignIn.toJson());
      return CitizenSignIn.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // POST: Check sign in register citizen
  Future<AdminSignIn> readAdminSign(AdminSignIn adminSignIn) async {
    try {
      final response = await _dio.post('/api/administrator-sign-in/read-administrator-sign-in', data: adminSignIn.toJson());
      AdminSignIn.fromJson(response.data);
      return AdminSignIn.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException e) {
    return e.response?.data['message'] ?? "An unexpected network error occurred";
  }
}
