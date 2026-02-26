import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/complain.dart';

class ComplainNotifier extends StateNotifier<List<Complain>> {
  ComplainNotifier() : super([]);

  // Add a new complaint
  void addComplaint(Complain complaint) {
    state = [...state, complaint];
  }

  // Update complaint status or details
  void updateComplaint(int id, Complain updatedComplaint) {
    state = [
      for (final c in state)
        if (c.id == id) updatedComplaint else c,
    ];
  }

  // Remove a complaint
  void removeComplaint(int id) {
    state = state.where((c) => c.id != id).toList();
  }

  // Find complaint by ID
  Complain? getComplaintById(int id) {
    return state.firstWhere((c) => c.id == id, orElse: () => null as Complain);
  }
}

// Provider
final complainListProvider =
StateNotifierProvider<ComplainNotifier, List<Complain>>((ref) {
  return ComplainNotifier();
});
