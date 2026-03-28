import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/admin/admin_schedule.dart';

final allSchedulesProvider = FutureProvider<List<AdminSchedule>>((ref) async {
  // Simulating API Call
  await Future.delayed(const Duration(seconds: 1));

  return [
    AdminSchedule(
        id: 1,
        zone: "Zone A - Ward 05",
        day: "Monday",
        timeSlot: "08:00 AM - 10:00 AM",
        wasteType: "Organic",
        vehicleNumber: "WP-6782",
        driverName: "Saman Perera"
    ),
    AdminSchedule(
        id: 2,
        zone: "Zone B - Main St",
        day: "Wednesday",
        timeSlot: "09:00 AM - 11:00 AM",
        wasteType: "Recyclable",
        vehicleNumber: "WP-1234",
        driverName: "Kamal Silva"
    ),
  ];
});

final scheduleDayFilterProvider = StateProvider<String>((ref) => 'All');