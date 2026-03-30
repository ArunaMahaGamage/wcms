import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/api/admin/admin_api_service.dart';
import 'package:wcms/models/admin/admin_model.dart';

// Notifier for submission
class AdminSubmitNotifier extends StateNotifier<AsyncValue<void>> {
  AdminSubmitNotifier() : super(const AsyncValue.data(null));

  Future<void> submit(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    try {
      final admin = AdminModel.fromMap(data);
      await AdminApiService().createAdmin(admin);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final adminSubmitProvider = StateNotifierProvider<AdminSubmitNotifier, AsyncValue<void>>((ref) {
  return AdminSubmitNotifier();
});