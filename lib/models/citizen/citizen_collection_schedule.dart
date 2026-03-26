class CitizenCollectionSchedule {
  final String day;
  final String startTime;
  final String endTime;
  final String wasteType; // e.g., "Plastic", "Organic", "Paper"
  final String vehicleNumber;
  final String driverContact;

  CitizenCollectionSchedule({
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.wasteType,
    required this.vehicleNumber,
    required this.driverContact,
  });

  // Example factory for API integration later
  factory CitizenCollectionSchedule.fromJson(Map<String, dynamic> json) {
    return CitizenCollectionSchedule(
      day: json['day'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      wasteType: json['wasteType'] ?? '',
      vehicleNumber: json['vehicleNumber'] ?? '',
      driverContact: json['driverContact'] ?? '',
    );
  }
}