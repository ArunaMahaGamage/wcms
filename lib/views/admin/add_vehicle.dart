import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final vehicleFormProvider = StateProvider<Map<String, dynamic>>((ref) => {});

class AddVehicleScreen extends ConsumerWidget {
  const AddVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final vehicleData = ref.watch(vehicleFormProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Add Vehicle")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Vehicle ID"),
                keyboardType: TextInputType.number,
                onSaved: (val) => vehicleData["vehicleId"] = int.tryParse(val ?? ""),
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Type"),
                onSaved: (val) => vehicleData["type"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Model"),
                onSaved: (val) => vehicleData["model"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Manufacture"),
                onSaved: (val) => vehicleData["manufacture"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Manufacture Year"),
                keyboardType: TextInputType.number,
                onSaved: (val) => vehicleData["manufactureYear"] = val,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: "Fuel Type"),
                items: ["Petrol", "Diesel", "Electric", "Hybrid"]
                    .map((f) => DropdownMenuItem(value: f, child: Text(f)))
                    .toList(),
                onChanged: (val) => vehicleData["fuelType"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Seat Capacity"),
                keyboardType: TextInputType.number,
                onSaved: (val) => vehicleData["seat"] = val,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: "Gear Type"),
                items: ["Manual", "Automatic"]
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (val) => vehicleData["gearType"] = val,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text("Submit"),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    ref.read(vehicleFormProvider.notifier).state = vehicleData;
                    // TODO: Call API with vehicleData
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
