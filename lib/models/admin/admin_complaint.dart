class AdminComplaint {
  final int? id;
  final String citizenName;final String idNumber;
  final String complain;
  final String status; // Pending, In-Progress, Resolved, Rejected
  final DateTime createdAt;

  AdminComplaint({
    this.id,
    required this.citizenName,
    required this.idNumber,
    required this.complain,
    required this.status,
    required this.createdAt,
  });

  factory AdminComplaint.fromMap(Map<String, dynamic> map) {
    return AdminComplaint(
      id: map['id'],
      citizenName: map['citizenName'] ?? 'Unknown User',
      idNumber: map['idNumber'] ?? '',
      complain: map['description'] ?? map['complain'] ?? '',
      status: map['status'] ?? 'Pending',
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'])
          : DateTime.now(),
    );
  }
}