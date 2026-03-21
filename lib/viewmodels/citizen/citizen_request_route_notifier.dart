import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/models/citizen/citizen_request_new_vehicle_route.dart';

// Notifier to handle the submission state (loading, success, error)
class CitizenRequestRouteNotifier extends StateNotifier<AsyncValue<void>> {
  CitizenRequestRouteNotifier() : super(const AsyncValue.data(null));

  Future<void> submitRequest(CitizenRequestNewVehicleRoute request) async {
    state = const AsyncValue.loading();
    try {
      // TODO: Add your API call here
      // await _apiService.postRouteRequest(request.toJson());

      await Future.delayed(const Duration(seconds: 2)); // Simulating network call
      state = const AsyncValue.data(null);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final requestRouteProvider = StateNotifierProvider<CitizenRequestRouteNotifier, AsyncValue<void>>((ref) {
  return CitizenRequestRouteNotifier();
});