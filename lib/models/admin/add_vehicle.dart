class AddVehicle {
  final String vehicleId;
  final String type;
  final String model;
  final String manufacture;
  final String manufactureYear;
  final String fuelType;
  final String seat;
  final String gearType;

  AddVehicle({
    required this.vehicleId,
    required this.type,
    required this.model,
    required this.manufacture,
    required this.manufactureYear,
    required this.fuelType,
    required this.seat,
    required this.gearType,
  });

  Map<String, dynamic> toJson() => {
    'vehicleId': vehicleId,
    'type': type,
    'model': model,
    'manufacture': manufacture,
    'manufactureYear': manufactureYear,
    'fuelType': fuelType,
    'seat': seat,
    'gearType': gearType,
  };

  factory AddVehicle.fromMap(Map<String, dynamic> map) {
    return AddVehicle(
      vehicleId: map['vehicleId'],
      type: map['type'] ?? '',
      model: map['model'] ?? '',
      manufacture: map['manufacture'] ?? '',
      manufactureYear: map['manufactureYear'] ?? '',
      fuelType: map['fuelType'] ?? '',
      seat: map['seat'] ?? '',
      gearType: map['gearType'] ?? '',
    );
  }
}