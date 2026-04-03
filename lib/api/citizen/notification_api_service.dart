import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import '../../models/citizen/citizen_collection_notification.dart';

class NotificationApiService {
  final Dio _dio = BaseApiService().getDio();

  Future<List<CitizenCollectionNotification>> fetchNotifications(String citizenId) async {
    try {
      // Changed to POST and updated the endpoint path
      final response = await _dio.post(
        '/api/notification/read-all-id',
        data: {'idNumber': citizenId}, // Sending ID in the POST body
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data
            .map((json) => CitizenCollectionNotification.fromJson(json))
            .toList();
      }
      return [];
    } on DioException catch (e) {
      // Reusing your established error handling pattern
      throw e.response?.data['message'] ?? "Failed to load notifications";
    }
  }
}