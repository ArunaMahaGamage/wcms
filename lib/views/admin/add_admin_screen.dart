import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';
import 'package:wcms/viewmodels/admin/admin_add_provider.dart';

final adminSignupProvider = StateProvider<Map<String, dynamic>>((ref) => {});

class AddAdminScreen extends ConsumerWidget {
  const AddAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final signupData = ref.watch(adminSignupProvider);

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () => Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.dashboardAdmin))
          ),
          title: const Text("Add Administrator")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "First Name", border: OutlineInputBorder()),
                onSaved: (val) => signupData["firstName"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Last Name", border: OutlineInputBorder()),
                onSaved: (val) => signupData["lastName"] = val,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "ID Number", border: OutlineInputBorder()),
                onSaved: (val) => signupData["idNumber"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Date of Birth", border: OutlineInputBorder()),
                onSaved: (val) => signupData["dateOfBirth"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: "Gender", border: OutlineInputBorder()),
                items: ["Male", "Female", "Other"]
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (val) => signupData["gender"] = val,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Address", border: OutlineInputBorder()),
                maxLines: 2,
                onSaved: (val) => signupData["address"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
                onSaved: (val) => signupData["email"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Mobile Number", border: OutlineInputBorder()),
                keyboardType: TextInputType.phone,
                onSaved: (val) => signupData["mobileNumber"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Position", border: OutlineInputBorder()),
                onSaved: (val) => signupData["position"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Department", border: OutlineInputBorder()),
                onSaved: (val) => signupData["department"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Employee Number", border: OutlineInputBorder()),
                onSaved: (val) => signupData["employeeNumber"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Provincial", border: OutlineInputBorder()),
                onSaved: (val) => signupData["provincial"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "District", border: OutlineInputBorder()),
                onSaved: (val) => signupData["district"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Divisional Secretary Divisions", border: OutlineInputBorder()),
                onSaved: (val) =>
                signupData["divisionalSecretaryDivisions"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 20),
              /*ElevatedButton(
                child: const Text("Submit"),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    ref.read(adminSignupProvider.notifier).state = signupData;
                    // TODO: Call API with signupData
                  }
                },
              ),*/
              Consumer(
                builder: (context, ref, child) {
                  final submissionState = ref.watch(adminSubmitProvider);

                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: submissionState.isLoading
                          ? null
                          : () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          // Call the submission logic
                          await ref.read(adminSubmitProvider.notifier).submit(signupData);

                          // Handle Result
                          if (ref.read(adminSubmitProvider).hasError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("${ref.read(adminSubmitProvider).error}"),
                                  backgroundColor: Colors.red
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Administrator added successfully!"),
                                  backgroundColor: Colors.green
                              ),
                            );
                            Navigator.pushReplacementNamed(context, Routes.dashboardAdmin);
                          }
                        }
                      },
                      child: submissionState.isLoading
                          ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)
                      )
                          : const Text("Submit Registration"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
