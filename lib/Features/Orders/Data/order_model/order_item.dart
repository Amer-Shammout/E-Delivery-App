import 'package:equatable/equatable.dart';

class OrderItem extends Equatable {
  final int? productId;
  final int? quantity;
  final double? price;
  final String? product;

  const OrderItem({
    this.productId,
    this.quantity,
    this.price,
    this.product,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['product_id'] as int?,
      quantity: json['quantity'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      product: json['product'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
      'price': price,
      'product': product,
    };
  }

  @override
  List<Object?> get props => [productId, quantity, price, product];
}
