import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:viva_city/domain/datasources/tourism_datasource.dart';
import 'package:viva_city/domain/entities/entities.dart';
import 'package:viva_city/infrastructure/mappers/mappers.dart';
import 'package:viva_city/infrastructure/models/models.dart';

class DjangoDatasource extends TourismDatasource {
  final _baseUrl = '10.0.2.2:8000';

  @override
  Future<List<Event>> getEvents() async {
    final url = Uri.http(_baseUrl, '/api/events/');
    final response = await http.get(url);
    final eventModelResponse = eventModelFromMap(const Utf8Decoder().convert(response.body.codeUnits));
    return eventModelResponse.map((eventModel) => EventModelMapper.eventModelToEntity(eventModel)).toList();
  }

  @override
  Future<List<Lodging>> getLodging() async {
    final url = Uri.http(_baseUrl, '/api/lodging/');
    final response = await http.get(url);
    final lodgingModelResponse = lodgingModelFromMap(const Utf8Decoder().convert(response.body.codeUnits));
    return lodgingModelResponse.map((lodgingModel) => LodgingModelMapper.lodgingModelToEntity(lodgingModel)).toList();
  }

  @override
  Future<List<Place>> getPlaces() async {
    final url = Uri.http(_baseUrl, '/api/places/');
    final response = await http.get(url);
    final placeModelResponse = placeModelFromMap(const Utf8Decoder().convert(response.body.codeUnits));
    return placeModelResponse.map((placeModel) => PlaceModelMapper.placeModelToEntity(placeModel)).toList();
  }

}