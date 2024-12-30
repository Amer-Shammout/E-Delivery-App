part of 'update_image_cubit.dart';

sealed class UpdateImageState extends Equatable {
  const UpdateImageState();

  @override
  List<Object> get props => [];
}

final class UpdateImageInitial extends UpdateImageState {}

final class UpdateImageLoading extends UpdateImageState {}

final class UpdateImageSuccess extends UpdateImageState {
  final Response response;

  const UpdateImageSuccess({required this.response});
}

final class UpdateImageFailure extends UpdateImageState {
  final String errMessage;

  const UpdateImageFailure({required this.errMessage});
}
