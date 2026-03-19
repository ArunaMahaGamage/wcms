import 'package:flutter/foundation.dart';

//@immutable
class Citizen {
  final String firstName;
  final String lastName;
  final String idNumber;
  final String dateOfBirth;
  final String gender;
  final String address;
  final String email;
  final String mobileNumber;
  final String provincial;
  final String district;
  final String divisionalSecretaryDivisions;
  final String password;

  Citizen({
    required this.firstName,
    required this.lastName,
    required this.idNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
    required this.email,
    required this.mobileNumber,
    required this.provincial,
    required this.district,
    required this.divisionalSecretaryDivisions,
    required this.password,
  });

  // Convert JSON to Citizen Object
  factory Citizen.fromJson(Map<String, dynamic> json) {
    return Citizen(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      idNumber: json['idNumber'] ?? '', // Match Java @Column name
      dateOfBirth: json['dateOfBirth'] ?? '',
      gender: json['gender'] ?? '',
      address: json['address'] ?? '',
      email: json['email'] ?? '',
      mobileNumber: json['mobileNumber'] ?? '',
      provincial: json['provincial'] ?? '',
      district: json['district'] ?? '',
      divisionalSecretaryDivisions: json['divisionalSecretaryDivisions'] ?? '',
      password: json['password'] ?? '',
    );
  }

  // Convert Citizen Object to JSON for API POST/PUT
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'idNumber': idNumber,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'address': address,
      'email': email,
      'mobileNumber': mobileNumber,
      'provincial': provincial,
      'district': district,
      'divisionalSecretaryDivisions': divisionalSecretaryDivisions,
      'password': password,
    };
  }

  // Factory constructor for mapping
  factory Citizen.fromMap(Map<String, dynamic> json) {
    return Citizen(
        firstName: json['firstName'] ?? '', lastName: json['lastName'] ?? '', idNumber: json['idNumber'] ?? '',// Note: 'idnumber' matches your query
        dateOfBirth: json['dateOfBirth'] ?? '', gender: json['gender'] ?? '', address: json['address'] ?? '', email: json['email'] ?? '', mobileNumber: json['mobileNumber'] ?? '', provincial: json['provincial'] ?? '', district: json['district'] ?? '', divisionalSecretaryDivisions: json['divisionalSecretaryDivisions'] ?? '', password: json['password'] ?? '');
  }

  // IMPORTANT: copyWith for immutability
  Citizen copyWith({
    String? firstName, String? lastName, String? idNumber, String? dateOfBirth, String? gender, String? address, String? email, String? mobileNumber, String? provincial, String? district, String? divisionalSecretaryDivisions}) {
    return Citizen(
        firstName: firstName ?? this.firstName, lastName: lastName ?? this.lastName, idNumber: idNumber ?? this.idNumber, dateOfBirth: dateOfBirth ?? this.dateOfBirth, gender: gender ?? this.gender, address: address ?? this.address, email: email ?? this.email, mobileNumber: mobileNumber ?? this.mobileNumber, provincial: provincial ?? this.provincial, district: district ?? this.district, divisionalSecretaryDivisions: divisionalSecretaryDivisions ?? this.divisionalSecretaryDivisions, password: password ?? this.password);
  }
}
