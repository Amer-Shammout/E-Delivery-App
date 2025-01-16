import 'package:equatable/equatable.dart';

import 'store.dart';

class ProductDetails extends Equatable {
  final Store? store;
  final bool? isFavorite;
  final bool? isCart;
  final String? category;
  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final int? stockQuantity;
  final String? imageUrl;
  final String? deliveryPeriod;
  final dynamic discountValue;
  final String? discountStart;
  final String? discountEnd;

  const ProductDetails({
    this.store,
    this.isFavorite,
    this.isCart,
    this.category,
    this.id,
    this.name,
    this.description,
    this.price,
    this.stockQuantity,
    this.imageUrl,
    this.deliveryPeriod,
    this.discountValue,
    this.discountStart,
    this.discountEnd,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      store: json['store'] == null
          ? null
          : Store.fromJson(json['store'] as Map<String, dynamic>),
      isFavorite: json['is_favorite'] as bool?,
      isCart: json['is_cart'] as bool?,
      category: json['category'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      stockQuantity: json['stock_quantity'] as int?,
      imageUrl: json['image_url'] as String?,
      deliveryPeriod: json['delivery_period'] as String?,
      discountValue: json['discount_value'] as dynamic,
      discountStart: json['discount_start'] as String?,
      discountEnd: json['discount_end'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'store': store?.toJson(),
        'is_favorite': isFavorite,
        'is_cart': isCart,
        'category': category,
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'stock_quantity': stockQuantity,
        'image_url': imageUrl,
        'delivery_period': deliveryPeriod,
        'discount_value': discountValue,
        'discount_start': discountStart,
        'discount_end': discountEnd,
      };

  @override
  List<Object?> get props {
    return [
      store,
      isFavorite,
      isCart,
      category,
      id,
      name,
      description,
      price,
      stockQuantity,
      imageUrl,
      deliveryPeriod,
      discountValue,
      discountStart,
      discountEnd,
    ];
  }
}
