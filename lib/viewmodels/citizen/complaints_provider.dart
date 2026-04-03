import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/api/citizen/citizen_complain_api_service.dart';

import '../../models/complain.dart';

class ComplainNotifier extends StateNotifier<List<Complain>> {
  ComplainNotifier() : super([]);

}

// Provider
final complainListProvider =
StateNotifierProvider<ComplainNotifier, List<Complain>>((ref) {
  return ComplainNotifier();
});

// UPDATED: FutureProvider using .family to accept a parameter
// You can now call this as: ref.watch(allComplaintsProvider(userID))
final allComplaintsProvider =
FutureProvider.family<List<Complain>, String>((ref, citizenId) async {

  final requestParams = Complain(
      complainTitle: '',
      complainIDNumber: '',
      citizenIDNumber: citizenId,
      complain: '',
      status: ''
  );

  // Calling the API service method we created
  final complaints = await CitizenComplainApiService().readAllComplaints(requestParams);

  // Optional: Update the StateNotifier list whenever the Future completes
  //ref.read(complainListProvider.notifier).setComplaints(complaints);

  // If you want to filter by the parameter 'idNumber' on the frontend:
  // return complaints.where((c) => c.citizenIDNumber == idNumber).toList();

  return complaints;
});