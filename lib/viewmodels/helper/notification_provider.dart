import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../api/helper/helper_notification_api_service.dart';
import '../../models/helper/helper_notification.dart';

// Assuming you have a way to get the logged-in helper's ID
final helperIdProvider = StateProvider<String>((ref) => "H-12345");

final helperNotificationsProvider = FutureProvider<List<HelperNotification>>((ref) async {
  final helperId = ref.watch(helperIdProvider);
  return await HelperNotificationApiService().getNotifications(helperId);
});