import 'package:equatable/equatable.dart';

import 'order.dart';

class OrderModel extends Equatable {
  final String? message;
  final Order? order;

  const OrderModel({this.message, this.order});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      message: json['message'] as String?,
      order: json['order'] == null
          ? null
          : Order.fromJson(json['order'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'order': order?.tojSON(),
    };
  }

  @override
  List<Object?> get props => [message, order];
}
