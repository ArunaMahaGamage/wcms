import 'package:flutter_riverpod/flutter_riverpod.dart';

final citizenSignupProvider = StateNotifierProvider<AdminSignInProvider, String>((
    ref,
    ) {
  return AdminSignInProvider();
});

class AdminSignInProvider extends StateNotifier<String> {
  AdminSignInProvider() : super('');
}