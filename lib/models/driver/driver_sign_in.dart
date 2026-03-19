class DriverSignIn {
  final int? id;
  final String driverLicenceNumber;
  final String userId;
  final String password;
  //final String oauth2Token;
  //final String refreshToken;

  DriverSignIn({
    this.id,
    required this.driverLicenceNumber,
    required this.userId,
    required this.password,
    //required this.oauth2Token,
    //required this.refreshToken,
  });

  // CopyWith for immutability
  DriverSignIn copyWith({
    int? id,
    String? driverLicenceNumber,
    String? userId,
    String? password,
    //String? oauth2Token,
    //String? refreshToken,
  }) {
    return DriverSignIn(
      id: id ?? this.id,
      driverLicenceNumber: driverLicenceNumber ?? this.driverLicenceNumber,
      userId: userId ?? this.userId,
      password: password ?? this.password,
      //oauth2Token: oauth2Token ?? this.oauth2Token,
      //refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'password': password,
      //'oauth2Token': oauth2Token,
      //'refreshToken': refreshToken,
    };
  }

  // Create from JSON
  factory DriverSignIn.fromJson(Map<String, dynamic> json) {
    return DriverSignIn(
      id: json['id'],
      driverLicenceNumber: json['driverLicenceNumber'],
      userId: json['userId'],
      password: json['password'],
      //oauth2Token: json['oauth2Token'],
      //refreshToken: json['refreshToken'],
    );
  }

// Convert to Map (for saving to DB or API)
Map<String, dynamic> toMap() { return { 'id': id, 'userId': userId, 'password': password,
  //'oauth2Token': oauth2Token, 'refreshToken': refreshToken,
}; }

// Create from Map (for reading from DB or API)
factory DriverSignIn.fromMap(Map<String, dynamic> map) { return DriverSignIn( id: map['id'] is int ? map['id'] : int.tryParse(map['id'].toString()), driverLicenceNumber: map['driverLicenceNumber'] ?? '', userId: map['userId'] ?? '', password: map['password'] ?? '',
  //oauth2Token: map['oauth2Token'] ?? '', refreshToken: map['refreshToken'] ?? '',
); }

}
