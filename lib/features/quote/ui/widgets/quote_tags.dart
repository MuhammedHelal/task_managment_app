import 'package:flutter/material.dart';
import 'package:planning_app/core/utils/colors.dart';
import 'package:planning_app/features/quote/data/models/quote_entity.dart';

class QuoteTags extends StatelessWidget {
  const QuoteTags({
    super.key,
    required this.quoteEntity,
  });

  final QuoteEntity quoteEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: quoteEntity.tags
          .map(
            (e) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.green.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text(e)),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
