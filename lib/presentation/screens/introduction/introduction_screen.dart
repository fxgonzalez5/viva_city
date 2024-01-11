import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/widgets/line_divider.dart';

class IntroductionScreen extends StatelessWidget {
  static const String name = 'introduction_screen';

  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
      alignment: Alignment.center,
      children: [
        _Background(),
        _Foreground(),
      ],
    ),
  );  
  }
}

class _Foreground extends StatelessWidget {
  const _Foreground();

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    final slidingProvider = context.read<SlidingProvider>();

    return Column( 
      children: [
        SizedBox(height: responsive.hp(37)),
        Text(
          'Vive la cultura en',
          style: TextStyle(fontSize: responsive.ip(3.2), color: Colors.white),
        ),
        Text(
          'LOJA',
          style: TextStyle(fontSize: responsive.ip(5.2), color: Colors.white, height: responsive.hp(0.08)),
        ),
        SizedBox(height: responsive.hp(5)),
        Text(
          'Hoy es un día para disfrutar',
          style: TextStyle(fontSize: responsive.ip(2.2), color: Colors.white),
        ),
        LineDivider(width: responsive.wp(75)),
        SizedBox(height: responsive.hp(5.5)),
        Icon(Icons.explore_outlined, color: Colors.white, size: responsive.ip(4)),
        SizedBox(height: responsive.hp(1.5)),
        Text(
          '¿Qué tengo cerca?',
          style: TextStyle(fontSize: responsive.ip(2), color: Colors.white),
        ),
        SizedBox(height: responsive.hp(8.5)),
        IconButton(
          icon: const Icon(Icons.expand_less),
          iconSize: responsive.ip(8),
          color: colors.secondary,
          onPressed: () => slidingProvider.currentPage = 1,
        )
      ],
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset("assets/images/introduction.png", fit: BoxFit.cover),
        ),
        Container(color: Colors.black54),
      ],
    );
  }
}