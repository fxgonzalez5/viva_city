import 'package:viva_city/domain/entities/attributable.dart';

class Lodging implements Attributable {
  final int id;
  final String portada;
  final String titulo;
  final double calificacion;
  final String ubicacion;
  final String aeropuerto;
  final String direccion;
  final String telefono;
  final String celular;
  final String correo;
  final String web;
  final String descripcion;
  final String servicios;
  final List<String> imagenes;
  final double latitud;
  final double longitud;
  final String tipo;
  bool isFavorite;

  Lodging({
    required this.id,
    required this.portada,
    required this.titulo,
    required this.calificacion,
    required this.ubicacion,
    required this.aeropuerto,
    required this.direccion,
    required this.telefono,
    required this.celular,
    required this.correo,
    required this.web,
    required this.descripcion,
    required this.servicios,
    required this.imagenes,
    required this.latitud,
    required this.longitud,
    required this.tipo,
    this.isFavorite = false
  });
  
  @override
  getAttribute() => calificacion;
}