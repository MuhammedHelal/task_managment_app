import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:planning_app/core/utils/colors.dart';
import 'package:planning_app/core/utils/text_styles_old.dart';
import 'package:planning_app/features/quote/data/models/quote_entity.dart';
import 'package:planning_app/features/quote/ui/widgets/quote_feedback.dart';
import 'package:planning_app/features/quote/ui/widgets/quote_tags.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    super.key,
    required this.quoteEntity,
  });

  final QuoteEntity quoteEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: MyColors.purple.withOpacity(0.15),
        //     blurRadius: 5,
        //     blurStyle: BlurStyle.normal,
        //   ),
        //   BoxShadow(
        //     color: MyColors.purple.withOpacity(0.15),
        //     blurRadius: 25,
        //     blurStyle: BlurStyle.outer,
        //   ),
        // ],
        borderRadius: BorderRadius.circular(16),
        color: AppColors.green.withOpacity(0.2),
      ),
      alignment: Alignment.center,
      // height: height * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Quote of the day',
            style: AppTextStyles.black25Bold,
          ),
          const Gap(10),
          Text(quoteEntity.body),
          const Gap(20),
          Text('- ${quoteEntity.author}'),
          const Gap(10),
          Column(
            children: [
              QuoteTags(quoteEntity: quoteEntity),
              const Gap(10),
              QuoteFeedback(quoteEntity: quoteEntity)
            ],
          )
        ],
      ),
    );
  }
}
