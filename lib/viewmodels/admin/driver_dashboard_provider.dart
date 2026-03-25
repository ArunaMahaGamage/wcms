import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/config/image_links.dart';
import 'package:wcms/config/image_path.dart';

class DashboardItem {
  final String title;
  final String imagePath;

  DashboardItem({required this.title, required this.imagePath});
}

final driverDashboardItemsProvider = Provider<List<DashboardItem>>((ref) {
  return [
    DashboardItem(title: "Work feedback", imagePath: ImagePaths.driverDashboardFeedback),
    DashboardItem(title: "Notification", imagePath: ImagePaths.driverDashboardNotification),
    DashboardItem(title: "Drivers Profile", imagePath: ImagePaths.driverDashboardDriver),
  ];
});
