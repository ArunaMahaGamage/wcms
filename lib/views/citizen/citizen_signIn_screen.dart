import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/api/citizen/citizen_sign_in_api_service.dart';
import 'package:wcms/models/citizen/citizen_sign_in.dart';

import '../../components/custom_button.dart';
import '../../config/image_links.dart';
import '../../config/string_values.dart';
import '../../core/routes.dart';

final citizenSignInProvider = StateProvider<Map<String, dynamic>>((ref) => {});

class CitizenSignInScreen extends ConsumerWidget {
  const CitizenSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final authState = ref.watch(authProvider);
    final formKey = GlobalKey<FormState>();
    final citizenSignInData = ref.watch(citizenSignInProvider);

    Future<CitizenSignIn> signInUser() async {
      //final citizenSignInData = ref.watch(citizenSignInProvider);
      final citizen = CitizenSignIn.fromMap(citizenSignInData);
      CitizenSignIn citizenSignInResponse = await CitizenSignInApiService().createCitizenSign(citizen);
      if (citizenSignInResponse.idNumber.isNotEmpty) {
        Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.dashboardCitizen));
      }
      return citizenSignInResponse;
    }

    // Controllers for email & password
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Center(child: Text(StringValues.appName, style: Theme.of(context).textTheme.headlineSmall)),
              const SizedBox(height: 50),
              Image.network(
                ImageLinks.loginScreenImage,
                //width: 300,
                //height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 50),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    // Email field
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      onSaved: (val) => citizenSignInData["Email"] = val,
                      validator: (val) => val!.isEmpty ? "Required" : null,
                    ),

                    const SizedBox(height: 12),

                    // Password field
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                      onSaved: (val) => citizenSignInData["Password"] = val,
                      validator: (val) => val!.isEmpty ? "Required" : null,
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),

              // Auth state handling
              Column(
                children: [
                  // Login with email/password
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                        label: 'Login',
                        onPressed: () => {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save(),
                            ref.read(citizenSignInProvider.notifier).state = citizenSignInData,
                            // TODO: Call API with citizenData
                            signInUser()
                          },
                        }/*ref
                          .read(authControllerProvider)
                          .signInWithEmail(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      )*/
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Register new account
                  /*SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          label: 'Register',
                          onPressed: () => {
                            //ref.read(authControllerProvider).registerWithEmail(emailController.text.trim(), passwordController.text.trim(),),
                            Future.microtask(() => Navigator.pushReplacementNamed(
                                context, Routes.signUp))
                          }),
                      ),*/
                  SizedBox(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.signUpCitizen));
                      },
                      child: const Text(
                        "Don't have an account? Register here",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Anonymous login
                  /*SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          label: 'Continue (Anonymous)',
                          onPressed: () =>
                              ref.read(authControllerProvider).signInAnonymously(),
                        ),
                      ),*/
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
