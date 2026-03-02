import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/viewmodels/settings_provider.dart';
import 'package:wcms/views/admin/admin_dashboard_screen.dart';
import 'package:wcms/views/admin/admin_signin_screen.dart';
import 'package:wcms/views/citizen/citizen_complain_list_screen.dart';
import 'package:wcms/views/citizen/citizen_complain_screen.dart';
import 'package:wcms/views/citizen/citizen_complain_status_Screen.dart';
import 'package:wcms/views/citizen/citizen_dashboard_screen.dart';
import 'package:wcms/views/citizen/citizen_signIn_screen.dart';
import 'package:wcms/views/citizen/citizen_sign_up_status_screen.dart';
import 'package:wcms/views/citizen/citizen_signup_screen.dart';
import 'package:wcms/views/common/user_selector_screen.dart';
import 'package:wcms/views/driver/driver_dashboard_screen.dart';
import 'package:wcms/views/driver/driver_sign_in_screen.dart';
import 'package:wcms/views/helper/helper_dashboard_screen.dart';
import 'package:wcms/views/helper/helper_signin_screen.dart';
import 'package:wcms/views/onboarding_screen.dart';
import 'core/routes.dart';
import 'models/settings.dart';
import 'views/common/splash_screen.dart';


class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    return MaterialApp(
      title: 'Waste Collection Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF1A73E8),
        useMaterial3: true,
        brightness: Brightness.light, // Base light theme
      ),
      darkTheme: ThemeData(
        // Define a dark theme
        colorSchemeSeed: const Color(0xFF1A73E8),
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: switch (settings.themeMode) {
        AppThemeMode.light => ThemeMode.light,
        AppThemeMode.dark => ThemeMode.dark,
        AppThemeMode.system => ThemeMode.system,
      },
      initialRoute: Routes.splash,
      routes: {
        Routes.splash: (_) => const SplashScreen(),
        Routes.userSelector: (_) => const RoleSelectorScreen(),
        // Admin
        Routes.signInAdmin: (_) => const AdminSignInScreen(),
        Routes.dashboardAdmin: (_) => const AdminDashboardScreen(),
        // Citizen
        Routes.signUpCitizen: (_) => const CitizenSignupScreen(),
        Routes.signUpCitizenStatus: (_) => const CitizenSignupStatusScreen(),
        Routes.signInCitizen: (_) => const CitizenSignInScreen(),
        Routes.dashboardCitizen: (_) => const CitizenDashboardScreen(),
        Routes.complaintCitizen: (_) => CitizenComplainScreen(),
        Routes.complaintCitizenStatus: (_) => CitizenComplainStatusScreen(),
        Routes.complaintListCitizen: (_) => CitizenComplainListScreen(),
        // Driver
        Routes.signInDriver: (_) => const DriverSignInScreen(),
        Routes.dashboardDriver: (_) => const DriverDashboardScreen(),
        // Helper
        Routes.signInHelper: (_) => const HelperSignInScreen(),
        Routes.dashboardHelper: (_) => const HelperDashboardScreen(),
        Routes.onboarding: (_) => const OnboardingScreen(),
        //Routes.home: (_) => const HomeScreen(),
      },
    );
  }
}
