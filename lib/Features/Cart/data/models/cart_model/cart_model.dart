import 'package:equatable/equatable.dart';

import 'order_item.dart';

class CartModel extends Equatable {
  final int? id;
  final int? userId;
  final String? totalPrice;
  final String? orderStatus;
  final List<OrderItem>? orderItems;

  const CartModel({
    this.id,
    this.userId,
    this.totalPrice,
    this.orderStatus,
    this.orderItems,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        totalPrice: json['total_price'] as String?,
        orderStatus: json['order_status'] as String?,
        orderItems: (json['order_items'] as List<dynamic>?)
            ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'total_price': totalPrice,
        'order_status': orderStatus,
        'order_items': orderItems?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      totalPrice,
      orderStatus,
      orderItems,
    ];
  }
}
