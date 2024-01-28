import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class Directions {
  final List<PointLatLng> polylinePoints;
  final String distance;
  final String duration;

  Directions({
    required this.polylinePoints,
    required this.distance,
    required this.duration,
  });
}