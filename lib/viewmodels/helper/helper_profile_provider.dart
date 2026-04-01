import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../api/helper/helper_profile_api_service.dart';
import '../../models/helper/helper_profile.dart';

// This would typically come from your login/auth store
final helperIdStoreProvider = StateProvider<String>((ref) => "901234567V");

final helperProfileProvider = FutureProvider<HelperProfile>((ref) async {
  final idNumber = ref.watch(helperIdStoreProvider);
  return await HelperProfileApiService().getProfile("901234567V");
});