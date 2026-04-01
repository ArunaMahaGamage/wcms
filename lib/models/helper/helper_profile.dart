class HelperProfile {
  final int? id;
  final String firstName;
  final String lastName;
  final String idNumber;
  final String mobileNumber;
  final String address;
  final String employeeNumber;
  final String dateOfBirth;

  HelperProfile({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.idNumber,
    required this.mobileNumber,
    required this.address,
    required this.employeeNumber,
    required this.dateOfBirth,
  });

  factory HelperProfile.fromMap(Map<String, dynamic> map) {
    return HelperProfile(
      id: map['id'],
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      idNumber: map['idNumber'] ?? '',
      mobileNumber: map['mobileNumber'] ?? '',
      address: map['address'] ?? '',
      employeeNumber: map['employeeNumber'] ?? 'N/A',
      dateOfBirth: map['dateOfBirth'] ?? '',
    );
  }
}
