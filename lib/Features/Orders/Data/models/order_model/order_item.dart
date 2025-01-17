import 'package:equatable/equatable.dart';

import 'product_details.dart';

class OrderItem extends Equatable {
  final ProductDetails? productDetails;
  final dynamic quantity;

  const OrderItem({this.productDetails, this.quantity});

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        productDetails: json['product_details'] == null
            ? null
            : ProductDetails.fromJson(
                json['product_details'] as Map<String, dynamic>),
        quantity: json['quantity'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'product_details': productDetails?.toJson(),
        'quantity': quantity,
      };

  @override
  List<Object?> get props => [productDetails, quantity];
}
