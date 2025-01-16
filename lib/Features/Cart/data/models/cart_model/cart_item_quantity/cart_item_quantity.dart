import 'package:equatable/equatable.dart';

import 'order_item.dart';

class CartItemQuantity extends Equatable {
  final List<OrderItem>? orderItems;

  const CartItemQuantity({this.orderItems});

  factory CartItemQuantity.fromJson(Map<String, dynamic> json) {
    return CartItemQuantity(
      orderItems: (json['order_items'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_items': orderItems?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [orderItems];
}
