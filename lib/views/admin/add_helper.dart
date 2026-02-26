import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helperFormProvider = StateProvider<Map<String, dynamic>>((ref) => {});

class AddHelperScreen extends ConsumerWidget {
  const AddHelperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final helperData = ref.watch(helperFormProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Add Helper")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "First Name"),
                onSaved: (val) => helperData["firstName"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Last Name"),
                onSaved: (val) => helperData["lastName"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "ID Number"),
                onSaved: (val) => helperData["idNumber"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Date of Birth"),
                onSaved: (val) => helperData["dateOfBirth"] = val,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: "Gender"),
                items: ["Male", "Female", "Other"]
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (val) => helperData["gender"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Address"),
                maxLines: 2,
                onSaved: (val) => helperData["address"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Mobile Number"),
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
