import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';
import 'package:intl/intl.dart';
import 'package:wcms/viewmodels/citizen/citizen_notification_provider.dart'; // Add to pubspec.yaml for date formatting

class CitizenNotificationScreen extends ConsumerWidget {
  const CitizenNotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationAsync = ref.watch(collectionNotificationProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, Routes.dashboardCitizen),
        ),
        title: const Text("Notifications"),
        centerTitle: true,
        /*actions: [
          IconButton(
            icon: const Icon(Icons.done_all),
            onPressed: () {
              // Logic to mark all as read
            },
          )
        ],*/
      ),
      body: notificationAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (notifications) {
          if (notifications.isEmpty) {
            return const Center(
              child: Text("No notifications at the moment."),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: notifications.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final item = notifications[index];

              // Define icon and color based on type
              IconData iconData;
              Color iconColor;
              switch (item.type) {
                case 'alert':
                  iconData = Icons.notifications_active;
                  iconColor = Colors.orange;
                  break;
                case 'delay':
                  iconData = Icons.warning_amber_rounded;
                  iconColor = Colors.red;
                  break;
                default:
                  iconData = Icons.info_outline;
                  iconColor = Colors.blue;
              }

              return Card(
                elevation: item.isRead ? 1 : 3,
                color: item.isRead ? Colors.grey[50] : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: item.isRead
                      ? BorderSide.none
                      : BorderSide(color: iconColor.withOpacity(0.3), width: 1),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: CircleAvatar(
                    backgroundColor: iconColor.withOpacity(0.1),
                    child: Icon(iconData, color: iconColor),
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                      fontWeight: item.isRead ? FontWeight.normal : FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(item.message),
                      const SizedBox(height: 8),
                      Text(
                        //DateFormat('dd MMM, hh:mm a').format(item.timestamp),
                        item.type,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Logic to mark as read or navigate to details
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}