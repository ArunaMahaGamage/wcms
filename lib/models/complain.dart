class Complain {
  final String complainTitle;
  final String complainIDNumber;
  final String citizenIDNumber;
  final String complain;
  final String status;

  Complain({
    required this.complainTitle,
    required this.complainIDNumber,
    required this.citizenIDNumber,
    required this.complain,
    required this.status,
  });

  factory Complain.fromJson(Map<String, dynamic> json) {
    return Complain(
      complainTitle: json['complainTitle'],
      complainIDNumber: json['complainIDNumber'],
      citizenIDNumber: json['citizenIDNumber'],
      complain: json['complain'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'complainTitle': complainTitle,
      'complainIDNumber': complainIDNumber,
      'citizenIDNumber': citizenIDNumber,
      'complain': complain,
      'status': status,
    };
  }
}