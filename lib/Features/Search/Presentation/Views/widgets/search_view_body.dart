import 'dart:developer';

import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/search_view_app_bar.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/search_view_body_builder.dart';
import 'package:e_delivery_app/Features/Search/Presentation/manager/search_cubit/search_cubit.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String searchType = kAll;

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
            return SearchViewBodyBuilder(searchType: searchType);
          },
        ),
        const SizedBox(
          height: kSpacing * 4,
        )
      ],
    );
  }
}
