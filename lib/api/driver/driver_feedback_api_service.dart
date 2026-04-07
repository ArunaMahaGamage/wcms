import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import 'package:wcms/models/driver/driver_feedback.dart';

class DriverFeedbackApiService {
  final Dio _dio = BaseApiService().getDio();

  Future<void> submitFeedback(DriverFeedback feedback) async {
    try {
      await _dio.post('/api/feedback/submit', data: feedback.toJson());
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Failed to submit feedback";
    }
  }
}