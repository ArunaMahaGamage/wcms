import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import '../../models/helper/helper_notification.dart';

class HelperNotificationApiService {
  final Dio _dio = BaseApiService().getDio();

  Future<List<HelperNotification>> getNotifications(String helperId) async {
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
  }
}