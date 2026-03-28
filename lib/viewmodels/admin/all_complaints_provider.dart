import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/api/admin/admin_complain_api_service.dart';
import 'package:wcms/models/admin/admin_complain.dart';

// Provider to fetch all complaints
/*final allComplaintsProvider = FutureProvider<List<AdminComplaint>>((ref) async {
  // Simulating API Call
  await Future.delayed(const Duration(seconds: 1));

  return [
    AdminComplaint(id: 101, citizenName: "Aruna Gamage", idNumber: "951234567V", complain: "Garbage not collected for 3 days in Ward 5.", status: "Pending", createdAt: DateTime.now().subtract(const Duration(hours: 5))),
    AdminComplaint(id: 102, citizenName: "John Doe", idNumber: "882233445V", complain: "Broken bin at Main Street intersection.", status: "In-Progress", createdAt: DateTime.now().subtract(const Duration(days: 1))),
    AdminComplaint(id: 103, citizenName: "Jane Smith", idNumber: "991122334V", complain: "Illegal dumping reported near the park.", status: "Resolved", createdAt: DateTime.now().subtract(const Duration(days: 2))),
  ];
});*/

// StateProvider for filtering (All, Pending, Resolved)
final complaintFilterProvider = StateProvider<String>((ref) => 'All');

final allComplaintsProvider = FutureProvider<List<AdminComplain>>((ref) async {

  // Calling the API service method to fetch all complaints from the database
  final complaints = await AdminComplainApiService().readAllComplaints();

  return complaints;
});