import 'package:dio/dio.dart';

class SettingInfoModel {
  final String fullName;
  final double longitude, latitude;
  final MultipartFile profileImage;

  SettingInfoModel({required this.fullName, required this.longitude, required this.latitude, required this.profileImage});

   Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'latitude': latitude,
      'longitude': longitude,
      'image': profileImage
    };
  }
}
