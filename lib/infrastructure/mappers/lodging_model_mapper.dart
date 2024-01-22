import 'package:viva_city/domain/entities/entities.dart';
import 'package:viva_city/infrastructure/models/models.dart';

class   LodgingModelMapper {
  static Lodging lodgingModelToEntity(LodgingModel lodgingModel) => Lodging(
    id: lodgingModel.id,
    portada: lodgingModel.coverFileName,
    titulo: lodgingModel.name,
    calificacion: lodgingModel.qualification,
    ubicacion: lodgingModel.location,
    aeropuerto: lodgingModel.airport,
    direccion: lodgingModel.address,
    telefono: lodgingModel.telephone,
    celular: lodgingModel.cellphone,
    correo: lodgingModel.email,
    web: lodgingModel.web,
    descripcion: lodgingModel.description,
    servicios: lodgingModel.services,
    imagenes: lodgingModel.images,
    latitud: lodgingModel.latitude,
    longitud: lodgingModel.longitude,
    tipo: lodgingModel.type
  );
}