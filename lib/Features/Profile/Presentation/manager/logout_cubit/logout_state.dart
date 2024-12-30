part of 'logout_cubit.dart';

sealed class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

final class LogoutInitial extends LogoutState {}

final class LogoutLoading extends LogoutState {}

final class LogoutFailure extends LogoutState {
  final String errMessage;

  const LogoutFailure({required this.errMessage});
}

final class LogoutSuccess extends LogoutState {
  final Response response;

  const LogoutSuccess({required this.response});

}
