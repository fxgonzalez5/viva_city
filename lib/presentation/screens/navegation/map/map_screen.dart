import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/providers/providers.dart';

class MapScreen extends StatelessWidget {
  static const String name = 'map_screen'; 

  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isActivated = GoRouterState.of(context).extra is Map<String, dynamic> ? false : true;
    final navegationProvider = context.read<NavegationProvider>();
    final mapProvider = context.watch<MapProvider>();
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: isActivated ? AppBar(title: const Text('Mapa')) : null,
      extendBody: true,
      body: FutureBuilder(
        future: mapProvider.getCurrentPosition(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
      
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              _MapView(
                initialLocation: snapshot.data as LatLng,
                markers: mapProvider.markers,
                polylines: mapProvider.polylines,
              ),

              if (mapProvider.directions != null)
                Card(
                  color: colors.secondary.withOpacity(0.75),
                  child: Padding(
                    padding: EdgeInsets.all(responsive.wp(2.5)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: colors.primary,
                          child: const Icon(Icons.directions, color: Colors.white),
                        ),
                        SizedBox(width: responsive.wp(2.5)),
                        Text('${mapProvider.directions!.distance}, ${mapProvider.directions!.duration}', style: TextStyle(color: colors.primary)),
                      ],
                    ),
                  ),
                ),
            ],
          );
        }
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const _BtnToggleUserRoute(),
          SizedBox(height: responsive.hp(1)),
          const _BtnLocation(),
        ],
      ),
      bottomNavigationBar: navegationProvider.currentPage == 2 ? SizedBox(height: responsive.hp(10)) : null,
    );
  }
}

class _BtnToggleUserRoute extends StatelessWidget {
  const _BtnToggleUserRoute();

  @override
  Widget build(BuildContext context) {
    final mapProvider = context.watch<MapProvider>();
    final colors = Theme.of(context).colorScheme;

    return FloatingActionButton(
      heroTag: null,
      backgroundColor: colors.primary,
      foregroundColor: Colors.white,
      onPressed: mapProvider.endPosition == null 
      ? null
      : () async {
        if (mapProvider.polylines.isNotEmpty){
          if (mapProvider.polylines.first.points.contains(mapProvider.endPosition)) {
            mapProvider.directions = null;
            mapProvider.polylines.clear();
          } else {
            await mapProvider.drawRoute(colors.secondary);
          }
        } else {
          await mapProvider.drawRoute(colors.secondary);
        }
      },
      child: Icon(mapProvider.polylines.isEmpty || !mapProvider.polylines.first.points.contains(mapProvider.endPosition) ? Icons.near_me_outlined : Icons.near_me_disabled_outlined),
    );
  }
}

class _BtnLocation extends StatelessWidget {
  const _BtnLocation();

  @override
  Widget build(BuildContext context) {
    final mapProvider = context.watch<MapProvider>();
    final colors = Theme.of(context).colorScheme;

    return FloatingActionButton(
      heroTag: null,
      backgroundColor: colors.primary,
      foregroundColor: Colors.white,
      onPressed: mapProvider.moveCamera,
      child: const Icon(Icons.my_location_rounded),
    );
  }
}

class _MapView extends StatelessWidget {
  final LatLng initialLocation;
  final Set<Marker> markers;
  final Set<Polyline> polylines;

  const _MapView({
    required this.initialLocation,
    required this.markers,
    required this.polylines,
  });

  @override
  Widget build(BuildContext context) {
    final CameraPosition initialCamaraPosition = CameraPosition(target: initialLocation, zoom: 15);

    return GoogleMap(
      initialCameraPosition: initialCamaraPosition,
      mapToolbarEnabled: false,
      compassEnabled: false,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      polylines: polylines,
      markers: markers,
      onMapCreated: (controller) => context.read<MapProvider>().mapController = controller,
    );
  }
}