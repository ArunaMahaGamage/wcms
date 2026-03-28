import 'package:flutter_riverpod/flutter_riverpod.dart';

// Form State Provider
final scheduleFormProvider = StateProvider.autoDispose<Map<String, dynamic>>((ref) => {
  'zoneName': '',
  'dayOfWeek': 'Monday',
  'startTime': '',
  'endTime': '',
  'wasteType': 'Organic',
  'vehicleId': '',
  'driverId': '',
});

// Submission Notifier
class ScheduleRouteNotifier extends StateNotifier<AsyncValue<void>> {
  ScheduleRouteNotifier() : super(const AsyncValue.data(null));

  Future<void> submitSchedule(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    try {
      // Simulate API call to backend
      await Future.delayed(const Duration(seconds: 2));
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final scheduleRouteSubmitProvider = StateNotifierProvider<ScheduleRouteNotifier, AsyncValue<void>>((ref) {
  return ScheduleRouteNotifier();
});