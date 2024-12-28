class ResendOtpModel {
  final String phoneNumber;

  ResendOtpModel({required this.phoneNumber});

  Map<String, String> toJson() {
    return {'phone_number': phoneNumber};
  }
}
