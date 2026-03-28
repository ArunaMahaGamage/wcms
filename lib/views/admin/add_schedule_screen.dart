import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';
import 'package:wcms/viewmodels/admin/schedule_route_provider.dart';

class AddScheduleScreen extends ConsumerStatefulWidget {
  const AddScheduleScreen({super.key});

  @override
  ConsumerState<AddScheduleScreen> createState() => _AddScheduleScreenState();
}

class _AddScheduleScreenState extends ConsumerState<AddScheduleScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final formData = ref.watch(scheduleFormProvider);
    final submissionState = ref.watch(scheduleRouteSubmitProvider);

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacementNamed(context, Routes.dashboardAdmin),
          ),
          title: const Text("Schedule New Route")),
      body: submissionState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error: $err")),
        data: (_) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle("Route Information"),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Zone/Area Name", border: OutlineInputBorder()),
                  onChanged: (val) => formData['zoneName'] = val,
                  validator: (val) => val!.isEmpty ? "Required" : null,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: formData['dayOfWeek'],
                  decoration: const InputDecoration(labelText: "Collection Day", border: OutlineInputBorder()),
                  items: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
                      .map((day) => DropdownMenuItem(value: day, child: Text(day))).toList(),
                  onChanged: (val) => formData['dayOfWeek'] = val,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: "Start Time", hintText: "08:00 AM", border: OutlineInputBorder()),
                        onChanged: (val) => formData['startTime'] = val,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: "End Time", hintText: "10:00 AM", border: OutlineInputBorder()),
                        onChanged: (val) => formData['endTime'] = val,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildSectionTitle("Assignment"),
                DropdownButtonFormField<String>(
                  value: formData['wasteType'],
                  decoration: const InputDecoration(labelText: "Waste Type", border: OutlineInputBorder()),
                  items: ['Organic', 'Plastic', 'Paper/Cardboard', 'Glass', 'E-Waste']
                      .map((type) => DropdownMenuItem(value: type, child: Text(type))).toList(),
                  onChanged: (val) => formData['wasteType'] = val,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Assign Vehicle (ID/Plate)", border: OutlineInputBorder()),
                  onChanged: (val) => formData['vehicleId'] = val,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Assign Driver (Name/ID)", border: OutlineInputBorder()),
                  onChanged: (val) => formData['driverId'] = val,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ref.read(scheduleRouteSubmitProvider.notifier).submitSchedule(formData).then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Schedule Created Successfully")));
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: const Text("Create Schedule", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
    );
  }
}