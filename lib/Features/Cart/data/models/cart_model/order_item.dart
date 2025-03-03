import 'package:e_delivery_app/Core/Data/Models/product_model/product_model.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class OrderItem extends Equatable {
  final ProductModel? productDetails;
  int? quantity;

  OrderItem({this.productDetails, this.quantity});

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        productDetails: json['product_details'] == null
            ? null
            : ProductModel.fromJson(
                json['product_details'] as Map<String, dynamic>),
        quantity: json['quantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'product_details': productDetails?.toJson(),
        'quantity': quantity,
      };

  @override
  List<Object?> get props => [productDetails, quantity];
}
