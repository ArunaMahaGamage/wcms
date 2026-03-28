import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:wcms/core/routes.dart';
import '../../viewmodels/admin/all_complaints_provider.dart';

class AllComplainScreen extends ConsumerWidget {
  const AllComplainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final complaintsAsync = ref.watch(allComplaintsProvider);
    final filter = ref.watch(complaintFilterProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back), onPressed: () => Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.dashboardAdmin))
        ),
        title: const Text("Management: All Complaints"),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.filter_list),
            onSelected: (val) => ref.read(complaintFilterProvider.notifier).state = val,
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'All', child: Text('Show All')),
              const PopupMenuItem(value: 'Pending', child: Text('Pending Only')),
              const PopupMenuItem(value: 'Resolved', child: Text('Resolved Only')),
            ],
          )
        ],
      ),
      body: complaintsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
        data: (complaints) {
          // Filter logic
          final filteredList = filter == 'All'
              ? complaints
              : complaints.where((c) => c.status == filter).toList();

          if (filteredList.isEmpty) {
            return const Center(child: Text("No complaints found for this filter."));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              final item = filteredList[index];
              return _buildAdminComplaintCard(context, item);
            },
          );
        },
      ),
    );
  }

  Widget _buildAdminComplaintCard(BuildContext context, dynamic item) {
    Color statusColor = item.status == 'Pending' ? Colors.red :
    item.status == 'In-Progress' ? Colors.orange : Colors.green;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: statusColor.withOpacity(0.2),
          child: Icon(Icons.report_problem, color: statusColor, size: 20),
        ),
        title: Text(
          item.citizenIDNumber,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("ID: ${item.complainIDNumber} "),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            item.status,
            style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Complaint Details:", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(item.complain),
                const Divider(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () { /* Update status logic */ },
                      icon: const Icon(Icons.edit, size: 16),
                      label: const Text("Update Status"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
                    ),
                    OutlinedButton.icon(
                      onPressed: () { /* Contact citizen logic */ },
                      icon: const Icon(Icons.phone, size: 16),
                      label: const Text("Contact"),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}