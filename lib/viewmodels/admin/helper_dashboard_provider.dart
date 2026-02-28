import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/config/image_links.dart';

class DashboardItem {
  final String title;
  final String imagePath;

  DashboardItem({required this.title, required this.imagePath});
}

final helperDashboardItemsProvider = Provider<List<DashboardItem>>((ref) {
  return [
    DashboardItem(title: "Complaints", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Schedules", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Routes", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Drivers", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Helpers", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Reports", imagePath: ImageLinks.loginScreenImage),
  ];
});
