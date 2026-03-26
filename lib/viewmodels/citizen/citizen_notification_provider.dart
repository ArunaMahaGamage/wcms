import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/models/citizen/citizen_collection_notification.dart';

final collectionNotificationProvider = FutureProvider<List<CitizenCollectionNotification>>((ref) async {
  // Simulate API delay
  await Future.delayed(const Duration(milliseconds: 800));

  // Mock Data
  return [
    CitizenCollectionNotification(
      id: '1',
      title: 'Truck is nearby!',
      message: 'The collection vehicle WP-6782 is 500m away from your location.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      type: 'alert',
    ),
    CitizenCollectionNotification(
      id: '2',
      title: 'Schedule Update',
      message: 'Tomorrow\'s organic waste collection will start at 7:00 AM instead of 8:00 AM.',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      type: 'info',
      isRead: true,
    ),
    CitizenCollectionNotification(
      id: '3',
      title: 'Service Delay',
      message: 'Due to heavy rain, plastic collection in Zone B is delayed by 2 hours.',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      type: 'delay',
      isRead: true,
    ),
  ];
});