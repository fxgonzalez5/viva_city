import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';

class LineDivider extends StatelessWidget {
  final Color? color;
  final double? space;
  final double? width;
  final double? height;
  final double? start;
  final double? end;


  const LineDivider({
    super.key,
    this.color,
    this.space,
    this.width,
    this.height,
    this.start,
    this.end,
  }) : assert(width == null || (start == null && end == null), "don't send width along with start and end");

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Divider(
      color: color,
      height: space,
      thickness: height,
      indent: start ?? (responsive.wp(100) - (width ?? responsive.wp(100))),
      endIndent: end ?? (responsive.wp(100) - (width ?? responsive.wp(100))),
    );
  }
}
