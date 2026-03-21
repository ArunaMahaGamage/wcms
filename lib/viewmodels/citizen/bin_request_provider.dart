import 'package:flutter_riverpod/flutter_riverpod.dart';

final binRequestFormProvider = StateProvider<Map<String, dynamic>>((ref) => {
  'email': '',
  'address': '',
  'idNumber': '',
  'description': '',
  'lat': '',
  'lon': '',
});
