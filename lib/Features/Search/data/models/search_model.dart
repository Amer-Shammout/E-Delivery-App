import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:e_delivery_app/Features/Stores/data/models/store_model.dart';
import 'package:flutter/material.dart';

class SearchModel {
  final List<ProductModel>? products;
  final List<StoreModel>? stores;

  SearchModel({@required this.products, @required this.stores});
}
