import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

abstract class SettingInfoFunctions {
  static Future<XFile?> pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    return image;
  }

  static Future<LocationData?> getUserLocation() async {
    Location location = Location();

    LocationData? userLocation = await location.getLocation();
    return userLocation;
  }
}
