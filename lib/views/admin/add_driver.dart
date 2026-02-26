import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final driverProvider = StateProvider<Map<String, dynamic>>((ref) => {});

class AddDriverScreen extends ConsumerWidget {
  const AddDriverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final driverData = ref.watch(driverProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Add Driver")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Driver Licence Number"),
                onSaved: (val) => driverData["driverLicenceNumber"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Driver ID Number"),
                onSaved: (val) => driverData["driverIDNumber"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Driver Full Name"),
                onSaved: (val) => driverData["driverFullName"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "First Name"),
                onSaved: (val) => driverData["firstName"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Last Name"),
                onSaved: (val) => driverData["lastName"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Birth Date"),
                onSaved: (val) => driverData["birthDate"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Licence Date of Issue"),
                onSaved: (val) => driverData["licenceDateOfIssue"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Address"),
                maxLines: 2,
                onSaved: (val) => driverData["address"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Mobile Number"),
                keyboardType: TextInputType.phone,
                onSaved: (val) => driverData["mobileNumber"] = val,
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
              ElevatedButton(
                child: const Text("Submit"),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    ref.read(driverProvider.notifier).state = driverData;
                    // TODO: Call API with driverData
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
