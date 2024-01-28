import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:viva_city/domain/entities/entities.dart';
import 'package:viva_city/infrastructure/models/models.dart';

class DirectionsModelMapper {
  static Directions directionsModelToEntity(DirectionsModel directionsModel) => Directions(
    polylinePoints: PolylinePoints().decodePolyline(directionsModel.routes.first.overviewPolyline.points),
    distance: directionsModel.routes.first.legs.first.distance.text,
    duration: directionsModel.routes.first.legs.first.duration.text,
  );
}