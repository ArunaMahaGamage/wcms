import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';
import 'package:wcms/models/citizen/citizen_request_new_vehicle_route.dart';
import 'package:wcms/viewmodels/citizen/citizen_request_route_notifier.dart';
import 'package:wcms/viewmodels/citizen/citizen_sign_in_provider.dart';

class RequestRouteScreen extends ConsumerStatefulWidget {
  const RequestRouteScreen({super.key});

  @override
  ConsumerState<RequestRouteScreen> createState() => _RequestRouteScreenState();
}

class _RequestRouteScreenState extends ConsumerState<RequestRouteScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _idNumberController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _latController = TextEditingController();
  final _lonController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _addressController.dispose();
    _idNumberController.dispose();
    _descriptionController.dispose();
    _latController.dispose();
    _lonController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final request = CitizenRequestNewVehicleRoute(
        email: _emailController.text,
        address: _addressController.text,
        idNumber: _idNumberController.text,
        description: _descriptionController.text,
        lat: _latController.text,
        lon: _lonController.text,
      );

      ref.read(requestRouteProvider.notifier).submitRequest(request).then((_) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Request submitted successfully!')),
        );
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final submissionState = ref.watch(requestRouteProvider);
    final citizenSignInStore = ref.watch(citizenSignInStoreProvider);
    _idNumberController.text = citizenSignInStore!.idNumber;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () => Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.dashboardCitizen))
          ),
          title: const Text("Request New Vehicle Route")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.contains('@') ? null : 'Enter a valid email',
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _idNumberController,
                readOnly: true,
                decoration: const InputDecoration(labelText: 'ID Number', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Enter ID Number' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address', border: OutlineInputBorder()),
                maxLines: 2,
                validator: (value) => value!.isEmpty ? 'Enter Address' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description', border: OutlineInputBorder()),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _latController,
                      decoration: const InputDecoration(labelText: 'Latitude', border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: _lonController,
                      decoration: const InputDecoration(labelText: 'Longitude', border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: submissionState.isLoading ? null : _submitForm,
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
                child: submissionState.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Submit Request", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}