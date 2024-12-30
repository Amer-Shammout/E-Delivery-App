
import 'package:dio/dio.dart';

class SettingInfoModel {
  final String? fullName;
  final double? longitude, latitude;
  final MultipartFile? image;

  SettingInfoModel({
    this.fullName,
    this.longitude,
    this.latitude,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      '_method': 'PUT',
      'full_name': fullName,
      'latitude': latitude,
      'longitude': longitude,
      'image': image
    };
  }
}
