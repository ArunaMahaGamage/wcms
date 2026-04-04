import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import 'package:wcms/models/admin/admin_schedule.dart';

class AdminScheduleApiService {
  final Dio _dio = BaseApiService().getDio();

  Future<void> createSchedule(Map<String, dynamic> scheduleData) async {
    try {
      // Endpoint matching your Spring Boot Controller @PostMapping
      await _dio.post('/api/schedule-new-route/create', data: scheduleData);
    } on DioException catch (e) {
      // Reusing your established error handling pattern
      throw e.response?.data['message'] ?? "Failed to create schedule";
    }
  }

  Future<List<AdminSchedule>> getAllSchedules() async {
    try {
      final response = await _dio.post('/api/schedule-new-route/read-all');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => AdminSchedule.fromJson(json)).toList();
      }
      return [];
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Failed to fetch schedules";
    }
  }
}