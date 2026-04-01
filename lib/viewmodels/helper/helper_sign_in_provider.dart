
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/models/helper/helper_sign_in.dart';

final helperSignInStoreProvider = StateNotifierProvider<HelperSignInProvider, HelperSignIn?>((
    ref,
    ) {
  return HelperSignInProvider();
});

class HelperSignInProvider extends StateNotifier<HelperSignIn?> {
  HelperSignInProvider() : super(null);

  void updateIdNumber(HelperSignIn citizenSignIn) {
    if (state == null) return;
    // Use copyWith to create a new instance
    state = state!.copyWith(idNumber: citizenSignIn.idNumber);
    state = state!.copyWith(userId: citizenSignIn.userId);
  }
}