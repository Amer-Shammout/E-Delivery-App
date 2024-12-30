class SettingInfoModel {
  final String? fullName;
  final double? longitude, latitude;

  SettingInfoModel({
    this.fullName,
    this.longitude,
    this.latitude,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
