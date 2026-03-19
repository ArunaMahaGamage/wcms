import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/config/image_links.dart';
import 'package:wcms/config/image_path.dart';

class DashboardItem {
  final String title;
  final String imagePath;

  DashboardItem({required this.title, required this.imagePath});
}

final helperDashboardItemsProvider = Provider<List<DashboardItem>>((ref) {
  return [
    DashboardItem(title: "Work feedback", imagePath: ImagePaths.loginScreenImage),
    DashboardItem(title: "Helper Notification", imagePath: ImagePaths.loginScreenImage),
    DashboardItem(title: "Helper Profile", imagePath: ImagePaths.loginScreenImage),
  ];
});
