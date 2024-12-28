part of 'verification_cubit.dart';

sealed class VerificationState extends Equatable {
  const VerificationState();

  @override
  List<Object> get props => [];
}

final class VerificationInitial extends VerificationState {}

final class VerificationLoading extends VerificationState {}

final class VerificationSuccess extends VerificationState {
  final VerificationResponseModel verificationResponseModel;

  const VerificationSuccess({required this.verificationResponseModel});
}

final class VerificationFailure extends VerificationState {
  final String errMessage;

  const VerificationFailure({required this.errMessage});
}
