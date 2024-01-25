import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:viva_city/config/helpers/helpers.dart';

class MapProvider extends ChangeNotifier {
  StreamSubscription? gpsServiceSubscription;
  bool isGpsEnabled = false;
  bool isGpsPermissionGranted = false;
  Set<Marker> markers = {};
  bool isNotEmpty = false;

  MapProvider() {
    _init();
  }

  bool get isAllGranted {
    return isGpsEnabled && isGpsPermissionGranted;
  }

  Future<void> _init() async {
    isGpsEnabled = await _checkGpsStatus();
    isGpsPermissionGranted = await _isPermissionGranted();
    notifyListeners();
  }

  Future<bool> _checkGpsStatus() async {
    //* Al iniciar la aplicación, se verifica si el GPS está activado
    final isEnable = await Geolocator.isLocationServiceEnabled();

    gpsServiceSubscription = Geolocator.getServiceStatusStream().listen((event) {
      //* En tiempo de ejecución, se verifica si el GPS está activado
      isGpsEnabled  = (event.index == 1) ? true : false;
      notifyListeners();
    });

    return isEnable;
  }

  Future<bool> _isPermissionGranted() async {
    final isGranted = await Permission.location.isGranted;
    return isGranted;
  }

  Future<void> askGpsAccess() async {
    final status = await Permission.location.request();

    switch (status) {
      case PermissionStatus.granted:
        isGpsPermissionGranted = true;
        break;
      default:
        isGpsPermissionGranted = true;
        openAppSettings();
        break;
    }
    notifyListeners();
  }

  Future<LatLng?> getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    return LatLng(position.latitude, position.longitude);
  }

  Future<void> addMarker(String title, String location, LatLng position, String path) async {
    final Uint8List iconBytes = await Utils.getBytesFromAsset(path, 150);
    final icon = BitmapDescriptor.fromBytes(iconBytes);

    markers.add(
      Marker(
        markerId: MarkerId(position.toString()),
        position: position,
        icon: icon,
        infoWindow: InfoWindow(
          title: title,
          snippet: location,
        ),
      )
    );
    notifyListeners();
  }
}