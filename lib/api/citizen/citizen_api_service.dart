import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import 'package:wcms/models/citizen/citizen.dart';

class CitizenApiService {

  final Dio _dio = BaseApiService().getDio();

  // POST: Create a new citizen
  Future<Citizen> createCitizen(Citizen citizen) async {
    try {
      final response = await _dio.post('/api/citizen/create-citizen', data: citizen.toJson());
      return Citizen.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  String _handleError(DioException e) {
    return e.response?.data['message'] ?? "An unexpected network error occurred";
  }
}
