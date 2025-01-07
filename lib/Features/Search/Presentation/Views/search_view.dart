import 'package:e_delivery_app/Core/widgets/system_status_app_bar.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SystemStatusAppBar(),
      body: SearchViewBody(),
    );
  }
}
