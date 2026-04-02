import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/viewmodels/helper/helper_sign_in_provider.dart';
import '../../api/helper/helper_notification_api_service.dart';
import '../../models/helper/helper_notification.dart';

// Assuming you have a way to get the logged-in helper's ID

final helperNotificationsProvider = FutureProvider<List<HelperNotification>>((ref) async {
  final helperSignInStore = ref.watch(helperSignInStoreProvider);
  final helperId = helperSignInStore?.idNumber ?? '';

  return await HelperNotificationApiService().getNotifications(helperId);
});