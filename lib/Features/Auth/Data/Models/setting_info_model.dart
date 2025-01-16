import 'package:dio/dio.dart';

class SettingInfoModel {
  final String? fullName;
  final double? longitude, latitude;
  final MultipartFile? image;
  final String? lang;

  SettingInfoModel({
    this.fullName,
    this.longitude,
    this.latitude,
    this.image,
    this.lang,
  });

  Map<String, dynamic> toJson() {
    return {
      '_method': 'PUT',
      'full_name': fullName,
      'latitude': latitude,
      'longitude': longitude,
      'image': image,
      'lang': lang,
    };
  }
}
