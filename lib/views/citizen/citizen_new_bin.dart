import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/components/custom_button.dart';
import 'package:wcms/core/routes.dart';
import 'package:wcms/models/citizen/request_new_bin.dart';
import 'package:wcms/viewmodels/citizen/bin_request_provider.dart';
import 'package:wcms/viewmodels/citizen/citizen_sign_in_provider.dart';
// import 'package:wcms/api/citizen/bin_api_service.dart'; // Create this similar to CitizenApiService

class RequestNewBinScreen extends ConsumerWidget {
  RequestNewBinScreen({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _idNumberController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final binData = ref.watch(binRequestFormProvider);
    final citizenSignInStore = ref.watch(citizenSignInStoreProvider);

    Future<void> submitRequest() async {
      final request = RequestNewBin.fromMap(binData);

      // Example API Call (Logic matching your signup screen)
      // var response = await BinApiService().createBinRequest(request);

      // Simulating success:
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Bin Request Submitted Successfully")),
      );
      Future.microtask(() => Navigator.pop(context));
    }

    _idNumberController.text = citizenSignInStore!.idNumber;
    _emailController.text = citizenSignInStore.userID;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back), onPressed: () => Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.dashboardCitizen))
        ),
        title: const Text("Request New Bin"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email", prefixIcon: Icon(Icons.email), border: OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
                onSaved: (val) => binData["email"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
                readOnly: true,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _idNumberController,
                decoration: const InputDecoration(labelText: "ID Number", prefixIcon: Icon(Icons.badge), border: OutlineInputBorder()),
                onSaved: (val) => binData["idNumber"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: "Address", prefixIcon: Icon(Icons.home), border: OutlineInputBorder()),
                maxLines: 2,
                onSaved: (val) => binData["address"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(labelText: "Description", prefixIcon: Icon(Icons.description), border: OutlineInputBorder()),
                maxLines: 3,
                onSaved: (val) => binData["description"] = val,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "Latitude", prefixIcon: Icon(Icons.location_on)),
                      keyboardType: TextInputType.number,
                      onSaved: (val) => binData["lat"] = val,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "Longitude"),
                      keyboardType: TextInputType.number,
                      onSaved: (val) => binData["lon"] = val,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  label: 'Submit Request',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      ref.read(binRequestFormProvider.notifier).state = binData;
                      submitRequest();
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