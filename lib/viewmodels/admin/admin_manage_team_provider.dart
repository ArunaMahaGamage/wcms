import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/api/admin/admin_manage_team_api_service.dart';
import 'package:wcms/models/admin/manage_team.dart';

// To hold the form data state
final teamFormProvider = StateProvider<Map<String, dynamic>>((ref) => {
  'vehicleId': '',
  'idNumber': '',
  'jobRole': 'Driver',
});

// To handle the submission process
final teamSubmitProvider = StateNotifierProvider<TeamSubmitNotifier, AsyncValue<void>>((ref) {
  return TeamSubmitNotifier();
});

class TeamSubmitNotifier extends StateNotifier<AsyncValue<void>> {
  TeamSubmitNotifier() : super(const AsyncValue.data(null));

  Future<void> submit(Map<String, dynamic> data) async {
    state = const AsyncValue.loading();
    try {
      await AdminManageTeamApiService().assignTeamMember(ManageTeam.fromMap(data));
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}