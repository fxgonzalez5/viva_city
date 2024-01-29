import 'package:flutter/material.dart';
import 'package:viva_city/config/theme/custom_icons.dart';
import 'package:viva_city/config/theme/responsive.dart';
import 'package:viva_city/presentation/widgets/widgets.dart';

class SubcategoryHeader extends StatelessWidget {
  final String title;
  final List<String>? items;
  final bool hasRating;
  final double score;
  
  const SubcategoryHeader({
    super.key,
    required this.title,
    this.items,
    this.hasRating = true,
    this.score = 0,
  }) : assert(hasRating ? score >= 0 : items != null);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final texts = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: responsive.hp(3), horizontal: responsive.wp(7)),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          Row(
            children: [
              Expanded(child: Text(title, style: texts.headlineSmall)),
              IconButton(
                highlightColor: Colors.grey[200],
                icon: Icon(CustomIcons.share, color: colors.secondary, size: responsive.ip(2),),
                onPressed: () {
                  // TODO: Compartir el objeto
                }
              )
            ],
          ),
          SizedBox(height: responsive.hp(1.5)),
          if (hasRating)
            CustomRatingBar(rating: score)
          else
            Wrap(
              runSpacing: responsive.hp(0.5),
              children: List.generate(items!.length, (index) => CustomLabel(text: items![index])),
            ),
        ]),
      ),
    );
  }
}