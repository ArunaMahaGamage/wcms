import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';

final vehicleFormProvider = StateProvider<Map<String, dynamic>>((ref) => {});

class AddVehicleScreen extends ConsumerWidget {
  const AddVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final vehicleData = ref.watch(vehicleFormProvider);

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () => Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.dashboardAdmin))
          ),
          title: const Text("Add Vehicle")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Vehicle Number", border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                onSaved: (val) => vehicleData["vehicleId"] = int.tryParse(val ?? ""),
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Type", border: OutlineInputBorder()),
                onSaved: (val) => vehicleData["type"] = val,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Model", border: OutlineInputBorder()),
                onSaved: (val) => vehicleData["model"] = val,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Manufacture", border: OutlineInputBorder()),
                onSaved: (val) => vehicleData["manufacture"] = val,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Manufacture Year", border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                onSaved: (val) => vehicleData["manufactureYear"] = val,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: "Fuel Type", border: OutlineInputBorder()),
                items: ["Petrol", "Diesel", "Electric", "Hybrid"]
                    .map((f) => DropdownMenuItem(value: f, child: Text(f)))
                    .toList(),
                onChanged: (val) => vehicleData["fuelType"] = val,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: "Seat Capacity", border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                onSaved: (val) => vehicleData["seat"] = val,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: "Gear Type", border: OutlineInputBorder()),
                items: ["Manual", "Automatic"]
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (val) => vehicleData["gearType"] = val,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text("Submit"),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      ref.read(vehicleFormProvider.notifier).state = vehicleData;
                      // TODO: Call API with vehicleData
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
