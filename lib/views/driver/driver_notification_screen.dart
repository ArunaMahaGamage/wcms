import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:wcms/core/routes.dart';
import '../../viewmodels/helper/notification_provider.dart';

class DriverNotificationScreen extends ConsumerWidget {
  const DriverNotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(helperNotificationsProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back), onPressed: () => Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.dashboardDriver))
        ),
        title: const Text("Helper Notifications"),
        centerTitle: true,
      ),
      body: notificationsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
        data: (notifications) {
          if (notifications.isEmpty) {
            return const Center(child: Text("No notifications available."));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: notifications.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final item = notifications[index];

              // Visual indicators based on notification type
              IconData iconData = Icons.notifications;
              Color iconColor = Colors.blue;
              if (item.type == 'alert') {
                iconData = Icons.warning_amber_rounded;
                iconColor = Colors.red;
              } else if (item.type == 'assignment') {
                iconData = Icons.assignment_turned_in;
                iconColor = Colors.green;
              }

              return Card(
                elevation: item.isRead ? 1 : 4,
                color: item.isRead ? Colors.grey[50] : Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: iconColor.withOpacity(0.1),
                    child: Icon(iconData, color: iconColor),
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                      fontWeight: item.isRead ? FontWeight.normal : FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(item.message),
                      const SizedBox(height: 8),
                      Text(
                        DateFormat('MMM dd, hh:mm a').format(item.sentAt),
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}