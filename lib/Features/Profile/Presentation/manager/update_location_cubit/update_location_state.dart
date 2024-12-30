part of 'update_location_cubit.dart';

sealed class UpdateLocationState extends Equatable {
  const UpdateLocationState();

  @override
  List<Object> get props => [];
}

final class UpdateLocationInitial extends UpdateLocationState {}

final class UpdateLocationLoading extends UpdateLocationState {}

final class UpdateLocationFailure extends UpdateLocationState {
  final String errMessage;

  const UpdateLocationFailure({required this.errMessage});
}

final class UpdateLocationSuccess extends UpdateLocationState {
  final Response response;

  const UpdateLocationSuccess({required this.response});
}
