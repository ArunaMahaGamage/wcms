import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/api/citizen/citizen_sign_in_api_service.dart';
import 'package:wcms/models/citizen/citizen_sign_in.dart';
import 'package:wcms/views/citizen/citizen_signIn_screen.dart';

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

final citizenSignInResponseProvider = FutureProvider<CitizenSignIn>((ref) async {
  final citizenSignInData = ref.watch(citizenSignInProvider);
  final citizen = CitizenSignIn.fromMap(citizenSignInData);

  return await CitizenSignInApiService().readCitizenSign(citizen);
});