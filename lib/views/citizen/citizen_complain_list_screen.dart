import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';
import '../../viewmodels/citizen/complaints_provider.dart';

class CitizenComplainListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final complaints = ref.watch(complainListProvider);

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () => Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.dashboardCitizen))
          ),
          title: Text("Track Complaints")),
      body: ListView.builder(
        itemCount: complaints.length,
        itemBuilder: (context, index) {
          final complaint = complaints[index];
          return Card(
            child: ListTile(
              title: Text("Complaint: ${complaint.complain}"),
              subtitle: Text(
                  "Citizen ID: ${complaint.citizenIDNumber}\nStatus: ${complaint.status}"),
            ),
          );
        },
      ),
    );
  }
}
