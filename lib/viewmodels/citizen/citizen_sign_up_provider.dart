import 'package:flutter_riverpod/flutter_riverpod.dart';

final citizenSignupProvider = StateNotifierProvider<CitizenSignUpProvider, String>((
    ref,
    ) {
  return CitizenSignUpProvider();
});

class CitizenSignUpProvider extends StateNotifier<String> {
  CitizenSignUpProvider() : super('');
}