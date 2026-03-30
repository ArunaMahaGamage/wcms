import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';
import 'package:wcms/viewmodels/admin/admin_add_driver_provider.dart';

final driverProvider = StateProvider<Map<String, dynamic>>((ref) => {});

class AddDriverScreen extends ConsumerWidget {
  const AddDriverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final driverData = ref.watch(driverProvider);

    final submissionState = ref.watch(driverSubmitProvider);

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () => Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.dashboardAdmin))
          ),
          title: const Text("Add Driver")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Driver Licence Number", border: OutlineInputBorder()),
                onSaved: (val) => driverData["driverLicenceNumber"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Driver ID Number", border: OutlineInputBorder()),
                onSaved: (val) => driverData["driverIDNumber"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Driver Full Name", border: OutlineInputBorder()),
                onSaved: (val) => driverData["driverFullName"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "First Name", border: OutlineInputBorder()),
                onSaved: (val) => driverData["firstName"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Last Name", border: OutlineInputBorder()),
                onSaved: (val) => driverData["lastName"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Birth Date", border: OutlineInputBorder()),
                onSaved: (val) => driverData["birthDate"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Licence Date of Issue", border: OutlineInputBorder()),
                onSaved: (val) => driverData["licenceDateOfIssue"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Address", border: OutlineInputBorder()),
                maxLines: 2,
                onSaved: (val) => driverData["address"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Mobile Number", border: OutlineInputBorder()),
                keyboardType: TextInputType.phone,
                onSaved: (val) => driverData["mobileNumber"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 20),
              const Text("License Categories", style: TextStyle(fontWeight: FontWeight.bold)),
              ...[
                "lightMotorcycles",
                "motorcycles",
                "motorTricycle",
                "dualPurposeVehicles",
                "quadricycles",
                "lightMotorLorry",
                "motorLorry",
                "heavyMotorLorry",
                "lightMotorCoach",
                "motorCoach",
                "heavyMotorCoach",
                "landVehicle",
                "motorizedInvalidCarriage"
              ].map((category) => SwitchListTile(
                title: Text(category),
                value: driverData[category] ?? false,
                onChanged: (val) {
                  ref.read(driverProvider.notifier).state = {
                    ...driverData,
                    category: val,
                  };
                },
              )),
              const SizedBox(height: 20),
              /*ElevatedButton(
                child: const Text("Submit"),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    ref.read(driverProvider.notifier).state = driverData;
                    // TODO: Call API with driverData
                  }
                },
              ),*/
              // ... inside your Column, replace the ElevatedButton section:
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submissionState.isLoading
                      ? null
                      : () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      // Trigger the API call
                      await ref.read(driverSubmitProvider.notifier).submit(driverData);

                      if (ref.read(driverSubmitProvider).hasError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${ref.read(driverSubmitProvider).error}"), backgroundColor: Colors.red),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Driver Added Successfully"), backgroundColor: Colors.green),
                        );
                        Navigator.pushReplacementNamed(context, Routes.dashboardAdmin);
                      }
                    }
                  },
                  child: submissionState.isLoading
                      ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text("Submit Driver"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
