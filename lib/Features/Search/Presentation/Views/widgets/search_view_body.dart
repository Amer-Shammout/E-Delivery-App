import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/no_search_operations_body.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/search_view_app_bar.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchViewAppBar(),
        NoSearchOperationsBody(),
        // Expanded(child: SearchHistoryBody(),)
      ],
    );
  }
}

