import 'package:flutter_riverpod/flutter_riverpod.dart';

final citizenSignupProvider = StateNotifierProvider<SignupProvider, String>((
    ref,
    ) {
  return SignupProvider();
});

class SignupProvider extends StateNotifier<String> {
  SignupProvider() : super('');
}