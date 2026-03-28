import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/api/citizen/citizen_complain_api_service.dart';
import 'package:wcms/core/routes.dart';
import 'package:wcms/utils/simple_random_id.dart';

import '../../models/complain.dart';
import '../../viewmodels/citizen/complaints_provider.dart';

//final complaintsProvider = StateProvider<List<Complain>>((ref) => []);
final complaintsProvider = StateProvider<Map<String, dynamic>>((ref) => {});

class CitizenComplainScreen extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _complainTitleController = TextEditingController();
  final _citizenIDController = TextEditingController();
  final _complainController = TextEditingController();
  String _status = "New";

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    Future<Complain> complainCitizen(Complain complainRequest) async {
      //final citizenSignInData = ref.watch(citizenSignInProvider);
      Complain complain = await CitizenComplainApiService().createCitizenComplain(complainRequest);
      if (complain.complainIDNumber.isNotEmpty) {
        Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.complaintCitizenStatus));
      }
      return complain;
    }

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () => Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.dashboardCitizen))
          ),
          title: Text("Submit Complaint")),
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
                items: ["New", "Pending", "In Progress", "Resolved"]
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
                      //id: DateTime.now().millisecondsSinceEpoch,
                      complainIDNumber: generateRandomId(10),//_complainTitleController.text,
                      citizenIDNumber: _citizenIDController.text,
                      complain: _complainController.text,
                      status: _status,
                    );

                    complainCitizen(newComplaint);
                    // Update StateProvider
                    /*ref.read(complaintsProvider.notifier).state = [
                      ...ref.read(complaintsProvider),
                      newComplaint,
                    ];*/
                    //ref.read(complainListProvider.notifier).addComplaint(newComplaint);

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
