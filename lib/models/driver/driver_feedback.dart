class DriverFeedback {
  final int? id;
  final String helperId;
  final String vehicleId;
  final String category; // e.g., Vehicle Issue, Route Issue, General
  final String comment;
  final String status; // Pending, Reviewed

  DriverFeedback({
    this.id,
    required this.helperId,
    required this.vehicleId,
    required this.category,
    required this.comment,
    this.status = "Pending",
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'helperId': helperId,
    'vehicleId': vehicleId,
    'category': category,
    'comment': comment,
    'status': status,
  };

  factory DriverFeedback.fromMap(Map<String, dynamic> map) {
    return DriverFeedback(
      id: map['id'],
      helperId: map['helperId'] ?? '',
      vehicleId: map['vehicleId'] ?? '',
      category: map['category'] ?? 'General',
      comment: map['comment'] ?? '',
      status: map['status'] ?? 'Pending',
    );
  }
}