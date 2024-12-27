class VerificationModel {
  final String phoneNumber, code;

  VerificationModel({required this.phoneNumber, required this.code});

  Map<String, dynamic> toJson() {
    return {
      'phone_number': phoneNumber,
      'code': code,
    };
  }
}
