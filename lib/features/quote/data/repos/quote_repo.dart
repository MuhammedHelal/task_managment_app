import 'package:planning_app/core/networking/api_error_handler.dart';
import 'package:planning_app/core/networking/api_result.dart';
import 'package:planning_app/core/networking/api_service.dart';
import 'package:planning_app/features/quote/data/models/quote_entity.dart';

class QuoteRepo {
  final ApiService _apiService;

  QuoteRepo(this._apiService);
  Future<ApiResult<QuoteEntity>> getQuoteOfTheDay() async {
    try {
      print('QuoteRepo getQuoteOfTheDay: Trying to get quote of the day');
      final response = await _apiService.getQuoteOfTheDay();
      print('QuoteRepo getQuoteOfTheDay: Successfully got quote of the day');
      return ApiResult.success(response.quoteEntity);
    } catch (e) {
      print('QuoteRepo getQuoteOfTheDay: Failed to get quote of the day');
      print('Error: $e');
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
