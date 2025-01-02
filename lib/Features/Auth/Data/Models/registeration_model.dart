class RegisterationModel {
  final String phoneNumber, fcmToken;

  RegisterationModel({required this.phoneNumber, required this.fcmToken});

  Map<String, dynamic> toJson() {
    return {
      'fcm_token': fcmToken,
      'phone_number': phoneNumber,
    };
  }
}
