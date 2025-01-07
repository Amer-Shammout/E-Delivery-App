import 'dart:developer';

import 'package:e_delivery_app/Core/widgets/loading/search_loading.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/no_search_operations_body.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/search_results_body.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/search_view_app_bar.dart';
import 'package:e_delivery_app/Features/Search/Presentation/manager/search_cubit/search_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    String searchType = kAll;
    return Column(
      children: [
        SearchViewAppBar(
          onSelected: (value) {
            searchType = value;
            log(value);
          },
          onChanged: (q) {
            BlocProvider.of<SearchCubit>(context).search(q: q);
          },
        ),
        const SizedBox(
          height: kSpacing * 4,
        ),
        BlocBuilder<SearchCubit, SearchState>(
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
              return CustomSearchLoading(
                searchType: searchType,
              );
            }
          },
        )
      ],
    );
  }
}
