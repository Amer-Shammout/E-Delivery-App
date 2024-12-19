import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/custom_history_tile.dart';
import 'package:flutter/material.dart';

class SearchHistoryBody extends StatelessWidget {
  const SearchHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) =>
          CustomHistoryTile(title: 'search $index', onTap: () {}),
      itemCount: 20,
      physics: const BouncingScrollPhysics(),
    );
  }
}
