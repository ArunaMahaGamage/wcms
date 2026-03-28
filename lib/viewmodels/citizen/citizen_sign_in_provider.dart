import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/models/citizen/citizen_sign_in.dart';

final citizenSignInStoreProvider = StateNotifierProvider<CitizenSignInProvider, CitizenSignIn?>((
    ref,
    ) {
  return CitizenSignInProvider();
});

class CitizenSignInProvider extends StateNotifier<CitizenSignIn?> {
  CitizenSignInProvider() : super(null);

  void updateIdNumber(CitizenSignIn citizenSignIn) {
    if (state == null) return;
    // Use copyWith to create a new instance
    state = state!.copyWith(idNumber: citizenSignIn.idNumber);
    state = state!.copyWith(userID: citizenSignIn.userID);
  }
}