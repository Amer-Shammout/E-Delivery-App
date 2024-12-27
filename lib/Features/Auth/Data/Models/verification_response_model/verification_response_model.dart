import 'package:equatable/equatable.dart';

import 'user.dart';

class VerificationResponseModel extends Equatable {
  final String? message;
  final String? token;
  final User? user;
  final bool? isNewUser;

  const VerificationResponseModel({
    this.message,
    this.token,
    this.user,
    this.isNewUser,
  });

  factory VerificationResponseModel.fromJson(Map<String, dynamic> json) {
    return VerificationResponseModel(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      isNewUser: json['is_new_user'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'token': token,
      'user': user?.toJson(),
      'is_new_user': isNewUser,
    };
  }

  @override
  List<Object?> get props => [message, token, user, isNewUser];
}
