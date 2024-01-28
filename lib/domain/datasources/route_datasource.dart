import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:viva_city/domain/entities/entities.dart';

abstract class RouteDatasource {
  Future<Directions> getDirections({required LatLng origin, required LatLng destination});
}