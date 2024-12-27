import 'dart:convert';

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

  factory User.fromMessageVerificationSuccessfulPleaseCompleteYourProfileToken1NbYvAmmwlH45JxWOmClMwIAyeiPfJSnFrZgDd4xzb0a07f02UserId1FullNameNullPhoneNumber963967730281LangEnImageNullRoleUserLatitudeNullLongitudeNullThemeModeLightAllowGps0AllowNotifications0IsNewUserTrue(
      Map<String, dynamic> data) {
    return User(
      id: data['id'] as int?,
      fullName: data['full_name'] as dynamic,
      phoneNumber: data['phone_number'] as String?,
      lang: data['lang'] as String?,
      image: data['image'] as dynamic,
      role: data['role'] as String?,
      latitude: data['latitude'] as dynamic,
      longitude: data['longitude'] as dynamic,
      themeMode: data['theme_mode'] as String?,
      allowGps: data['allow_gps'] as int?,
      allowNotifications: data['allow_notifications'] as int?,
    );
  }

  Map<String, dynamic>
      toMessageVerificationSuccessfulPleaseCompleteYourProfileToken1NbYvAmmwlH45JxWOmClMwIAyeiPfJSnFrZgDd4xzb0a07f02UserId1FullNameNullPhoneNumber963967730281LangEnImageNullRoleUserLatitudeNullLongitudeNullThemeModeLightAllowGps0AllowNotifications0IsNewUserTrue() {
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

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User
        .fromMessageVerificationSuccessfulPleaseCompleteYourProfileToken1NbYvAmmwlH45JxWOmClMwIAyeiPfJSnFrZgDd4xzb0a07f02UserId1FullNameNullPhoneNumber963967730281LangEnImageNullRoleUserLatitudeNullLongitudeNullThemeModeLightAllowGps0AllowNotifications0IsNewUserTrue(
            json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(
      toMessageVerificationSuccessfulPleaseCompleteYourProfileToken1NbYvAmmwlH45JxWOmClMwIAyeiPfJSnFrZgDd4xzb0a07f02UserId1FullNameNullPhoneNumber963967730281LangEnImageNullRoleUserLatitudeNullLongitudeNullThemeModeLightAllowGps0AllowNotifications0IsNewUserTrue());

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
