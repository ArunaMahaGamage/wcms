class Complain {
  //final int id;
  final String complainIDNumber;
  final String citizenIDNumber;
  final String complain;
  final String status;

  Complain({
    //required this.id,
    required this.complainIDNumber,
    required this.citizenIDNumber,
    required this.complain,
    required this.status,
  });

  factory Complain.fromJson(Map<String, dynamic> json) {
    return Complain(
      //id: json['id'],
      complainIDNumber: json['complainIDNumber'],
      citizenIDNumber: json['citizenIDNumber'],
      complain: json['complain'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      //'id': id,
      'complainIDNumber': complainIDNumber,
      'citizenIDNumber': citizenIDNumber,
      'complain': complain,
      'status': status,
    };
  }
}