import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/custom_button.dart';
import '../../config/image_links.dart';
import '../../config/string_values.dart';
import '../../core/routes.dart';

class AdminSignInScreen extends ConsumerWidget {
  const AdminSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final authState = ref.watch(authProvider);

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
              // Email field
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 12),

              // Password field
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20),

              // Auth state handling
              Column(
                children: [
                  // Login with email/password
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                        label: 'Login',
                        onPressed: () => {
                          Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.dashboardAdmin))
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
                  /*SizedBox(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        //Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.signUp));
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
                  ),*/
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
