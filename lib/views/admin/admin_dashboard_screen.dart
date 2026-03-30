import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';
import 'package:wcms/viewmodels/admin/admin_dashboard_provider.dart';

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(adminDashboardItemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Waste Collection Admin Dashboard"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                if (items[index].title == items[0].title) {
                  Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.allComplainAdmin));
                } else if (items[index].title == items[1].title) {
                  Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.currentSchedulesAdmin));
                } else if (items[index].title == items[2].title) {
                  Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.schedulesRoutesAdmin));
                } else if (items[index].title == items[3].title) {
                  Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.addAdmin));
                } else if (items[index].title == items[4].title) {
                  Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.addDrivers));
                } else if (items[index].title == items[5].title) {
                  Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.addHelpers));
                } else if (items[index].title == items[6].title) {
                  Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.addVehicles));
                } else if (items[index].title == items[7].title) {
                  Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.manageTeamAdmin));
                } else if (items[index].title == items[7].title) {
                  Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.reportsAdmin));
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('You clicked on ${items[index].title}')),
                );
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        item.imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
