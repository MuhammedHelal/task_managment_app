import 'package:dio/dio.dart';
import 'package:planning_app/core/networking/api_constants.dart';
import 'package:planning_app/features/quote/data/models/quote_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @GET(ApiConstants.quoteOfTheDayEndPoint)
  Future<QuoteResponse> getQuoteOfTheDay();
}
