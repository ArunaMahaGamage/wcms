import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wcms/api/citizen/citizen_api_service.dart';
import 'package:wcms/models/citizen/citizen.dart';

final citizenSignUpProvider = StateNotifierProvider<CitizenSignUpNotifier, Citizen?>((
    ref,
    ) {
  return CitizenSignUpNotifier();
});

class CitizenSignUpNotifier extends StateNotifier<Citizen?> {
  CitizenSignUpNotifier() : super(null);

// Update a single field while keeping others
  void updateFirstName(String firstName) {
    if (state == null) return;
    // Use copyWith to create a new instance
    state = state!.copyWith(firstName: firstName);
  }

  // Update a single field while keeping others
  void updateLastName(String lastName) {
    if (state == null) return;
    // Use copyWith to create a new instance
    state = state!.copyWith(lastName: lastName);
  }

  // Update a single field while keeping others
  void updateIdNumber(String idNumber) {
    if (state == null) return;
    // Use copyWith to create a new instance
    state = state!.copyWith(idNumber: idNumber);
  }

  // Update a single field while keeping others
  void updateDateOfBirth(String dateOfBirth) {
    if (state == null) return;
    // Use copyWith to create a new instance
    state = state!.copyWith(dateOfBirth: dateOfBirth);
  }

  // Update a single field while keeping others
  void updateGender(String gender) {
    if (state == null) return;
    // Use copyWith to create a new instance
    state = state!.copyWith(gender: gender);
  }

  // Update a single field while keeping others
  void updateAddress(String? address) {
    if (state == null) return;
    // Use copyWith to create a new instance
    state = state!.copyWith(address: address);
  }

  // Update a single field while keeping others
  void updateEmail(String email) {
    if (state == null) return;
    // Use copyWith to create a new instance
    state = state!.copyWith(email: email);
  }

  // Update a single field while keeping others
  void updateMobileNumber(String mobileNumber) {
    if (state == null) return;
    // Use copyWith to create a new instance
    state = state!.copyWith(mobileNumber: mobileNumber);
  }

  // Update a single field while keeping others
  void updateProvincial(String provincial) {
    if (state == null) return;
    // Use copyWith to create a new instance
    state = state!.copyWith(provincial: provincial);
  }

  // Update a single field while keeping others
  void updateDistrict(String district) {
    if (state == null) return;
    // Use copyWith to create a new instance
    state = state!.copyWith(district: district);
  }

  // Update a single field while keeping others
  void updateDivisionalSecretaryDivisions(String divisionalSecretaryDivisions) {
    if (state == null) return;
    // Use copyWith to create a new instance
    state = state!.copyWith(divisionalSecretaryDivisions: divisionalSecretaryDivisions);
  }
}