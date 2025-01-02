class RegistrationModel {
  final String phoneNumber, fcmToken;

  RegistrationModel({required this.phoneNumber, required this.fcmToken});

  Map<String, dynamic> toJson() {
    return {
      'fcm_token': fcmToken,
      'phone_number': phoneNumber,
    };
  }
}
