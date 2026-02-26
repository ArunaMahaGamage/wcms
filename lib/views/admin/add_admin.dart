import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final adminSignupProvider = StateProvider<Map<String, dynamic>>((ref) => {});

class addAdminScreen extends ConsumerWidget {
  const addAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final signupData = ref.watch(adminSignupProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Administrator Signup")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "First Name"),
                onSaved: (val) => signupData["firstName"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Last Name"),
                onSaved: (val) => signupData["lastName"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "ID Number"),
                onSaved: (val) => signupData["idNumber"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Date of Birth"),
                onSaved: (val) => signupData["dateOfBirth"] = val,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: "Gender"),
                items: ["Male", "Female", "Other"]
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (val) => signupData["gender"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Address"),
                maxLines: 2,
                onSaved: (val) => signupData["address"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                onSaved: (val) => signupData["email"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Mobile Number"),
                keyboardType: TextInputType.phone,
                onSaved: (val) => signupData["mobileNumber"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Position"),
                onSaved: (val) => signupData["position"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Department"),
                onSaved: (val) => signupData["department"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Employee Number"),
                onSaved: (val) => signupData["employeeNumber"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Provincial"),
                onSaved: (val) => signupData["provincial"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "District"),
                onSaved: (val) => signupData["district"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Divisional Secretary Divisions"),
                onSaved: (val) =>
                signupData["divisionalSecretaryDivisions"] = val,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text("Submit"),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    ref.read(adminSignupProvider.notifier).state = signupData;
                    // TODO: Call API with signupData
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
