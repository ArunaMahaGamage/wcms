import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final citizenSignInProvider = StateProvider<Map<String, dynamic>>((ref) => {});

class CitizenSignInScreen extends ConsumerWidget {
  const CitizenSignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final signInData = ref.watch(citizenSignInProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Citizen Sign-In")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "ID Number"),
                onSaved: (val) => signInData["idNumber"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "User ID"),
                onSaved: (val) => signInData["userID"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                onSaved: (val) => signInData["password"] = val,
                validator: (val) => val!.isEmpty ? "Required" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text("Sign In"),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    ref.read(citizenSignInProvider.notifier).state = signInData;
                    // TODO: Call API with signInData
                    // Backend will return oauth2Token and refreshToken
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
