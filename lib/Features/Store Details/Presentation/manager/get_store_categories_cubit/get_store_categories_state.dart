part of 'get_store_categories_cubit.dart';

sealed class GetStoreCategoriesState extends Equatable {
  const GetStoreCategoriesState();

  @override
  List<Object> get props => [];
}

final class GetStoreCategoriesInitial extends GetStoreCategoriesState {}

final class GetStoreCategoriesLoading extends GetStoreCategoriesState {}

final class GetStoreCategoriesFailure extends GetStoreCategoriesState {
  final String errMessage;

  const GetStoreCategoriesFailure({required this.errMessage});
}

final class GetStoreCategoriesSuccess extends GetStoreCategoriesState {
  final List<String> storeCategories;

  const GetStoreCategoriesSuccess({required this.storeCategories});
}
