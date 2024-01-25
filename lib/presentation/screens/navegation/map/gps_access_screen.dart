import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viva_city/presentation/providers/providers.dart';


class GpsAccessScreen extends StatelessWidget {
  static const String name = 'gps_access_screen'; 

  const GpsAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mapProvider = context.watch<MapProvider>();

    return Scaffold(
      body: Center(
        child: !mapProvider.isGpsEnabled
          ? const _EnableGpsMessage()
          : const _AccessButton(),
      ),
    );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final texts = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Es necesario el acceso al GPS', style: texts.bodyLarge,),
        ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(colors.secondary)),
          onPressed: () {
            final mapProvider = context.read<MapProvider>();
            mapProvider.askGpsAccess();
          },
          child: const Text('Solicitar acceso')
        )
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage();

  @override
  Widget build(BuildContext context) {
    final texts = Theme.of(context).textTheme;

    return Text(
      'Debe de habilitar el GPS',
      style: texts.bodyLarge
    );
  }
}