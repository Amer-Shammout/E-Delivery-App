import 'package:equatable/equatable.dart';

import 'order_item.dart';

class OrderModel extends Equatable {
  final dynamic id;
  final dynamic userId;
  final String? itemsPrice;
  final String? deliveryCharge;
  final String? subtotal;
  final String? orderStatus;
  final List<OrderItem>? orderItems;

  const OrderModel({
    this.id,
    this.userId,
    this.itemsPrice,
    this.deliveryCharge,
    this.subtotal,
    this.orderStatus,
    this.orderItems,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'] as dynamic,
        userId: json['user_id'] as dynamic,
        itemsPrice: json['items_price'] as String?,
        deliveryCharge: json['delivery_charge'] as String?,
        subtotal: json['subtotal'] as String?,
        orderStatus: json['order_status'] as String?,
        orderItems: (json['order_items'] as List<dynamic>?)
            ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'items_price': itemsPrice,
        'delivery_charge': deliveryCharge,
        'subtotal': subtotal,
        'order_status': orderStatus,
        'order_items': orderItems?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      itemsPrice,
      deliveryCharge,
      subtotal,
      orderStatus,
      orderItems,
    ];
  }
}
