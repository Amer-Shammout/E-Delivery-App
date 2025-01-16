import 'package:equatable/equatable.dart';

import 'order_item.dart';

class CartModel extends Equatable {
  final int? id;
  final int? userId;
  final String? itemsPrice;
  final String? subTotal;
  final String? deliveryCharge;
  final String? orderStatus;
  final List<OrderItem>? orderItems;

  const CartModel({
    this.id,
    this.userId,
    this.itemsPrice,
    this.orderStatus,
    this.orderItems,
    this.subTotal, this.deliveryCharge, 
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        itemsPrice: json['items_price'] as String?,
        deliveryCharge: json["delivery_charge"] as String? ,
        subTotal: json["subtotal"] as String? ,
        orderStatus: json['order_status'] as String?,
        orderItems: (json['order_items'] as List<dynamic>?)
            ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'total_price': itemsPrice,
        'order_status': orderStatus,
        'order_items': orderItems?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      itemsPrice,
      orderStatus,
      orderItems,
    ];
  }
}
