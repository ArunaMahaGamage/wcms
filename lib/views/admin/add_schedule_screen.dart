import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';
import 'package:wcms/models/admin/manage_team.dart';
import 'package:wcms/viewmodels/admin/add_vehicle_provider.dart';
import 'package:wcms/viewmodels/admin/admin_add_driver_provider.dart';
import 'package:wcms/viewmodels/admin/admin_manage_team_provider.dart';
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
    final vehicleAsync = ref.watch(allVehicleProvider);
    //final manageTeamDriversAsync = ref.watch(manageTeamDriversProvider);

    final String selectedVehicleId = formData['vehicleId'] ?? '';
    final manageTeamDriversAsync = selectedVehicleId.isNotEmpty
        ? ref.watch(manageTeamDriversProvider(selectedVehicleId))
        : const AsyncValue.data(<ManageTeam>[]); // Empty list if no vehicle selected


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
                // DYNAMIC VEHICLE DROPDOWN
                vehicleAsync.when(
                  data: (vehicles) => DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Assign Vehicle (Plate Number)",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.local_shipping),
                    ),
                    // If a vehicle is already selected in formData, set it as value
                    value: formData['vehicleId'].isEmpty ? null : formData['vehicleId'],
                    items: vehicles.map((vehicle) => DropdownMenuItem(
                      value: vehicle.vehicleId,
                      child: Text("${vehicle.vehicleId} (${vehicle.type})"),
                    )).toList(),
                    onChanged: (val) {
                      setState(() {
                        formData['vehicleId'] = val;
                      });
                    },
                    validator: (val) => val == null || val.isEmpty ? "Required" : null,
                  ),
                  loading: () => const LinearProgressIndicator(),
                  error: (err, _) => Text("Error loading vehicles: $err", style: const TextStyle(color: Colors.red)),
                ),
                /*TextFormField(
                  decoration: const InputDecoration(labelText: "Assign Vehicle (ID/Plate)", border: OutlineInputBorder()),
                  onChanged: (val) => formData['vehicleId'] = val,
                ),*/
                const SizedBox(height: 16),
                /*TextFormField(
                  decoration: const InputDecoration(labelText: "Assign Driver (Name/ID)", border: OutlineInputBorder()),
                  onChanged: (val) => formData['driverId'] = val,
                ),*/
                if (selectedVehicleId.isEmpty)
                  const Text("Please select a vehicle first to load drivers",
                      style: TextStyle(color: Colors.grey, fontSize: 12))
                else
                  _buildDriverSelector(
                    vehicleAsync: manageTeamDriversAsync,
                    currentValue: formData['driverId'],
                    onChanged: (val) {
                      setState(() {
                        formData['driverId'] = val;
                      });
                    },
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

  Widget _buildDriverSelector({
    required AsyncValue<List<ManageTeam>> vehicleAsync,
    required String? currentValue,
    required Function(String?) onChanged,
  }) {
    return vehicleAsync.when(
      data: (drivers) {
        if (drivers.isEmpty) {
          return const Text("No drivers assigned to this vehicle in Manage Team.",
              style: TextStyle(color: Colors.orange));
        }
        return _buildDropdown(
            "Assign Driver (ID Number)",
            drivers,
                (v) => v.idNumber,
                (v) => v.idNumber, // You can change this to v.name if your ManageTeam model has it
            currentValue,
            onChanged
        );
      },
      loading: () => const LinearProgressIndicator(),
      error: (err, _) => Text("Error loading assigned drivers: $err",
          style: const TextStyle(color: Colors.red)),
    );
  }

  Widget _buildDropdown<T>(
      String label,
      List<T> items,
      String Function(T) getId,
      String Function(T) getName,
      String? currentValue,
      Function(String?) onChanged,
      ) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.person)
      ),
      value: (currentValue == null || currentValue.isEmpty) ? null : currentValue,
      items: items.map((item) => DropdownMenuItem(
        value: getId(item),
        child: Text("${getId(item)}"), // Displaying ID
      )).toList(),
      onChanged: onChanged,
      validator: (val) => val == null || val.isEmpty ? "Required" : null,
    );
  }
}