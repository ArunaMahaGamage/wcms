class HelperNotification {
  final int? id;
  final String title;
  final String message;
  final DateTime sentAt;
  final String type; // 'alert', 'assignment', 'info'
  final bool isRead;

  HelperNotification({
    this.id,
    required this.title,
    required this.message,
    required this.sentAt,
    required this.type,
    this.isRead = false,
  });

  factory HelperNotification.fromMap(Map<String, dynamic> map) {
    return HelperNotification(
      id: map['id'],
      title: map['title'] ?? '',
      message: map['message'] ?? '',
      sentAt: map['sentAt'] != null
          ? DateTime.parse(map['sentAt'])
          : DateTime.now(),
      type: map['type'] ?? 'info',
      isRead: map['isRead'] ?? false,
    );
  }
}