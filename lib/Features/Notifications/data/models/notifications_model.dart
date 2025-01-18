import 'package:equatable/equatable.dart';

class NotificationsModel extends Equatable {
  final String? title;
  final String? body;
  final DateTime? createdAt;

  const NotificationsModel({this.title, this.body, this.createdAt});

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      title: json['title'] as String?,
      body: json['body'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
        'created_at': createdAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => [title, body, createdAt];
}
