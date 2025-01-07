import 'package:e_delivery_app/Core/widgets/loading/search_loading.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/no_search_operations_body.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/search_results_body.dart';
import 'package:e_delivery_app/Features/Search/Presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBodyBuilder extends StatelessWidget {
  const SearchViewBodyBuilder({
    super.key,
    required this.searchType,
  });

  final String searchType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const Expanded(child: NoSearchOperationsBody());
        } else if (state is SearchSuccess) {
          return Expanded(
            child: SearchResultsBody(
              searchType: searchType,
              searchModel: state.searchModel,
            ),
          );
        } else if (state is SearchFailure) {
          return Text(state.errMessage);
        } else {
          return Expanded(
            child: CustomSearchLoading(
              searchType: searchType,
            ),
          );
        }
      },
    );
  }
}
