import 'package:e_delivery_app/Features/Home/Data/Repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit(this._homeRepo) : super(GetCategoriesInitial());
  final HomeRepo _homeRepo;
  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    var result = await _homeRepo.getCategories();
    result.fold(
      (failure) {
        emit(GetCategoriesFailure(errMessage: failure.errMessage));
      },
      (categories) {
        emit(GetCategoriesSuccess(categories: categories));
      },
    );
  }
}
