class AdminComplain {
  //final int id;
  final String complainIDNumber;
  final String citizenIDNumber;
  final String complainTitle;
  final String complain;
  final String status;

  AdminComplain({
    //required this.id,
    required this.complainIDNumber,
    required this.citizenIDNumber,
    required this.complainTitle,
    required this.complain,
    required this.status,
  });

  factory AdminComplain.fromJson(Map<String, dynamic> json) {
    return AdminComplain(
      //id: json['id'],
      complainIDNumber: json['complainIDNumber'],
      citizenIDNumber: json['citizenIDNumber'],
      complainTitle: json['complainTitle'],
      complain: json['complain'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      //'id': id,
      'complainIDNumber': complainIDNumber,
      'citizenIDNumber': citizenIDNumber,
      'complainTitle': complainTitle,
      'complain': complain,
      'status': status,
    };
  }
}