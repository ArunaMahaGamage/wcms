import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';
import 'package:wcms/viewmodels/admin/admin_add_driver_provider.dart';

final driverProvider = StateProvider<Map<String, dynamic>>((ref) => {});

class AddDriverScreen extends ConsumerStatefulWidget {
  const AddDriverScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AddDriverScreen> createState() => _AddDriverScreenState();
}

class _AddDriverScreenState extends ConsumerState<AddDriverScreen> {
  // 1. Define Controllers to hold text state
  final Map<String, TextEditingController> _controllers = {
    "driverLicenceNumber": TextEditingController(),
    "driverIdNumber": TextEditingController(),
    "driverFullName": TextEditingController(),
    "firstName": TextEditingController(),
    "lastName": TextEditingController(),
    "birthDate": TextEditingController(),
    "licenceDateOfIssue": TextEditingController(),
    "address": TextEditingController(),
    "mobileNumber": TextEditingController(),
    "email": TextEditingController(),
  };

  @override
  void dispose() {
    // Clean up controllers
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final driverData = ref.watch(driverProvider);
    final submissionState = ref.watch(driverSubmitProvider);

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Future.microtask(() =>
                  Navigator.pushReplacementNamed(
                      context, Routes.dashboardAdmin))),
          title: const Text("Add Driver")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              // 2. Use Controller instead of initialValue + onChanged
              _buildTextField("driverLicenceNumber", "Driver Licence Number"),
              const SizedBox(height: 16),
              _buildTextField("driverIdNumber", "Driver ID Number"),
              const SizedBox(height: 16),
              _buildTextField("driverFullName", "Driver Full Name"),
              const SizedBox(height: 16),
              _buildTextField("firstName", "First Name"),
              const SizedBox(height: 16),
              _buildTextField("lastName", "Last Name"),
              const SizedBox(height: 16),
              _buildTextField("birthDate", "Birth Date"),
              const SizedBox(height: 16),
              _buildTextField("licenceDateOfIssue", "Licence Date of Issue"),
              const SizedBox(height: 16),
              _buildTextField("address", "Address", maxLines: 2),
              const SizedBox(height: 16),
              _buildTextField("mobileNumber", "Mobile Number", keyboardType: TextInputType.phone),
              const SizedBox(height: 20),
              _buildTextField("email", "Email", keyboardType: TextInputType.emailAddress),

              const SizedBox(height: 20),
              const Text("License Categories",
                  style: TextStyle(fontWeight: FontWeight.bold)),
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
                  // Switch toggles now rebuild the UI, but Controllers keep the text safe!
                  ref.read(driverProvider.notifier).state = {
                    ...driverData,
                    category: val,
                  };
                },
              )),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submissionState.isLoading
                      ? null
                      : () async {
                    if (formKey.currentState!.validate()) {
                      // 3. Collect text from controllers before submitting
                      Map<String, dynamic> finalData = Map.from(driverData);
                      _controllers.forEach((key, controller) {
                        finalData[key] = controller.text;
                      });

                      await ref
                          .read(driverSubmitProvider.notifier)
                          .submit(finalData);

                      if (ref.read(driverSubmitProvider).hasError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("${ref.read(driverSubmitProvider).error}"),
                              backgroundColor: Colors.red),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Driver Added Successfully"),
                              backgroundColor: Colors.green),
                        );
                        Navigator.pushReplacementNamed(context, Routes.dashboardAdmin);
                      }
                    }
                  },
                  child: submissionState.isLoading
                      ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text("Submit Driver"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build text fields using controllers
  Widget _buildTextField(String key, String label, {int maxLines = 1, TextInputType? keyboardType}) {
    return TextFormField(
      controller: _controllers[key],
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (val) => val == null || val.isEmpty ? "Required" : null,
    );
  }
}