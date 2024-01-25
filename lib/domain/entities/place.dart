import 'package:viva_city/domain/entities/attributable.dart';

class Place implements Attributable {
  final int id;
  final String portada;
  final String titulo;
  final double calificacion;
  final String descripcion;
  final List<String> horarios;
  final String ubicacion;
  final List<String> imagenes;
  final double latitud;
  final double longitud;
  final String tipo;
  bool isFavorite;

  Place({
    required this.id,
    required this.portada,
    required this.titulo,
    required this.calificacion,
    required this.descripcion,
    required this.horarios,
    required this.ubicacion,
    required this.imagenes,
    required this.latitud,
    required this.longitud,
    required this.tipo,
    this.isFavorite = false
  });
  
  @override
  getAttribute() => calificacion;
}