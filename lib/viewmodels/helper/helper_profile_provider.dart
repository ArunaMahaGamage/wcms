import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/viewmodels/helper/helper_sign_in_provider.dart';
import '../../api/helper/helper_profile_api_service.dart';
import '../../models/helper/helper_profile.dart';

// This would typically come from your login/auth store

final helperProfileProvider = FutureProvider<HelperProfile>((ref) async {
  final helperSignInStore = ref.watch(helperSignInStoreProvider);
  final helperId = helperSignInStore?.idNumber ?? '';
  return await HelperProfileApiService().getProfile(helperId);
});