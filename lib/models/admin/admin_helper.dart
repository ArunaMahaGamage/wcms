class AdminHelper {
  final int? id;
  final String firstName;
  final String lastName;
  final String idNumber;
  final String dateOfBirth;
  final String gender;
  final String address;
  final String mobileNumber;

  AdminHelper({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.idNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
    required this.mobileNumber,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'idNumber': idNumber,
    'dateOfBirth': dateOfBirth,
    'gender': gender,
    'address': address,
    'mobileNumber': mobileNumber,
  };

  factory AdminHelper.fromMap(Map<String, dynamic> map) {
    return AdminHelper(
      id: map['id'],
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      idNumber: map['idNumber'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      gender: map['gender'] ?? 'Male',
      address: map['address'] ?? '',
      mobileNumber: map['mobileNumber'] ?? '',
    );
  }
}