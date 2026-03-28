class RouteScheduleRequest {
  final String zoneName;
  final String dayOfWeek;final String startTime;
  final String endTime;
  final String wasteType;
  final String vehicleId;
  final String driverId;

  RouteScheduleRequest({
    required this.zoneName,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
    required this.wasteType,
    required this.vehicleId,
    required this.driverId,
  });

  Map<String, dynamic> toJson() => {
    'zoneName': zoneName,
    'dayOfWeek': dayOfWeek,
    'startTime': startTime,
    'endTime': endTime,
    'wasteType': wasteType,
    'vehicleId': vehicleId,
    'driverId': driverId,
  };
}