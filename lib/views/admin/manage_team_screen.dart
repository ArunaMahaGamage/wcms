import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/viewmodels/admin/admin_manage_team_provider.dart';
import 'package:wcms/core/routes.dart';

class ManageTeamScreen extends ConsumerWidget {
  const ManageTeamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final teamData = ref.watch(teamFormProvider);
    final submissionState = ref.watch(teamSubmitProvider);

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

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Staff ID Number (NIC)",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.badge),
                ),
                onSaved: (val) => teamData['idNumber'] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: teamData['jobRole'],
                decoration: const InputDecoration(
                  labelText: "Job Role",
                  border: OutlineInputBorder(),
                ),
                items: ['Driver', 'Helper', 'Supervisor']
                    .map((role) => DropdownMenuItem(value: role, child: Text(role)))
                    .toList(),
                onChanged: (val) => teamData['jobRole'] = val,
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
}