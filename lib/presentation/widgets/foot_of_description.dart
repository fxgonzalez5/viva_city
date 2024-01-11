
import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/widgets/shared/recommendation_list.dart';

class FootOfDescription extends StatelessWidget {
  const FootOfDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
      final responsive = Responsive(context);
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: responsive.wp(6), vertical: responsive.hp(1)) ,
          child: 
          Text('Lugares cerca', style: TextStyle(color: colors.primary, fontSize: responsive.ip(1.36)),
          )),
      const RecommendationList(items: [],)
      ],
    );
  }
}
