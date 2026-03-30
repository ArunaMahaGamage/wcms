class ManageTeam {
  final int? id;
  final String vehicleId;
  final String idNumber;
  final String jobRole;

  ManageTeam({
    this.id,
    required this.vehicleId,
    required this.idNumber,
    required this.jobRole,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'vehicleId': vehicleId,
    'idNumber': idNumber,
    'jobRole': jobRole,
  };

  factory ManageTeam.fromMap(Map<String, dynamic> map) {
    return ManageTeam(
      id: map['id'],
      vehicleId: map['vehicleId'] ?? '',
      idNumber: map['idNumber'] ?? '',
      jobRole: map['jobRole'] ?? '',
    );
  }
}