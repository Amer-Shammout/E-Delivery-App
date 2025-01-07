import 'package:e_delivery_app/Features/Search/data/models/search_model.dart';
import 'package:e_delivery_app/Features/Search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchInitial());

  final SearchRepo _searchRepo;

  Future<void> search({required String q}) async {
    if (q == '') {
      emit(SearchInitial());
    } else {
      emit(SearchLoading());
      var result = await _searchRepo.search(q: q);
      result.fold((failure) {
        emit(SearchFailure(errMessage: failure.errMessage));
      }, (searchModel) {
        emit(SearchSuccess(searchModel: searchModel));
      });
    }
  }
}
