import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import 'package:wcms/models/driver/driver_sign_in.dart';

class DriverSignInApiService {

  final Dio _dio = BaseApiService().getDio();

  // POST: Create a new citizen
  Future<DriverSignIn> createCitizenSignUpdate(DriverSignIn driverSignIn) async {
    try {
      final response = await _dio.post('api/citizen-sign-in/create-citizen-sign-in', data: driverSignIn.toJson());
      return DriverSignIn.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // POST: Check sign in register citizen
  Future<DriverSignIn> createAdminSign(DriverSignIn driverSignIn) async {
    try {
      final response = await _dio.post('api/citizen-sign-in/read-citizen-sign-in', data: driverSignIn.toJson());
      return DriverSignIn.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException e) {
    return e.response?.data['message'] ?? "An unexpected network error occurred";
  }
}
