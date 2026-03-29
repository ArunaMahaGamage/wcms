import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/api/admin/admin_driver_api_service.dart';
import 'package:wcms/models/admin/admin_driver.dart';

// Notifier to handle the submission state
class DriverSubmitNotifier extends StateNotifier<AsyncValue<void>> {
  DriverSubmitNotifier() : super(const AsyncValue.data(null));

  Future<void> submit(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    try {
      final driver = AdminDriver.fromMap(data);
      await DriverApiService().createDriver(driver);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final driverSubmitProvider = StateNotifierProvider<DriverSubmitNotifier, AsyncValue<void>>((ref) {
  return DriverSubmitNotifier();
});