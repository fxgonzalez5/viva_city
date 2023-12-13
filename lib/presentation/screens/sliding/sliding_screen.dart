import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:viva_city/presentation/providers/providers.dart';
import 'package:viva_city/presentation/screens/screens.dart';


class SlidingScreen extends StatelessWidget {
  static const String name = 'sliding_screen';

  const SlidingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final slidingProvider = context.watch<SlidingProvider>();

    return PageView(
      physics: slidingProvider.hasSlid ? const NeverScrollableScrollPhysics() : null,
      scrollDirection: Axis.vertical,
      controller: slidingProvider.pageController,
      onPageChanged: (int page) => slidingProvider.currentPage = page,
      children: const [
        PresentationScreen(),
        NavegationScreen()
      ],
    );
  }
}