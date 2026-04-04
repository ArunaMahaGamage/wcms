import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/api/admin/admin_schedule_api_service.dart';
import '../../models/admin/admin_schedule.dart';

/*final allSchedulesProvider = FutureProvider<List<AdminSchedule>>((ref) async {
  // Simulating API Call
  await Future.delayed(const Duration(seconds: 1));

  return [
    AdminSchedule(
        id: 1,
        zoneName: "Zone A - Ward 05",
        dayOfWeek: "Monday",
        startTime: "08:00 AM - 10:00 AM",
        wasteType: "Organic",
        vehicleId: "WP-6782",
        driverId: "Saman Perera"
    ),
    AdminSchedule(
        id: 2,
        zoneName: "Zone B - Main St",
        dayOfWeek: "Wednesday",
        startTime: "09:00 AM - 11:00 AM",
        wasteType: "Recyclable",
        vehicleId: "WP-1234",
        driverId: "Kamal Silva"
    ),
  ];
});*/

final allSchedulesProvider = FutureProvider<List<AdminSchedule>>((ref) async {
  return await AdminScheduleApiService().getAllSchedules();
});

final scheduleDayFilterProvider = StateProvider<String>((ref) => 'All');