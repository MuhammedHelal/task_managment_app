import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/core/utils/colors.dart';
import 'package:planning_app/features/quote/data/models/quote_entity.dart';

class QuoteFeedback extends StatelessWidget {
  const QuoteFeedback({super.key, required this.quoteEntity});
  final QuoteEntity quoteEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Icon(
              Icons.favorite,
              color: AppColors.green.withOpacity(0.4),
            ),
            Text(quoteEntity.favoritesCount.toString()),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Icon(
              Icons.thumb_up,
              color: AppColors.green.withOpacity(0.4),
            ),
            Text(quoteEntity.upvotesCount.toString()),
          ],
        ),
        const Gap(10),
        Row(
          children: [
            Icon(
              Icons.thumb_down,
              color: AppColors.green.withOpacity(0.4),
            ),
            Text(quoteEntity.downvotesCount.toString()),
          ],
        ),
      ],
    );
  }
}
