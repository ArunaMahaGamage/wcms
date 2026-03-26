import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/citizen/citizen_collection_schedule.dart';

// This provider simulates fetching data from an API
final collectionScheduleProvider = FutureProvider<List<CitizenCollectionSchedule>>((ref) async {
  // Simulate network delay
  await Future.delayed(const Duration(seconds: 1));

  // Mock Data - Replace this with your actual API call
  return [
    CitizenCollectionSchedule(
      day: "Monday",
      startTime: "08:00 AM",
      endTime: "10:00 AM",
      wasteType: "Organic Waste",
      vehicleNumber: "WP-6782",
      driverContact: "0712345678",
    ),
    CitizenCollectionSchedule(
      day: "Wednesday",
      startTime: "09:00 AM",
      endTime: "11:00 AM",
      wasteType: "Recyclables (Plastic/Paper)",
      vehicleNumber: "WP-1234",
      driverContact: "0771234567",
    ),
    CitizenCollectionSchedule(
      day: "Friday",
      startTime: "07:30 AM",
      endTime: "09:30 AM",
      wasteType: "General Waste",
      vehicleNumber: "WP-9988",
      driverContact: "0755554433",
    ),
  ];
});