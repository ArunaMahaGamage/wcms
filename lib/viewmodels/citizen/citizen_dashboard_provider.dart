import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/config/image_links.dart';

class DashboardItem {
  final String title;
  final String imagePath;

  DashboardItem({required this.title, required this.imagePath});
}

final citizenDashboardItemsProvider = Provider<List<DashboardItem>>((ref) {
  return [
    DashboardItem(title: "Complaint", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Track Complaints", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "New Vehicle Routes", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "New Bin", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Collection Schedule", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Notification", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "User Reports", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Recycling Tips", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Waste Statistics", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Policy Updates", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Environmental Impact", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Environmental Law", imagePath: ImageLinks.loginScreenImage),
  ];
});
