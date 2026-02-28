import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/config/image_links.dart';

class DashboardItem {
  final String title;
  final String imagePath;

  DashboardItem({required this.title, required this.imagePath});
}

final adminDashboardItemsProvider = Provider<List<DashboardItem>>((ref) {
  return [
    DashboardItem(title: "All Complaints", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Current Schedules", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Schedules Routes", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Add Admin", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Add Drivers", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Add Helpers", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Add Vehicles", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Reports", imagePath: ImageLinks.loginScreenImage),
  ];
});
