import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final dynamic fullName;
  final String? phoneNumber;
  final String? lang;
  final dynamic image;
  final String? role;
  final dynamic latitude;
  final dynamic longitude;
  final String? themeMode;
  final int? allowGps;
  final int? allowNotifications;

  const User({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.lang,
    this.image,
    this.role,
    this.latitude,
    this.longitude,
    this.themeMode,
    this.allowGps,
    this.allowNotifications,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      fullName: json['full_name'] as dynamic,
      phoneNumber: json['phone_number'] as String?,
      lang: json['lang'] as String?,
      image: json['image'] as dynamic,
      role: json['role'] as String?,
      latitude: json['latitude'] as dynamic,
      longitude: json['longitude'] as dynamic,
      themeMode: json['theme_mode'] as String?,
      allowGps: json['allow_gps'] as int?,
      allowNotifications: json['allow_notifications'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'phone_number': phoneNumber,
      'lang': lang,
      'image': image,
      'role': role,
      'latitude': latitude,
      'longitude': longitude,
      'theme_mode': themeMode,
      'allow_gps': allowGps,
      'allow_notifications': allowNotifications,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      fullName,
      phoneNumber,
      lang,
      image,
      role,
      latitude,
      longitude,
      themeMode,
      allowGps,
      allowNotifications,
    ];
  }
}
