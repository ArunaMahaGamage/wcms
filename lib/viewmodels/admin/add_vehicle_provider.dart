// Notifier to handle the submission logic
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/api/admin/admin_vehicle_api_service.dart';
import 'package:wcms/models/admin/add_vehicle.dart';

class VehicleSubmitNotifier extends StateNotifier<AsyncValue<void>> {
  VehicleSubmitNotifier() : super(const AsyncValue.data(null));

  Future<void> submit(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    try {
      final vehicle = AddVehicle.fromMap(data);
      await AdminVehicleApiService().createVehicle(vehicle);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future readAllVehicle() async {
    state = const AsyncValue.loading();
    try {
      await AdminVehicleApiService().readAllVehicle();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

// The submission provider
final vehicleSubmitProvider = StateNotifierProvider<VehicleSubmitNotifier, AsyncValue<void>>((ref) {
  return VehicleSubmitNotifier();
});

final allVehicleProvider = FutureProvider<List<AddVehicle>>((ref) async {
  return await AdminVehicleApiService().readAllVehicle();
});