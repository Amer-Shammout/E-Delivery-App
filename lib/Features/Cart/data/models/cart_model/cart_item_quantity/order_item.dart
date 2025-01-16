import 'package:equatable/equatable.dart';

class OrderItem extends Equatable {
  int? productId;
  int? quantity;

  OrderItem({this.productId, this.quantity});

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['product_id'] as int?,
      quantity: json['quantity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
    };
  }

  @override
  List<Object?> get props => [productId, quantity];
}
