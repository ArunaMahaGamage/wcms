class AdminDriver {
  final String driverLicenceNumber;
  final String driverIDNumber;
  final String driverFullName;
  final String firstName;
  final String lastName;
  final String birthDate;
  final String licenceDateOfIssue;
  final String address;
  final String mobileNumber;
  final Map<String, bool> licenseCategories;

  AdminDriver({
    required this.driverLicenceNumber,
    required this.driverIDNumber,
    required this.driverFullName,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.licenceDateOfIssue,
    required this.address,
    required this.mobileNumber,
    required this.licenseCategories,
  });

  Map<String, dynamic> toJson() {
    return {
      'driverLicenceNumber': driverLicenceNumber,
      'driverIDNumber': driverIDNumber,
      'driverFullName': driverFullName,
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': birthDate,
      'licenceDateOfIssue': licenceDateOfIssue,
      'address': address,
      'mobileNumber': mobileNumber,
      ...licenseCategories, // Spreads categories into the top level JSON
    };
  }

  factory AdminDriver.fromMap(Map<String, dynamic> map) {
    final categories = [
      "lightMotorcycles", "motorcycles", "motorTricycle", "dualPurposeVehicles",
      "quadricycles", "lightMotorLorry", "motorLorry", "heavyMotorLorry",
      "lightMotorCoach", "motorCoach", "heavyMotorCoach", "landVehicle",
      "motorizedInvalidCarriage"
    ];

    Map<String, bool> extractedCategories = {};
    for (var cat in categories) {
      extractedCategories[cat] = map[cat] ?? false;
    }

    return AdminDriver(
      driverLicenceNumber: map['driverLicenceNumber'] ?? '',
      driverIDNumber: map['driverIDNumber'] ?? '',
      driverFullName: map['driverFullName'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      birthDate: map['birthDate'] ?? '',
      licenceDateOfIssue: map['licenceDateOfIssue'] ?? '',
      address: map['address'] ?? '',
      mobileNumber: map['mobileNumber'] ?? '',
      licenseCategories: extractedCategories,
    );
  }
}