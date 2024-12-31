import 'package:e_delivery_app/Core/utils/assets.dart';
import 'package:e_delivery_app/Core/utils/functions/set_theme_colors.dart';
import 'package:e_delivery_app/Core/widgets/custom_container.dart';
import 'package:e_delivery_app/Core/widgets/custom_icon.dart';
import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class CustomMap extends StatefulWidget {
  const CustomMap(
      {super.key,
      required this.getUserLocation,
      this.latitide,
      this.longitude});

  final Future<LocationData?> Function() getUserLocation;
  final double? latitide, longitude;

  @override
  State<CustomMap> createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  final MapController _mapController = MapController();
  LocationData? currentLocation;
  Marker? marker;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Stack(
        children: [
          SizedBox(
            height: 178,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: LatLng(
                      (widget.latitide == null || widget.latitide == 0)
                          ? 33.510414
                          : widget.latitide!,
                      (widget.longitude == null || widget.longitude == 0)
                          ? 36.278336
                          : widget.longitude!),
                  initialZoom: 15.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  ),
                  MarkerLayer(
                    markers: (widget.latitide != null && widget.latitide != 0)
                        ? [
                            buildMarker(LocationData.fromMap({
                              "latitude": widget.latitide,
                              'longitude': widget.longitude
                            }))
                          ]
                        : marker != null
                            ? [marker!]
                            : [],
                  ),
                ],
              ),
            ),
          ),
          if (SetThemeColors.isDarkMode(context))
            Container(
              height: 178,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.black.withOpacity(.3),
              ),
            ),
          Positioned(
            right: 8,
            bottom: 8,
            child: CustomIcon(
              icon: Assets.iconsGps,
              onPressed: () async {
                await _getCurrentLocation();
                if (currentLocation != null) {
                  _mapController.move(
                    LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                    15.0,
                  );
                }
              },
              iconSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationData? userLocation = await widget.getUserLocation();
      setState(() {
        currentLocation = userLocation;
        marker = buildMarker(userLocation);
      });
    } on Exception {
      currentLocation = null;
    }
  }

  Marker buildMarker(LocationData? userLocation) {
    return Marker(
      width: 80.0,
      height: 80.0,
      point: LatLng(userLocation!.latitude!, userLocation.longitude!),
      child: Center(
        child: SvgPicture.asset(
          Assets.iconsMapPoint,
          colorFilter: const ColorFilter.mode(kTeranyColor, BlendMode.srcATop),
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
