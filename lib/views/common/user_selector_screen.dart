import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/image_links.dart';
import '../../config/string_values.dart';
import '../../core/routes.dart';
import '../../enum/user_role.dart';
import '../../viewmodels/user_role_provider.dart';

class RoleSelectorScreen extends ConsumerWidget {
  const RoleSelectorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Center(child: Text(StringValues.appName, style: Theme.of(context).textTheme.headlineSmall)),
            const SizedBox(height: 50),
            //const SizedBox(height: 150),
            Image.network(
              ImageLinks.loginScreenImage,
              //width: 150,
              //height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 50),
            Text(StringValues.appUserSelectScreenSubTitle, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                RoleButton(role: UserRole.citizen, label: "Citizen"),
                const SizedBox(height: 50),
                RoleButton(role: UserRole.admin, label: "Admin"),
                const SizedBox(height: 50),
                RoleButton(role: UserRole.driver, label: "Driver"),
                const SizedBox(height: 50),
                RoleButton(role: UserRole.helper, label: "Helper"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RoleButton extends ConsumerWidget {
  final UserRole role;
  final String label;

  RoleButton({required this.role, required this.label});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text(label),
        onPressed: () {
          ref.read(selectedRoleProvider.notifier).state = role;

          // Navigate to appropriate login screen
          switch (role) {
            case UserRole.admin:
              //Navigator.push(context, MaterialPageRoute(builder: (_) => AdminLoginScreen()));
                Navigator.pushReplacementNamed(context, Routes.signInAdmin);
              break;
            case UserRole.citizen:
              //Navigator.push(context, MaterialPageRoute(builder: (_) => CitizenLoginScreen()));
              Navigator.pushReplacementNamed(context, Routes.signInCitizen);
              break;
            case UserRole.driver:
              //Navigator.push(context, MaterialPageRoute(builder: (_) => DriverLoginScreen()));
              Navigator.pushReplacementNamed(context, Routes.signInDriver);
              break;
            case UserRole.helper:
              //Navigator.push(context, MaterialPageRoute(builder: (_) => HelperLoginScreen()));
              Navigator.pushReplacementNamed(context, Routes.signInHelper);
              break;
          }
        },
      ),
    );
  }
}
