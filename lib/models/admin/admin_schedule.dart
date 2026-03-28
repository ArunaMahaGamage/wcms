class AdminSchedule {
  final int? id;
  final String zone;
  final String day;
  final String timeSlot;
  final String wasteType;
  final String vehicleNumber;
  final String driverName;
  final bool isActive;

  AdminSchedule({
    this.id,
    required this.zone,
    required this.day,
    required this.timeSlot,
    required this.wasteType,
    required this.vehicleNumber,
    required this.driverName,
    this.isActive = true,
  });

  factory AdminSchedule.fromMap(Map<String, dynamic> map) {
    return AdminSchedule(
      id: map['id'],
      zone: map['zone'] ?? '',
      day: map['day'] ?? '',
      timeSlot: map['timeSlot'] ?? '',
      wasteType: map['wasteType'] ?? '',
      vehicleNumber: map['vehicleNumber'] ?? '',
      driverName: map['driverName'] ?? '',
      isActive: map['isActive'] ?? true,
    );
  }
}