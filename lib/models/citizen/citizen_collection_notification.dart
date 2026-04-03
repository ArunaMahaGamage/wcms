class CitizenCollectionNotification {
  final String id;
  final String title;
  final String message;
  //final DateTime timestamp;
  final String type; // 'alert', 'info', 'delay'
  bool isRead;

  CitizenCollectionNotification({
    required this.id,
    required this.title,
    required this.message,
    //required this.timestamp,
    required this.type,
    this.isRead = false,
  });

  // Factory to convert JSON from Spring Boot to Dart Object
  factory CitizenCollectionNotification.fromJson(Map<String, dynamic> json) {
    return CitizenCollectionNotification(
      id: json['id']?.toString() ?? '',
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      //timestamp: json['timestamp'] != null
       //   ? DateTime.parse(json['timestamp'])
     //     : DateTime.now(),
      type: json['type'] ?? 'info',
      isRead: json['isRead'] ?? false,
    );
  }
}