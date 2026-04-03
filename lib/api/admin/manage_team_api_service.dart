import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import 'package:wcms/models/admin/manage_team.dart';

class ManageTeamApiService {
  final Dio _dio = BaseApiService().getDio();

  /// Reads team assignments filtered by Vehicle ID and Job Role
  /// POST: http://localhost:8080/api/manage-team/read-vehicle-job-role
  Future<List<ManageTeam>> readVehicleJobRole(String vehicleId, String jobRole) async {
    try {
      final response = await _dio.post(
        '/api/manage-team/read-vehicle-job-role',
        data: {
          'vehicleId': vehicleId,
          'jobRole': jobRole,
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((item) => ManageTeam.fromMap(item)).toList();
      } else {
        throw "Failed to load team data";
      }
    } on DioException catch (e) {
      // Reusing your established error handling pattern
      throw e.response?.data['message'] ?? "Connection error occurred while fetching team";
    }
  }
}