import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:viva_city/domain/datasources/route_datasource.dart';
import 'package:viva_city/domain/entities/entities.dart';
import 'package:viva_city/infrastructure/mappers/mappers.dart';
import 'package:viva_city/infrastructure/models/models.dart';

class GoogleDatasource extends RouteDatasource {
  final _apiKey = 'AIzaSyAXBB3K9t_C0B9wgHQHwZ3_IeHagAaf0mM';
  final _baseUrl = 'maps.googleapis.com';

  @override
  Future<Directions> getDirections({required LatLng origin, required LatLng destination}) async {
    final url = Uri.https(
      _baseUrl, '/maps/api/directions/json',
      {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': _apiKey,
      }
    );
    final response = await http.get(url);
    final directionsModelResponse = directionsModelFromMap(response.body);
    return DirectionsModelMapper.directionsModelToEntity(directionsModelResponse);
  }

}