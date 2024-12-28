import 'package:dio/dio.dart';

class SettingInfoModel {
  final String? fullName;
  final double? longitude, latitude;
  final MultipartFile? profileImage;

  SettingInfoModel({ this.fullName,  this.longitude,  this.latitude,  this.profileImage});

   Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'latitude': latitude,
      'longitude': longitude,
      'image': profileImage
    };
  }
}
