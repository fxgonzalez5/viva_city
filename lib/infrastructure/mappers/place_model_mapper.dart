import 'package:viva_city/domain/entities/entities.dart';
import 'package:viva_city/infrastructure/models/models.dart';

class PlaceModelMapper {
  static Place placeModelToEntity(PlaceModel placeModel) => Place(
    id: placeModel.id,
    portada: placeModel.coverFileName,
    titulo: placeModel.name,
    calificacion: placeModel.qualification,
    descripcion: placeModel.description,
    horarios: placeModel.schedules,
    ubicacion: placeModel.location,
    imagenes: placeModel.images,
    latitud: placeModel.latitude,
    longitud: placeModel.longitude,
    tipo: placeModel.type
  );
}