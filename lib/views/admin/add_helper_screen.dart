import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';

final helperFormProvider = StateProvider<Map<String, dynamic>>((ref) => {});

class AddHelperScreen extends ConsumerWidget {
  const AddHelperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final helperData = ref.watch(helperFormProvider);

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () => Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.dashboardAdmin))
          ),
          title: const Text("Add Helper")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "First Name", border: OutlineInputBorder()),
                onSaved: (val) => helperData["firstName"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Last Name", border: OutlineInputBorder()),
                onSaved: (val) => helperData["lastName"] = val,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "ID Number", border: OutlineInputBorder()),
                onSaved: (val) => helperData["idNumber"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Date of Birth", border: OutlineInputBorder()),
                onSaved: (val) => helperData["dateOfBirth"] = val,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: "Gender", border: OutlineInputBorder()),
                items: ["Male", "Female", "Other"]
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (val) => helperData["gender"] = val,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Address", border: OutlineInputBorder()),
                maxLines: 2,
                onSaved: (val) => helperData["address"] = val,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Mobile Number", border: OutlineInputBorder()),
                keyboardType: TextInputType.phone,
                onSaved: (val) => helperData["mobileNumber"] = val,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text("Submit"),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    ref.read(helperFormProvider.notifier).state = helperData;
                    // TODO: Call API with helperData
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
