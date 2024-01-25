import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/screens/screens.dart';


class LoadingScreen extends StatelessWidget {
  static const String name = 'loading_screen'; 
  final List<Map<String, dynamic>>? data;

  const LoadingScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final mapProvider = context.watch<MapProvider>();
    if (data != null) {
      for (final element in data!) {
        final items = element['items'] as List<dynamic>;
        for (final obj in items) {
          mapProvider.addMarker(obj.titulo, obj.ubicacion , LatLng(obj.latitud, obj.longitud), element['icon']);
        }
      }
    }

    return Scaffold(
      body: mapProvider.isAllGranted
        ? const MapScreen()
        : const GpsAccessScreen(),
   );
  }
}