import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/models/admin/admin_driver.dart';
import 'package:wcms/models/admin/admin_helper.dart';
import 'package:wcms/viewmodels/admin/admin_add_driver_provider.dart';
import 'package:wcms/viewmodels/admin/admin_manage_team_provider.dart';
import 'package:wcms/viewmodels/admin/admin_helper_provider.dart'; // Import Helper provider
import 'package:wcms/core/routes.dart';

class ManageTeamScreen extends ConsumerWidget {
  const ManageTeamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final teamData = ref.watch(teamFormProvider);
    final submissionState = ref.watch(teamSubmitProvider);

    // 1. Watch the lists for Drivers and Helpers
    final driversAsync = ref.watch(allDriversProvider);
    final helpersAsync = ref.watch(allHelpersProvider);

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacementNamed(context, Routes.dashboardAdmin),
          ),
          title: const Text("Manage Team Assignment")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Assign Staff to Vehicle",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Vehicle ID / Plate Number",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.local_shipping),
                ),
                onSaved: (val) => teamData['vehicleId'] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),

              // 2. Job Role Dropdown (updates state to trigger list change)
              DropdownButtonFormField<String>(
                value: teamData['jobRole'],
                decoration: const InputDecoration(
                  labelText: "Job Role",
                  border: OutlineInputBorder(),
                ),
                items: ['Driver', 'Helper', 'Supervisor']
                    .map((role) => DropdownMenuItem(value: role, child: Text(role)))
                    .toList(),
                onChanged: (val) {
                  ref.read(teamFormProvider.notifier).state = {
                    ...teamData,
                    'jobRole': val,
                    'idNumber': '', // Reset selection when role changes
                  };
                },
              ),
              const SizedBox(height: 30),

              // 3. Dynamic Staff ID Selection based on Role
              _buildStaffSelector(
                role: teamData['jobRole'],
                driversAsync: driversAsync,
                helpersAsync: helpersAsync,
                currentValue: teamData['idNumber'],
                onChanged: (val) => teamData['idNumber'] = val,
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: submissionState.isLoading
                      ? null
                      : () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      await ref.read(teamSubmitProvider.notifier).submit(teamData);

                      if (ref.read(teamSubmitProvider).hasError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${ref.read(teamSubmitProvider).error}"), backgroundColor: Colors.red),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Assignment Successful"), backgroundColor: Colors.green),
                        );
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: submissionState.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Assign to Team"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 4. Helper Widget to build the dynamic selector
  Widget _buildStaffSelector({
    required String? role,
    required AsyncValue<List<AdminDriver>> driversAsync,
    required AsyncValue<List<AdminHelper>> helpersAsync,
    required String? currentValue,
    required Function(String?) onChanged,
  }) {
    if (role == 'Driver') {
      return driversAsync.when(
        data: (drivers) => _buildDropdown("Select Driver", drivers, (d) => d.driverIdNumber, (d) => d.firstName, currentValue, onChanged),
        loading: () => const LinearProgressIndicator(),
        error: (err, _) => Text("Error loading drivers: $err"),
      );
    } else if (role == 'Helper') {
      return helpersAsync.when(
        data: (helpers) => _buildDropdown("Select Helper", helpers, (h) => h.idNumber, (h) => h.firstName, currentValue, onChanged),
        loading: () => const LinearProgressIndicator(),
        error: (err, _) => Text("Error loading helpers: $err"),
      );
    } else {
      // Default for Supervisor or others if no API exists yet
      return TextFormField(
        decoration: const InputDecoration(labelText: "Staff ID Number", border: OutlineInputBorder(), prefixIcon: Icon(Icons.badge)),
        onChanged: onChanged,
        validator: (val) => val!.isEmpty ? "Required" : null,
      );
    }
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
      decoration: InputDecoration(labelText: label, border: const OutlineInputBorder(), prefixIcon: const Icon(Icons.badge)),
      value: currentValue!.isEmpty ? null : currentValue,
      items: items.map((item) => DropdownMenuItem(
        value: getId(item),
        child: Text("${getName(item)} (${getId(item)})"),
      )).toList(),
      onChanged: onChanged,
      validator: (val) => val == null ? "Required" : null,
    );
  }
}