import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'user.dart';

class VerificationModel extends Equatable {
  final String? message;
  final String? token;
  final User? user;
  final bool? isNewUser;

  const VerificationModel({
    this.message,
    this.token,
    this.user,
    this.isNewUser,
  });

  factory VerificationModel.fromMessageVerificationSuccessfulPleaseCompleteYourProfileToken1NbYvAmmwlH45JxWOmClMwIAyeiPfJSnFrZgDd4xzb0a07f02UserId1FullNameNullPhoneNumber963967730281LangEnImageNullRoleUserLatitudeNullLongitudeNullThemeModeLightAllowGps0AllowNotifications0IsNewUserTrue(
      Map<String, dynamic> data) {
    return VerificationModel(
      message: data['message'] as String?,
      token: data['token'] as String?,
      user: data['user'] == null
          ? null
          : User
              .fromMessageVerificationSuccessfulPleaseCompleteYourProfileToken1NbYvAmmwlH45JxWOmClMwIAyeiPfJSnFrZgDd4xzb0a07f02UserId1FullNameNullPhoneNumber963967730281LangEnImageNullRoleUserLatitudeNullLongitudeNullThemeModeLightAllowGps0AllowNotifications0IsNewUserTrue(
                  data['user'] as Map<String, dynamic>),
      isNewUser: data['is_new_user'] as bool?,
    );
  }

  Map<String, dynamic>
      toMessageVerificationSuccessfulPleaseCompleteYourProfileToken1NbYvAmmwlH45JxWOmClMwIAyeiPfJSnFrZgDd4xzb0a07f02UserId1FullNameNullPhoneNumber963967730281LangEnImageNullRoleUserLatitudeNullLongitudeNullThemeModeLightAllowGps0AllowNotifications0IsNewUserTrue() {
    return {
      'message': message,
      'token': token,
      'user': user
          ?.toMessageVerificationSuccessfulPleaseCompleteYourProfileToken1NbYvAmmwlH45JxWOmClMwIAyeiPfJSnFrZgDd4xzb0a07f02UserId1FullNameNullPhoneNumber963967730281LangEnImageNullRoleUserLatitudeNullLongitudeNullThemeModeLightAllowGps0AllowNotifications0IsNewUserTrue(),
      'is_new_user': isNewUser,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VerificationModel].
  factory VerificationModel.fromJson(String data) {
    return VerificationModel
        .fromMessageVerificationSuccessfulPleaseCompleteYourProfileToken1NbYvAmmwlH45JxWOmClMwIAyeiPfJSnFrZgDd4xzb0a07f02UserId1FullNameNullPhoneNumber963967730281LangEnImageNullRoleUserLatitudeNullLongitudeNullThemeModeLightAllowGps0AllowNotifications0IsNewUserTrue(
            json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VerificationModel] to a JSON string.
  String toJson() => json.encode(
      toMessageVerificationSuccessfulPleaseCompleteYourProfileToken1NbYvAmmwlH45JxWOmClMwIAyeiPfJSnFrZgDd4xzb0a07f02UserId1FullNameNullPhoneNumber963967730281LangEnImageNullRoleUserLatitudeNullLongitudeNullThemeModeLightAllowGps0AllowNotifications0IsNewUserTrue());

  @override
  List<Object?> get props => [message, token, user, isNewUser];
}
