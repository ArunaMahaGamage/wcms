class HelperSignIn {
  final int? id;
  final String idNumber;
  final String userId;
  final String password;
  //final String oauth2Token;
  //final String refreshToken;

  HelperSignIn({
    this.id,
    required this.idNumber,
    required this.userId,
    required this.password,
    //required this.oauth2Token,
    //required this.refreshToken,
  });

  // CopyWith for immutability
  HelperSignIn copyWith({
    int? id,
    String? idNumber,
    String? userId,
    String? password,
    String? oauth2Token,
    String? refreshToken,
  }) {
    return HelperSignIn(
      id: id ?? this.id,
      idNumber: idNumber ?? this.idNumber,
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
      'idNumber': idNumber,
      'userId': userId,
      'password': password,
      //'oauth2Token': oauth2Token,
      //'refreshToken': refreshToken,
    };
  }

  // Create from JSON
  factory HelperSignIn.fromJson(Map<String, dynamic> json) {
    return HelperSignIn(
      id: json['id'],
      idNumber: json['idNumber'],
      userId: json['userId'],
      password: json['password'],
      //oauth2Token: json['oauth2Token'],
      //refreshToken: json['refreshToken'],
    );
  }

// Convert to Map (for saving to DB or API)
Map<String, dynamic> toMap() { return { 'id': id, 'idNumber': idNumber, 'userId': userId, 'password': password,
  //'oauth2Token': oauth2Token, 'refreshToken': refreshToken,
}; }

// Create from Map (for reading from DB or API)
factory HelperSignIn.fromMap(Map<String, dynamic> map) { return HelperSignIn( id: map['id'] is int ? map['id'] : int.tryParse(map['id'].toString()), idNumber: map['idNumber'] ?? '', userId: map['userId'] ?? '', password: map['password'] ?? '',
  //oauth2Token: map['oauth2Token'] ?? '', refreshToken: map['refreshToken'] ?? '',
); }

}
