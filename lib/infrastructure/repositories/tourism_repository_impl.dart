import 'package:viva_city/domain/datasources/tourism_datasource.dart';
import 'package:viva_city/domain/entities/entities.dart';
import 'package:viva_city/domain/repositories/tourism_repository.dart';

class TourismRepositoryImpl extends TourismRepository {
  final TourismDatasource datasource;

  TourismRepositoryImpl(this.datasource);

  @override
  Future<List<Event>> getEvents() {
    return datasource.getEvents();
  }

  @override
  Future<List<Lodging>> getLodging() {
    return datasource.getLodging();
  }

  @override
  Future<List<Place>> getPlaces() {
    return datasource.getPlaces();
  }

}