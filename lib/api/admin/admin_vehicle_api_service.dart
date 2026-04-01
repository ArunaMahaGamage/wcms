import 'package:dio/dio.dart';
import 'package:wcms/api/base_api_service.dart';
import 'package:wcms/models/admin/add_vehicle.dart';

class AdminVehicleApiService {
  final Dio _dio = BaseApiService().getDio();

  Future<AddVehicle> createVehicle(AddVehicle vehicle) async {
    try {
      // Endpoint likely matching your Java backend structure
      final response = await _dio.post('/api/vehicle/addVehicle', data: vehicle.toJson());
      return AddVehicle.fromMap(response.data);
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Failed to create vehicle";
    }
  }

  Future<List<AddVehicle>> readAllVehicle() async {
    try {
      final response = await _dio.post('/api/vehicle/read-all-vehicle');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((item) => AddVehicle.fromMap(item)).toList();
      } else {
        throw "Failed to load drivers";
      }
    } on DioException catch (e) {
      throw e.response?.data['message'] ?? "Connection error";
    }
  }
}