import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:viva_city/domain/datasources/route_datasource.dart';
import 'package:viva_city/domain/entities/entities.dart';
import 'package:viva_city/domain/repositories/route_repository.dart';

class RouteRepositoryImpl extends RouteRepository {
  final RouteDatasource datasource;

  RouteRepositoryImpl(this.datasource);

  @override
  Future<Directions> getDirections({required LatLng origin, required LatLng destination}) {
    return datasource.getDirections(origin: origin, destination: destination);
  }

}