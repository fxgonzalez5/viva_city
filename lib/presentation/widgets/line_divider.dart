import 'package:flutter/material.dart';

class LineDivider extends StatelessWidget {
  final double? space;
  final double? height;
  final double? start;
  final double? end;


  const LineDivider({
    super.key,
    this.space,
    this.height,
    this.start,
    this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: space,
      thickness: height,
      indent: start,
      endIndent: end,
    );
  }
}
