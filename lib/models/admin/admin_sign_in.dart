class AdminSignIn {
  final int? id;
  final String idNumber;
  final String userID;
  final String password;
  //final String oauth2Token;
  //final String refreshToken;

  AdminSignIn({
    this.id,
    required this.idNumber,
    required this.userID,
    required this.password,
    //required this.oauth2Token,
    //required this.refreshToken,
  });

  // CopyWith for immutability
  AdminSignIn copyWith({
    int? id,
    String? idNumber,
    String? userID,
    String? password,
    String? oauth2Token,
    String? refreshToken,
  }) {
    return AdminSignIn(
      id: id ?? this.id,
      idNumber: idNumber ?? this.idNumber,
      userID: userID ?? this.userID,
      password: password ?? this.password,
      //oauth2Token: oauth2Token ?? this.oauth2Token,
      //refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idNumber': idNumber,
      'userID': userID,
      'password': password,
      //'oauth2Token': oauth2Token,
      //'refreshToken': refreshToken,
    };
  }

  // Create from JSON
  factory AdminSignIn.fromJson(Map<String, dynamic> json) {
    return AdminSignIn(
      id: json['id'],
      idNumber: json['idNumber'],
      userID: json['userID'],
      password: json['password'],
      //oauth2Token: json['oauth2Token'],
      //refreshToken: json['refreshToken'],
    );
  }

// Convert to Map (for saving to DB or API)
Map<String, dynamic> toMap() { return { 'id': id, 'idNumber': idNumber, 'userID': userID, 'password': password,
  //'oauth2Token': oauth2Token, 'refreshToken': refreshToken,
}; }

// Create from Map (for reading from DB or API)
factory AdminSignIn.fromMap(Map<String, dynamic> map) { return AdminSignIn( id: map['id'] is int ? map['id'] : int.tryParse(map['id'].toString()), idNumber: map['idNumber'] ?? '', userID: map['userID'] ?? '', password: map['password'] ?? '',
  //oauth2Token: map['oauth2Token'] ?? '', refreshToken: map['refreshToken'] ?? '',
); }

}
