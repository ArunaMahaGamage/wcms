import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/enum/CitizenComplainStatus.dart';


final citizenSignUpStatusProvider = StateProvider<CitizenComplainStatus>((ref) {
  return CitizenComplainStatus.idle;
});
