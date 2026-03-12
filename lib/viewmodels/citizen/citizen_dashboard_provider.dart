import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/config/image_links.dart';
import 'package:wcms/config/image_path.dart';

class DashboardItem {
  final String title;
  final String imagePath;

  DashboardItem({required this.title, required this.imagePath});
}

final citizenDashboardItemsProvider = Provider<List<DashboardItem>>((ref) {
  return [
    DashboardItem(title: "Complaint", imagePath: ImagePaths.citizenDashboardComplain),
    DashboardItem(title: "Track Complaints", imagePath: ImagePaths.citizenDashboardTrackComplain),
    DashboardItem(title: "New Vehicle Routes", imagePath: ImagePaths.citizenDashboardNewVehicleRoutes),
    DashboardItem(title: "New Bin", imagePath: ImagePaths.citizenDashboardNewBin),
    DashboardItem(title: "Collection Schedule", imagePath: ImagePaths.citizenDashboardCollectionSchedule),
    DashboardItem(title: "Notification", imagePath: ImagePaths.citizenDashboardNotification),
    DashboardItem(title: "User Reports", imagePath: ImagePaths.loginScreenImage),
    DashboardItem(title: "Recycling Tips", imagePath: ImagePaths.citizenDashboardRecyclingTips),
    DashboardItem(title: "Waste Statistics", imagePath: ImagePaths.loginScreenImage),
    DashboardItem(title: "Policy Updates", imagePath: ImagePaths.citizenDashboardPolicyUpdates),
    DashboardItem(title: "Environmental Impact", imagePath: ImagePaths.citizenDashboardEnvironmentalImpact),
    DashboardItem(title: "Environmental Law", imagePath: ImagePaths.citizenDashboardEnvironmentalLaw),
  ];
});
