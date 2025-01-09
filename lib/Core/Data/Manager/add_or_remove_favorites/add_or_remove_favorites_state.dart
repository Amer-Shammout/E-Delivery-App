part of 'add_or_remove_favorites_cubit.dart';

sealed class AddOrRemoveFavoritesState extends Equatable {
  const AddOrRemoveFavoritesState();

  @override
  List<Object> get props => [];
}

final class AddOrRemoveFavoritesInitial extends AddOrRemoveFavoritesState {}

final class AddOrRemoveFavoritesLoading extends AddOrRemoveFavoritesState {}

final class AddOrRemoveFavoritesSuccess extends AddOrRemoveFavoritesState {
  final Response response;

  const AddOrRemoveFavoritesSuccess({required this.response});
}

final class AddOrRemoveFavoritesFailure extends AddOrRemoveFavoritesState {
  final String errMessage;

  const AddOrRemoveFavoritesFailure({required this.errMessage});
}
