import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/config/image_links.dart';
import 'package:wcms/config/image_path.dart';

class DashboardItem {
  final String title;
  final String imagePath;

  DashboardItem({required this.title, required this.imagePath});
}

final adminDashboardItemsProvider = Provider<List<DashboardItem>>((ref) {
  return [
    DashboardItem(title: "All Complaints", imagePath: ImagePaths.adminDashboardComplain),
    DashboardItem(title: "Current Schedules", imagePath: ImagePaths.adminDashboardCurrentSchedules),
    DashboardItem(title: "Schedules Routes", imagePath: ImagePaths.adminDashboardSchedulesRoutes),
    DashboardItem(title: "Add Admin", imagePath: ImagePaths.adminDashboardAddAdmin),
    DashboardItem(title: "Add Drivers", imagePath: ImagePaths.adminDashboardAddDrivers),
    DashboardItem(title: "Add Helpers", imagePath: ImagePaths.adminDashboardAddHelpers),
    DashboardItem(title: "Add Vehicles", imagePath: ImagePaths.adminDashboardAddVehicles),
    DashboardItem(title: "Reports", imagePath: ImagePaths.adminDashboardReports),
  ];
});
