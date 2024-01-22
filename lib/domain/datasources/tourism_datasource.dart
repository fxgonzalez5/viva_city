import 'package:viva_city/domain/entities/entities.dart';

abstract class TourismDatasource {
  Future<List<Event>> getEvents();
  
  Future<List<Place>> getPlaces();

  Future<List<Lodging>> getLodging();
}