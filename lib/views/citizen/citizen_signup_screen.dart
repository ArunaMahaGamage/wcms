import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/api/citizen/citizen_api_service.dart';
import 'package:wcms/api/citizen/citizen_sign_in_api_service.dart';
import 'package:wcms/components/custom_button.dart';
import 'package:wcms/core/routes.dart';
import 'package:wcms/models/citizen/citizen.dart';
import 'package:wcms/models/citizen/citizen_sign_in.dart';

final citizenFormProvider = StateProvider<Map<String, dynamic>>((ref) => {});

class CitizenSignupScreen extends ConsumerWidget {
  const CitizenSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final citizenData = ref.watch(citizenFormProvider);

    Future<Citizen> createUser() async {
      final citizen = Citizen.fromMap(citizenData);
      Citizen citizenResponse = await CitizenApiService().createCitizen(citizen);
      if (citizenResponse.idNumber.isNotEmpty) {
        final citizenSignInRequest = CitizenSignIn.fromMap(citizenData);
        CitizenSignIn citizenSignIn = await CitizenSignInApiService().createCitizenSign(citizenSignInRequest);
        if (citizenSignIn.idNumber.isNotEmpty) {
          Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.signUpCitizenStatus));
        }
      }
      return citizenResponse;
    }

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back), onPressed: () => Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.signInCitizen))
          ),
          title: const Text("Add Citizen")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "First Name"),
                onSaved: (val) => citizenData["firstName"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Last Name"),
                onSaved: (val) => citizenData["lastName"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "ID Number"),
                onSaved: (val) => citizenData["idNumber"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Date of Birth"),
                onSaved: (val) => citizenData["dateOfBirth"] = val,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: "Gender"),
                items: ["Male", "Female", "Other"]
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (val) => citizenData["gender"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Address"),
                maxLines: 2,
                onSaved: (val) => citizenData["address"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                onSaved: (val) => citizenData["email"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Mobile Number"),
                keyboardType: TextInputType.phone,
                onSaved: (val) => citizenData["mobileNumber"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Provincial"),
                onSaved: (val) => citizenData["provincial"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "District"),
                onSaved: (val) => citizenData["district"] = val,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Divisional Secretary Divisions"),
                onSaved: (val) =>
                citizenData["divisionalSecretaryDivisions"] = val,
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: CustomButton(
                    label: 'Submit',
                    onPressed: () => {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save(),
                        ref.read(citizenFormProvider.notifier).state = citizenData,
                        // TODO: Call API with citizenData
                        createUser()
                      },
                      //Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.signUpCitizenStatus)),
                    }/*ref
                          .read(authControllerProvider)
                          .signInWithEmail(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      )*/
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}