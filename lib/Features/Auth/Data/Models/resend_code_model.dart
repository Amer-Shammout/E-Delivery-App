class ResendCodeModel {
  final String phoneNumber;

  ResendCodeModel({required this.phoneNumber});

  Map<String, String> toJson() {
    return {'phone_number': phoneNumber};
  }
}
