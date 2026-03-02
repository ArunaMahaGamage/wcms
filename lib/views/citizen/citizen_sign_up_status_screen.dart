import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/core/routes.dart';
import 'package:wcms/enum/CitizenComplainStatus.dart';
import 'package:wcms/viewmodels/citizen/citizen_sign_up_status_provider.dart';

class CitizenSignupStatusScreen extends ConsumerWidget {
  const CitizenSignupStatusScreen({Key? key}) : super(key: key);

  Future<bool> someFutureOperation(WidgetRef ref) async {
    //ref.read(citizenSignUpStatusProvider.notifier).state = CitizenSignUpStatusProvider.loading;

    await Future.delayed(Duration(seconds: 2));

    // Randomly simulate success or error
    final success = true;
    ref.read(citizenSignUpStatusProvider.notifier).state =
    success ? CitizenComplainStatus.success : CitizenComplainStatus.error;
    return success;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(citizenSignUpStatusProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // You can now safely use 'await' here if success depends on a Future
      final success = await someFutureOperation(ref);

      ref.read(citizenSignUpStatusProvider.notifier).state =
      success ? CitizenComplainStatus.success : CitizenComplainStatus.error;
    });

    Widget content;
    switch (status) {
      case CitizenComplainStatus.idle:
        content = Text("Please start signup", style: TextStyle(fontSize: 18));
        break;
      case CitizenComplainStatus.loading:
        content = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 12),
            Text("Signing up...", style: TextStyle(fontSize: 18)),
          ],
        );
        break;
      case CitizenComplainStatus.success:
        content = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 48),
            SizedBox(height: 12),
            Text("Signup Successful!", style: TextStyle(fontSize: 18)),
          ],
        );
        break;
      case CitizenComplainStatus.error:
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
    );
  }
}
