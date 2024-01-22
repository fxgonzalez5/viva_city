import 'package:viva_city/domain/entities/entities.dart';
import 'package:viva_city/infrastructure/models/models.dart';

class EventModelMapper {
  static Event eventModelToEntity(EventModel eventModel) => Event(
    id: eventModel.id,
    portada: eventModel.coverFileName,
    titulo: eventModel.name,
    etiquetas: eventModel.labels,
    descripcion: eventModel.description,
    imagenes: eventModel.images,
    lugar: eventModel.place,
    hora: eventModel.hour,
    publico: eventModel.public,
    organizador: eventModel.organizer,
    valor: eventModel.value,
    fecha: eventModel.date,
    ubicacion: eventModel.location,
    latitud: eventModel.latitude,
    longitud: eventModel.longitude,
    tipo: eventModel.type
  );
}