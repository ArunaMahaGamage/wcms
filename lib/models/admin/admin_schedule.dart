class AdminSchedule {
  final int? id;  final String zoneName;
  final String dayOfWeek;
  final String startTime;
  final String endTime;
  final String wasteType;
  final String vehicleId;
  final String driverId;

  AdminSchedule({
    this.id,
    required this.zoneName,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
    required this.wasteType,
    required this.vehicleId,
    required this.driverId,
  });

  factory AdminSchedule.fromJson(Map<String, dynamic> json) {
    return AdminSchedule(
      id: json['id'],
      zoneName: json['zoneName'] ?? '',
      dayOfWeek: json['dayOfWeek'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      wasteType: json['wasteType'] ?? '',
      vehicleId: json['vehicleId'] ?? '',
      driverId: json['driverId'] ?? '',
    );
  }
}