class CitizenRequestNewVehicleRoute {
  final int? id;
  final String email;
  final String address;
  final String idNumber;
  final String description;
  final String lat;
  final String lon;

  CitizenRequestNewVehicleRoute({
    this.id,
    required this.email,
    required this.address,
    required this.idNumber,
    required this.description,
    required this.lat,
    required this.lon,
  });

  // Convert to JSON for API calls
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'address': address,
      'idNumber': idNumber,
      'description': description,
      'lat': lat,
      'lon': lon,
    };
  }

  // Helper method to create a copy with updated fields
  CitizenRequestNewVehicleRoute copyWith({
    int? id,
    String? email,
    String? address,
    String? idNumber,
    String? description,
    String? lat,
    String? lon,
  }) {
    return CitizenRequestNewVehicleRoute(
      id: id ?? this.id,
      email: email ?? this.email,
      address: address ?? this.address,
      idNumber: idNumber ?? this.idNumber,
      description: description ?? this.description,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }
}