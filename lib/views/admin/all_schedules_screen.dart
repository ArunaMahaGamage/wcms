import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';
import '../../viewmodels/admin/all_schedules_provider.dart';

class AllSchedulesScreen extends ConsumerWidget {
  const AllSchedulesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedulesAsync = ref.watch(allSchedulesProvider);
    final dayFilter = ref.watch(scheduleDayFilterProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, Routes.dashboardAdmin),
        ),
        title: const Text("Current Schedules"),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.calendar_today_outlined),
            onSelected: (val) => ref.read(scheduleDayFilterProvider.notifier).state = val,
            itemBuilder: (context) => [
              'All', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
            ].map((day) => PopupMenuItem(value: day, child: Text(day))).toList(),
          )
        ],
      ),
      body: schedulesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
        data: (schedules) {
          final filteredList = dayFilter == 'All'
              ? schedules
              : schedules.where((s) => s.dayOfWeek == dayFilter).toList();

          if (filteredList.isEmpty) {
            return const Center(child: Text("No collection schedules found."));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              final item = filteredList[index];
              return _buildScheduleCard(context, item);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () { /* Navigate to Create Schedule */
          Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.schedulesRoutesAdmin));
          },
        label: const Text("Add Schedule"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.green[700],
      ),
    );
  }

  Widget _buildScheduleCard(BuildContext context, dynamic item) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: Text(
              item.zoneName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.event, size: 18, color: Colors.green),
                    const SizedBox(width: 8),
                    Text("${item.dayOfWeek} | ${item.startTime} - ${item.endTime}",
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.recycling, size: 18, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text("Waste Type: ${item.wasteType}"),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.local_shipping, size: 18, color: Colors.grey),
                    const SizedBox(width: 8),
                    Text("Vehicle: ${item.vehicleId} (${item.driverId})"),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_outlined, size: 20),
                  label: const Text("Edit"),
                ),
                const VerticalDivider(),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.delete_outline, size: 20, color: Colors.red),
                  label: const Text("Remove", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
