import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import 'package:wcms/models/helper/helper_sign_in.dart';

class HelperSignInApiService {

  final Dio _dio = BaseApiService().getDio();

  // POST: Create a new citizen
  Future<HelperSignIn> createCitizenSignUpdate(HelperSignIn citizenSignIn) async {
    try {
      final response = await _dio.post('api/citizen-sign-in/create-citizen-sign-in', data: citizenSignIn.toJson());
      return HelperSignIn.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // POST: Check sign in register citizen
  Future<HelperSignIn> createHelperSign(HelperSignIn citizenSignIn) async {
    try {
      final response = await _dio.post('api/citizen-sign-in/read-citizen-sign-in', data: citizenSignIn.toJson());
      return HelperSignIn.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException e) {
    return e.response?.data['message'] ?? "An unexpected network error occurred";
  }
}
