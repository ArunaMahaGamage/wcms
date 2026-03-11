import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/config/image_links.dart';

class DashboardItem {
  final String title;
  final String imagePath;

  DashboardItem({required this.title, required this.imagePath});
}

final citizenDashboardItemsProvider = Provider<List<DashboardItem>>((ref) {
  return [
    DashboardItem(title: "Complaint", imagePath: ImageLinks.citizenDashboardComplain),
    DashboardItem(title: "Track Complaints", imagePath: ImageLinks.citizenDashboardTrackComplain),
    DashboardItem(title: "New Vehicle Routes", imagePath: ImageLinks.citizenDashboardNewVehicleRoutes),
    DashboardItem(title: "New Bin", imagePath: ImageLinks.citizenDashboardNewBin),
    DashboardItem(title: "Collection Schedule", imagePath: ImageLinks.citizenDashboardCollectionSchedule),
    DashboardItem(title: "Notification", imagePath: ImageLinks.citizenDashboardNotification),
    DashboardItem(title: "User Reports", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Recycling Tips", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Waste Statistics", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Policy Updates", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Environmental Impact", imagePath: ImageLinks.loginScreenImage),
    DashboardItem(title: "Environmental Law", imagePath: ImageLinks.citizenDashboardEnvironmentalLaw),
  ];
});
