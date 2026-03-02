import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';
import 'package:wcms/viewmodels/citizen/citizen_dashboard_provider.dart';

class CitizenDashboardScreen extends ConsumerWidget {
  const CitizenDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(citizenDashboardItemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Waste Collection Dashboard"),
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
                  Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.complaintCitizen));
                } else if (items[index].title == items[1].title) {

                } else if (items[index].title == items[2].title) {

                } else if (items[index].title == items[3].title) {

                } else if (items[index].title == items[4].title) {

                } else if (items[index].title == items[5].title) {

                } else if (items[index].title == items[6].title) {

                } else if (items[index].title == items[7].title) {

                } else if (items[index].title == items[8].title) {

                } else if (items[index].title == items[9].title) {

                } else if (items[index].title == items[10].title) {

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
                      child: Image.network(
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
