import 'dart:math';

String generateRandomId(int length) {
  const chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random();

  return String.fromCharCodes(
    Iterable.generate(
      length,
          (_) => chars.codeUnitAt(random.nextInt(chars.length)),
    ),
  );
}

void main() {
  print(generateRandomId(10));
}

String generateId() {
  final random = Random().nextInt(9999);
  return '${DateTime.now().millisecondsSinceEpoch}$random';
}