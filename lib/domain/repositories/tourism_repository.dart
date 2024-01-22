import 'package:viva_city/domain/entities/entities.dart';

abstract class TourismRepository {
  Future<List<Event>> getEvents();
  
  Future<List<Place>> getPlaces();

  Future<List<Lodging>> getLodging();
}