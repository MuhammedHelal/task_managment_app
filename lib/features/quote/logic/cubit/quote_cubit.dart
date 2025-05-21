import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planning_app/features/quote/data/repos/quote_repo.dart';
import 'package:planning_app/features/quote/logic/cubit/quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  QuoteCubit(this._quoteRepo) : super(const QuoteState.initial());
  final QuoteRepo _quoteRepo;
  void emitQuoteOfTheDayStates() async {
    emit(const QuoteState.loading());
    final result = await _quoteRepo.getQuoteOfTheDay();
    result.when(
      success: (data) => emit(QuoteState.success(data)),
      failure: (error) => emit(QuoteState.error(error)),
    );
  }
}
