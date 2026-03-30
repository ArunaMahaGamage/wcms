import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import 'package:wcms/models/admin/manage_team.dart';

class AdminManageTeamApiService {
  final Dio _dio = BaseApiService().getDio();

  Future<void> assignTeamMember(ManageTeam team) async {
    try {
      await _dio.post('/api/manage-team/create', data: team.toJson());
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Failed to assign team member";
    }
  }

  Future<List<ManageTeam>> getAllTeamAssignments() async {
    try {
      final response = await _dio.get('/api/manage-team/all');
      return (response.data as List).map((e) => ManageTeam.fromMap(e)).toList();
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Failed to fetch team";
    }
  }
}