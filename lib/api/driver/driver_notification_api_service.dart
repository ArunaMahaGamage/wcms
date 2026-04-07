import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import 'package:wcms/models/driver/driver_notification.dart';

class DriverNotificationApiService {
  final Dio _dio = BaseApiService().getDio();

  /*Future<List<HelperNotification>> getNotifications(String helperId) async {
    try {
      final response = await _dio.get('/api/helper/notifications/$helperId');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((item) => HelperNotification.fromMap(item)).toList();
      }
      return [];
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Failed to fetch notifications";
    }
  }*/

  Future<List<DriverNotification>> getNotifications(String idNumber) async {
    try {
      // Sending the idNumber as a Key-Value pair in the POST body
      final response = await _dio.post(
        '/api/notification/read-all',
        data: {'idNumber': idNumber},
      );

      if (response.statusCode == 200 && response.data != null) {
        List<dynamic> data = response.data;
        return data.map((item) => DriverNotification.fromMap(item)).toList();
      } else {
        throw "Helper profile not found";
      }
    } on DioException catch (e) {
      // Reusing your established error handling pattern
      throw e.response?.data['message'] ?? "Failed to load profile";
    }
  }
}