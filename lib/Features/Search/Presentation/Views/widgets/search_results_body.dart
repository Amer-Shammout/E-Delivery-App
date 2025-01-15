import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/all_results_body.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/products_results_body.dart';
import 'package:e_delivery_app/Features/Search/Presentation/Views/widgets/stores_results_body.dart';
import 'package:e_delivery_app/Features/Search/Presentation/manager/search_cubit/search_cubit.dart';
import 'package:e_delivery_app/Features/Search/data/models/search_model.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

class SearchResultsBody extends StatelessWidget {
  const SearchResultsBody(
      {super.key,
      required this.searchType,
      required this.searchModel,
      @required this.searchSuccess});

  final String searchType;
  final SearchModel searchModel;
  final SearchSuccess? searchSuccess;

  @override
  Widget build(BuildContext context) {
    if (searchType == kAll) {
      return AllResultsBody(
          searchModel: searchModel, searchSuccess: searchSuccess);
    } else if (searchType == kProducts) {
      return ProductsResultsBody(
          products: searchModel.products, searchSuccess: searchSuccess);
    } else {
      return StoresResultsBody(
        stores: searchModel.stores,
      );
    }
  }
}
