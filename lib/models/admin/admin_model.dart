class AdminModel {
  final String firstName;
  final String? lastName;
  final String idNumber;
  final String dateOfBirth;
  final String gender;
  final String address;
  final String email;
  final String mobileNumber;
  final String position;
  final String department;
  final String employeeNumber;
  final String provincial;
  final String district;
  final String divisionalSecretaryDivisions;

  AdminModel({
    required this.firstName,
    this.lastName,
    required this.idNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
    required this.email,
    required this.mobileNumber,
    required this.position,
    required this.department,
    required this.employeeNumber,
    required this.provincial,
    required this.district,
    required this.divisionalSecretaryDivisions,
  });

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'idNumber': idNumber,
    'dateOfBirth': dateOfBirth,
    'gender': gender,
    'address': address,
    'email': email,
    'mobileNumber': mobileNumber,
    'position': position,
    'department': department,
    'employeeNumber': employeeNumber,
    'provincial': provincial,
    'district': district,
    'divisionalSecretaryDivisions': divisionalSecretaryDivisions,
  };

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'],
      idNumber: map['idNumber'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? '',
      gender: map['gender'] ?? 'Male',
      address: map['address'] ?? '',
      email: map['email'] ?? '',
      mobileNumber: map['mobileNumber'] ?? '',
      position: map['position'] ?? '',
      department: map['department'] ?? '',
      employeeNumber: map['employeeNumber'] ?? '',
      provincial: map['provincial'] ?? '',
      district: map['district'] ?? '',
      divisionalSecretaryDivisions: map['divisionalSecretaryDivisions'] ?? '',
    );
  }
}