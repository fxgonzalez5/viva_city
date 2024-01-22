import 'package:viva_city/domain/entities/attributable.dart';

class Event implements Attributable {
  final int id;
  final String portada;
  final String titulo;
  final List<String> etiquetas;
  final String descripcion;
  final List<String> imagenes;
  final String lugar;
  final String hora;
  final String publico;
  final String organizador;
  final double valor;
  final DateTime fecha;
  final String ubicacion;
  final double latitud;
  final double longitud;
  final String tipo;
  final bool isFavorite;

  Event({
    required this.id,
    required this.portada,
    required this.titulo,
    required this.etiquetas,
    required this.descripcion,
    required this.imagenes,
    required this.lugar,
    required this.hora,
    required this.publico,
    required this.organizador,
    required this.valor,
    required this.fecha,
    required this.ubicacion,
    required this.latitud,
    required this.longitud,
    required this.tipo,
    this.isFavorite = false
  });
  
  @override
  getAttribute() => etiquetas;
}