import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import '../../models/helper/helper_feedback.dart';

class HelperFeedbackApiService {
  final Dio _dio = BaseApiService().getDio();

  Future<void> submitFeedback(HelperFeedback feedback) async {
    try {
      await _dio.post('/api/feedback/submit', data: feedback.toJson());
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Failed to submit feedback";
    }
  }
}