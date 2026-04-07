import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import 'package:wcms/models/driver/driver_profile.dart';

class DriverProfileApiService {
  final Dio _dio = BaseApiService().getDio();

  Future<DriverProfile> getProfile(String idNumber) async {
    try {
      // Sending the idNumber as a Key-Value pair in the POST body
      final response = await _dio.post(
        '/api/helper/read-helper',
        data: {'idNumber': idNumber},
      );

      if (response.statusCode == 200 && response.data != null) {
        return DriverProfile.fromMap(response.data);
      } else {
        throw "Helper profile not found";
      }
    } on DioException catch (e) {
      // Reusing your established error handling pattern
      throw e.response?.data['message'] ?? "Failed to load profile";
    }
  }
}