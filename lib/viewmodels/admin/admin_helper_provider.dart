import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/api/admin/admin_helper_api_service.dart';
import 'package:wcms/models/admin/admin_helper.dart';

// Notifier for submission state
class HelperSubmitNotifier extends StateNotifier<AsyncValue<void>> {
  HelperSubmitNotifier() : super(const AsyncValue.data(null));

  Future<void> submit(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    try {
      final helper = AdminHelper.fromMap(data);
      await HelperApiService().createHelper(helper);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> readAllHelper() async {
    state = const AsyncValue.loading();
    try {
      await HelperApiService().readAllHelper();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final helperSubmitProvider = StateNotifierProvider<HelperSubmitNotifier, AsyncValue<void>>((ref) {
  return HelperSubmitNotifier();
});

final allHelpersProvider = FutureProvider<List<AdminHelper>>((ref) async {
  return await HelperApiService().readAllHelper();
});