import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import '../../models/helper/helper_profile.dart';

class HelperProfileApiService {
  final Dio _dio = BaseApiService().getDio();

  Future<HelperProfile> getProfile(String idNumber) async {
    try {
      // Assuming endpoint: /api/helper/profile/{idNumber}
      final response = await _dio.get('/api/helper/profile/$idNumber');
      return HelperProfile.fromMap(response.data);
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Failed to load profile";
    }
  }
}