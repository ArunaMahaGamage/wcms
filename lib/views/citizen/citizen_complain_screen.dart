import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/complain.dart';
import '../../viewmodels/citizen/complaints_provider.dart';

//final complaintsProvider = StateProvider<List<Complain>>((ref) => []);

class CitizenComplainScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _complainTitleController = TextEditingController();
  final _citizenIDController = TextEditingController();
  final _complainController = TextEditingController();
  String _status = "Pending";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Submit Complaint")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _complainTitleController,
                decoration: InputDecoration(
                  labelText: "Complaint Title",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? "Required" : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _citizenIDController,
                decoration: InputDecoration(
                  labelText: "Citizen ID Number",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                value == null || value.isEmpty ? "Required" : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _complainController,
                decoration: InputDecoration(
                  labelText: "Complaint",
                  border: OutlineInputBorder(),
                ),
                maxLines: 6,
                validator: (value) =>
                value == null || value.isEmpty ? "Required" : null,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _status,
                items: ["Pending", "In Progress", "Resolved"]
                    .map((status) => DropdownMenuItem(
                  value: status,
                  child: Text(status),
                ))
                    .toList(),
                onChanged: (value) {
                  _status = value!;
                },
                decoration: InputDecoration(
                  labelText: "Status",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                child: Text("Submit"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newComplaint = Complain(
                      id: DateTime.now().millisecondsSinceEpoch,
                      complainIDNumber: _complainTitleController.text,
                      citizenIDNumber: _citizenIDController.text,
                      complain: _complainController.text,
                      status: _status,
                    );

                    // Update StateProvider
                    /*ref.read(complaintsProvider.notifier).state = [
                      ...ref.read(complaintsProvider),
                      newComplaint,
                    ];*/
                    ref.read(complainListProvider.notifier).addComplaint(newComplaint);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Complaint Submitted")),
                    );
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
