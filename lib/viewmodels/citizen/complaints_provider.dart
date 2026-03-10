import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/complain.dart';

class ComplainNotifier extends StateNotifier<List<Complain>> {
  ComplainNotifier() : super([]);


}

// Provider
final complainListProvider =
StateNotifierProvider<ComplainNotifier, List<Complain>>((ref) {
  return ComplainNotifier();
});
