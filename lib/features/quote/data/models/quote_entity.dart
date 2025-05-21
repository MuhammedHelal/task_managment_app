import 'package:json_annotation/json_annotation.dart';

part 'quote_entity.g.dart';

@JsonSerializable()
class QuoteResponse {
  @JsonKey(name: 'qotd_date')
  final String? quoteDate;
  @JsonKey(name: 'quote')
  final QuoteEntity quoteEntity;

  factory QuoteResponse.fromJson(Map<String, dynamic> json) =>
      _$QuoteResponseFromJson(json);

  QuoteResponse({required this.quoteDate, required this.quoteEntity});
}

@JsonSerializable()
class QuoteEntity {
  final String body;
  final String author;
  @JsonKey(name: 'favorites_count')
  final int favoritesCount;
  @JsonKey(name: 'upvotes_count')
  final int upvotesCount;
  @JsonKey(name: 'downvotes_count')
  final int downvotesCount;
  final List<String> tags;

  QuoteEntity({
    required this.body,
    required this.author,
    required this.favoritesCount,
    required this.upvotesCount,
    required this.downvotesCount,
    required this.tags,
  });
  factory QuoteEntity.fromJson(Map<String, dynamic> json) =>
      _$QuoteEntityFromJson(json);
}
