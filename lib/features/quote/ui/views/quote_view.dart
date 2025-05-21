import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/features/quote/data/models/quote_entity.dart';
import 'package:planning_app/features/quote/logic/cubit/quote_cubit.dart';
import 'package:planning_app/features/quote/logic/cubit/quote_state.dart';
import 'package:planning_app/features/quote/ui/widgets/quote_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class QuoteView extends StatelessWidget {
  const QuoteView({super.key});

  @override
  Widget build(BuildContext context) {
    final dummyQuoteEntity = QuoteEntity(
      body:
          "Success usually comes to those who are too busy to be looking for it.",
      author: "Henry David Thoreau",
      favoritesCount: 5,
      upvotesCount: 5,
      downvotesCount: 5,
      tags: ['Henry', 'Thoreau'],
    );
    return BlocBuilder<QuoteCubit, QuoteState>(
      builder: (context, state) {
        if (state is Success) {
          final QuoteEntity quoteEntity = state.data;

          return QuoteCard(quoteEntity: quoteEntity);
        } else {
          return Skeletonizer(
            enabled: state is Loading,
            child: QuoteCard(
              quoteEntity: dummyQuoteEntity,
            ),
          );
        }
      },
    );
  }
}
