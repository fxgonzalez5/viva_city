import 'package:flutter/material.dart';

class Dots extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;
  final double activeSize;
  final double inactiveSize;
  final double height;

  const Dots({
    super.key, 
    required this.itemCount,
    this.currentIndex = 0,
    this.activeColor = Colors.deepPurple,
    this.inactiveColor = Colors.grey,
    this.activeSize = 12,
    this.inactiveSize = 12,
    this.height = 50
  });

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(itemCount, (index) => _Dot(
          index,
          currentIndex,
          activeColor,
          inactiveColor,
          activeSize,
          inactiveSize
        ))
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int currentIndex;
  final int activeDot;
  final Color activeColor;
  final Color inactiveColor;
  final double primaryBullet;
  final double secondaryBullet;

  const _Dot(
    this.currentIndex,
    this.activeDot,
    this.activeColor,
    this.inactiveColor,
    this.primaryBullet,
    this.secondaryBullet,
  );

  @override
  Widget build(BuildContext context) {
    double size;
    Color color;
    
    if(currentIndex == activeDot) {
      size = primaryBullet;
      color = activeColor;
    } else {
      size = secondaryBullet;
      color = inactiveColor;
    }

    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}