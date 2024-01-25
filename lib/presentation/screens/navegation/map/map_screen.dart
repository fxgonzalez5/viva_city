import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:viva_city/presentation/providers/providers.dart';

class MapScreen extends StatelessWidget {
  static const String name = 'map_screen'; 

  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mapProvider = context.watch<MapProvider>();

    return Scaffold(
      body: FutureBuilder(
        future: mapProvider.getCurrentPosition(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
      
          return _MapView(
            initialLocation: snapshot.data as LatLng,
            markers: mapProvider.markers,
          );
      
        }
      ),
    );
  }
}

class _MapView extends StatelessWidget {
  final LatLng initialLocation;
  final Set<Marker> markers;

  const _MapView({
    required this.initialLocation,
    required this.markers
  });

  @override
  Widget build(BuildContext context) {
    final CameraPosition initialCamaraPosition = CameraPosition(target: initialLocation, zoom: 15);

    return GoogleMap(
      initialCameraPosition: initialCamaraPosition,
      compassEnabled: false,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      // polylines: polylines,
      markers: markers,
    );
  }
}