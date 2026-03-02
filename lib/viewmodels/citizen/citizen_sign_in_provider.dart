import 'package:flutter_riverpod/flutter_riverpod.dart';

final citizenSignInProvider = StateNotifierProvider<CitizenSignInProvider, String>((
    ref,
    ) {
  return CitizenSignInProvider();
});

class CitizenSignInProvider extends StateNotifier<String> {
  CitizenSignInProvider() : super('');
}