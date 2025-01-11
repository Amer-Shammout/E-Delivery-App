import 'package:equatable/equatable.dart';

class StoreModel extends Equatable {
  final int? id;
  final int? userId;
  final dynamic productsCount;
  final String? name;
  final String? latitude;
  final String? longitude;
  final String? image;
  final String? logoColor;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const StoreModel({
    this.id,
    this.userId,
    this.name,
    this.latitude,
    this.longitude,
    this.image,
    this.logoColor,
    this.createdAt,
    this.updatedAt,
    this.productsCount,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        productsCount: json['products count'] as dynamic,
        name: json['name'] as String?,
        latitude: json['latitude'] as String?,
        longitude: json['longitude'] as String?,
        image: json['image'] as String?,
        logoColor: json['Logo_color'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'name': name,
        'latitude': latitude,
        'longitude': longitude,
        'image': image,
        'Logo_color': logoColor,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      name,
      latitude,
      longitude,
      image,
      logoColor,
      createdAt,
      updatedAt,
    ];
  }
}
