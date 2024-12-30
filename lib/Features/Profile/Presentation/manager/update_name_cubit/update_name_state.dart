part of 'update_name_cubit.dart';

sealed class UpdateNameState extends Equatable {
  const UpdateNameState();

  @override
  List<Object> get props => [];
}

final class UpdateNameInitial extends UpdateNameState {}

final class UpdateNameLoading extends UpdateNameState {}

final class UpdateNameFailure extends UpdateNameState {
  final String errMessage;

  const UpdateNameFailure({required this.errMessage});
}

final class UpdateNameSuccess extends UpdateNameState {
  final Response response;

  const UpdateNameSuccess({required this.response});
}
