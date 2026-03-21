class RequestNewBin {
  final int? id;
  final String email;
  final String address;
  final String idNumber;
  final String description;
  final String lat;
  final String lon;

  RequestNewBin({
    this.id,
    required this.email,
    required this.address,
    required this.idNumber,
    required this.description,
    required this.lat,
    required this.lon,
  });

  Map<String, dynamic> toMap() {
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

  factory RequestNewBin.fromMap(Map<String, dynamic> map) {
    return RequestNewBin(
      id: map['id'],
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      idNumber: map['idNumber'] ?? '',
      description: map['description'] ?? '',
      lat: map['lat'] ?? '',
      lon: map['lon'] ?? '',
    );
  }
}