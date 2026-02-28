import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';
import 'package:wcms/viewmodels/citizen/citizen_sign_up_status_provider.dart';

class CitizenSignupStatusScreen extends ConsumerWidget {
  const CitizenSignupStatusScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(citizenSignUpStatusProvider);

    Widget content;
    switch (status) {
      case CitizenSignUpStatusProvider.idle:
        content = Text("Please start signup", style: TextStyle(fontSize: 18));
        break;
      case CitizenSignUpStatusProvider.loading:
        content = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 12),
            Text("Signing up...", style: TextStyle(fontSize: 18)),
          ],
        );
        break;
      case CitizenSignUpStatusProvider.success:
        content = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 48),
            SizedBox(height: 12),
            Text("Signup Successful!", style: TextStyle(fontSize: 18)),
          ],
        );
        break;
      case CitizenSignUpStatusProvider.error:
        content = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, color: Colors.red, size: 48),
            SizedBox(height: 12),
            Text("Signup Failed. Try again.", style: TextStyle(fontSize: 18)),
          ],
        );
        break;
    }

    return Scaffold(
      appBar: AppBar(leading: IconButton(
          icon: Icon(Icons.arrow_back), onPressed: () => Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.signUpCitizen))
      ),title: Text("Signup Status")),
      body: Center(child: content),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () async {
          // Simulate signup process
          ref.read(citizenSignUpStatusProvider.notifier).state = CitizenSignUpStatusProvider.loading;

          await Future.delayed(Duration(seconds: 2));

          // Randomly simulate success or error
          final success = DateTime.now().second % 2 == 0;
          ref.read(citizenSignUpStatusProvider.notifier).state =
          success ? CitizenSignUpStatusProvider.success : CitizenSignUpStatusProvider.error;
        },
      ),
    );
  }
}
