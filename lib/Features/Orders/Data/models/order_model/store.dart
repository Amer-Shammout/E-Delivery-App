import 'package:equatable/equatable.dart';

class Store extends Equatable {
  final int? id;
  final String? name;
  final String? latitude;
  final String? longitude;
  final dynamic logoColor;
  final String? image;
  final int? productsCount;

  const Store({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.logoColor,
    this.image,
    this.productsCount,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json['id'] as int?,
        name: json['name'] as String?,
        latitude: json['latitude'] as String?,
        longitude: json['longitude'] as String?,
        logoColor: json['logo_color'] as dynamic,
        image: json['image'] as String?,
        productsCount: json['products count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'latitude': latitude,
        'longitude': longitude,
        'logo_color': logoColor,
        'image': image,
        'products count': productsCount,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      latitude,
      longitude,
      logoColor,
      image,
      productsCount,
    ];
  }
}
