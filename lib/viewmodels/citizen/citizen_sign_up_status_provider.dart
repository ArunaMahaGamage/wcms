import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CitizenSignUpStatusProvider { idle, loading, success, error }

final citizenSignUpStatusProvider = StateProvider<CitizenSignUpStatusProvider>((ref) {
  return CitizenSignUpStatusProvider.idle;
});
