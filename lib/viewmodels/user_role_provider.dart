import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enum/user_role.dart';

final selectedRoleProvider = StateProvider<UserRole?>((ref) => null);
