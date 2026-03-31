/*
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
}*/

class AdminDriver {
  final int? id;
  final String driverLicenceNumber;
  final String driverIdNumber;
  final String driverFullName;
  final String firstName;
  final String lastName;
  final String birthDate;
  final String email;
  final String licenceDateOfIssue;
  final String address;
  final String mobileNumber;
  final String? password; // Transient in Java, used for registration

  // License Categories
  final bool lightMotorcycles;
  final bool motorcycles;
  final bool motorTricycle;
  final bool dualPurposeVehicles;
  final bool quadricycles;
  final bool lightMotorLorry;
  final bool motorLorry;
  final bool heavyMotorLorry;
  final bool lightMotorCoach;
  final bool motorCoach;
  final bool heavyMotorCoach;
  final bool landVehicle;
  final bool motorizedInvalidCarriage;

  AdminDriver({
    this.id,
    required this.driverLicenceNumber,
    required this.driverIdNumber,
    required this.driverFullName,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.email,
    required this.licenceDateOfIssue,
    required this.address,
    required this.mobileNumber,
    this.password,
    this.lightMotorcycles = false,
    this.motorcycles = false,
    this.motorTricycle = false,
    this.dualPurposeVehicles = false,
    this.quadricycles = false,
    this.lightMotorLorry = false,
    this.motorLorry = false,
    this.heavyMotorLorry = false,
    this.lightMotorCoach = false,
    this.motorCoach = false,
    this.heavyMotorCoach = false,
    this.landVehicle = false,
    this.motorizedInvalidCarriage = false,
  });

  /// Convert Dart Object to JSON (for API POST/PUT)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'driverLicenceNumber': driverLicenceNumber,
      'driverIdNumber': driverIdNumber,
      'driverFullName': driverFullName,
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': birthDate,
      'email': email,
      'licenceDateOfIssue': licenceDateOfIssue,
      'address': address,
      'mobileNumber': mobileNumber,
      'password': password,
      'lightMotorcycles': lightMotorcycles,
      'motorcycles': motorcycles,
      'motorTricycle': motorTricycle,
      'dualPurposeVehicles': dualPurposeVehicles,
      'quadricycles': quadricycles,
      'lightMotorLorry': lightMotorLorry,
      'motorLorry': motorLorry,
      'heavyMotorLorry': heavyMotorLorry,
      'lightMotorCoach': lightMotorCoach,
      'motorCoach': motorCoach,
      'heavyMotorCoach': heavyMotorCoach,
      'landVehicle': landVehicle,
      'motorizedInvalidCarriage': motorizedInvalidCarriage,
    };
  }

  /// Convert JSON Map to Dart Object (for API GET)
  factory AdminDriver.fromMap(Map<String, dynamic> map) {
    return AdminDriver(
      id: map['id'],
      driverLicenceNumber: map['driverLicenceNumber'] ?? '',
      driverIdNumber: map['driverIdNumber'] ?? '',
      driverFullName: map['driverFullName'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      birthDate: map['birthDate'] ?? '',
      email: map['email'] ?? '',
      licenceDateOfIssue: map['licenceDateOfIssue'] ?? '',
      address: map['address'] ?? '',
      mobileNumber: map['mobileNumber'] ?? '',
      password: map['password'],
      lightMotorcycles: map['lightMotorcycles'] ?? false,
      motorcycles: map['motorcycles'] ?? false,
      motorTricycle: map['motorTricycle'] ?? false,
      dualPurposeVehicles: map['dualPurposeVehicles'] ?? false,
      quadricycles: map['quadricycles'] ?? false,
      lightMotorLorry: map['lightMotorLorry'] ?? false,
      motorLorry: map['motorLorry'] ?? false,
      heavyMotorLorry: map['heavyMotorLorry'] ?? false,
      lightMotorCoach: map['lightMotorCoach'] ?? false,
      motorCoach: map['motorCoach'] ?? false,
      heavyMotorCoach: map['heavyMotorCoach'] ?? false,
      landVehicle: map['landVehicle'] ?? false,
      motorizedInvalidCarriage: map['motorizedInvalidCarriage'] ?? false,
    );
  }
}