import 'package:equatable/equatable.dart';

class StoreId extends Equatable {
  final String? name;
  final dynamic logoColor;
  final String? image;

  const StoreId({this.name, this.logoColor, this.image});

  factory StoreId.fromJson(Map<String, dynamic> json) => StoreId(
        name: json['name'] as String?,
        logoColor: json['logo_color'] as dynamic,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'logo_color': logoColor,
        'image': image,
      };

  @override
  List<Object?> get props => [name, logoColor, image];
}
