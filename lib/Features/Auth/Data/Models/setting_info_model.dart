import 'dart:io';

import 'package:dio/dio.dart';

class SettingInfoModel {
  final String? fullName;
  final double? longitude, latitude;
  final MultipartFile? image;
  // final String? image;

  SettingInfoModel({
    this.fullName,
    this.longitude,
    this.latitude,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'latitude': latitude,
      'longitude': longitude,
      'image': image
    };
  }
}
