import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';
import 'package:wcms/models/complain.dart';
import 'package:wcms/viewmodels/citizen/citizen_sign_in_provider.dart';
import '../../viewmodels/citizen/complaints_provider.dart';

class CitizenComplainListScreen extends ConsumerWidget {
  const CitizenComplainListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watching the provider (assuming it returns a List of Complaint objects)
    //final complaints = ref.watch(complainListProvider);
    final citizenSignInStore = ref.watch(citizenSignInStoreProvider);
    final complaintsList = ref.watch(allComplaintsProvider(citizenSignInStore!.idNumber));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Future.microtask(
                () => Navigator.pushReplacementNamed(context, Routes.dashboardCitizen),
          ),
        ),
        title: const Text("Track Complaints"),
        centerTitle: true,
      ),
      body: complaintsList.when(
        data: (list) {
          if (list.isEmpty) {
            return _buildEmptyState();
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: list.length,
            itemBuilder: (context, index) {
              final complaint = list[index];
              return _buildComplaintCard(complaint, index);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text("Failed to load complaints: $error"),
        ),
      ),
      /*body: complaintsList.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: complaints.length,
        itemBuilder: (context, index) {
          final complaint = complaints[index];
          return _buildComplaintCard(complaint, index);
        },
      ),*/
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Typically navigate to the "Create Complaint" screen
          // Navigator.pushNamed(context, Routes.createComplaint);
        },
        child: const Icon(Icons.add_comment),
        tooltip: "New Complaint",
      ),*/
    );
  }

  Widget _buildComplaintCard(dynamic complaint, int index) {
    // Determine status color
    Color statusColor;
    IconData statusIcon;

    switch (complaint.status?.toLowerCase()) {
      case 'resolved':
      case 'completed':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle_outline;
        break;
      case 'pending':
      case 'in-progress':
        statusColor = Colors.orange;
        statusIcon = Icons.pending_actions;
        break;
      case 'rejected':
        statusColor = Colors.red;
        statusIcon = Icons.error_outline;
        break;
      default:
        statusColor = Colors.blueGrey;
        statusIcon = Icons.info_outline;
    }

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Complaint # ${complaint.complainIDNumber ?? index.toString()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: statusColor),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(statusIcon, size: 14, color: statusColor),
                      const SizedBox(width: 4),
                      Text(
                        complaint.status ?? 'Unknown',
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              complaint.complain ?? 'No description provided',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Divider(height: 24),
            Row(
              children: [
                const Icon(Icons.badge_outlined, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  "ID: ${complaint.citizenIDNumber}",
                  style: TextStyle(color: Colors.grey[700], fontSize: 13),
                ),
                const Spacer(),
                // If your model has a date, add it here
                const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                const SizedBox(width: 4),
                const Text(
                  "Recent", // Replace with formatted date if available
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.assignment_turned_in_outlined, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          const Text(
            "No complaints found",
            style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text("Any issues you report will appear here."),
        ],
      ),
    );
  }
}