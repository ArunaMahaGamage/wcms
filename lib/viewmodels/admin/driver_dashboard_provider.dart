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
    DashboardItem(title: "Complaints", imagePath: ImagePaths.driverDashboardComplain),
    DashboardItem(title: "Schedules", imagePath: ImagePaths.driverDashboardSchedule),
    DashboardItem(title: "Routes", imagePath: ImagePaths.driverDashboardRoutes),
    DashboardItem(title: "Drivers", imagePath: ImagePaths.driverDashboardDriver),
    DashboardItem(title: "Helpers", imagePath: ImagePaths.driverDashboardHelper),
    DashboardItem(title: "Reports", imagePath: ImagePaths.driverDashboardReports),
  ];
});
