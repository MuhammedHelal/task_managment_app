// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteResponse _$QuoteResponseFromJson(Map<String, dynamic> json) =>
    QuoteResponse(
      quoteDate: json['qotd_date'] as String?,
      quoteEntity: QuoteEntity.fromJson(json['quote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuoteResponseToJson(QuoteResponse instance) =>
    <String, dynamic>{
      'qotd_date': instance.quoteDate,
      'quote': instance.quoteEntity,
    };

QuoteEntity _$QuoteEntityFromJson(Map<String, dynamic> json) => QuoteEntity(
      body: json['body'] as String,
      author: json['author'] as String,
      favoritesCount: (json['favorites_count'] as num).toInt(),
      upvotesCount: (json['upvotes_count'] as num).toInt(),
      downvotesCount: (json['downvotes_count'] as num).toInt(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$QuoteEntityToJson(QuoteEntity instance) =>
    <String, dynamic>{
      'body': instance.body,
      'author': instance.author,
      'favorites_count': instance.favoritesCount,
      'upvotes_count': instance.upvotesCount,
      'downvotes_count': instance.downvotesCount,
      'tags': instance.tags,
    };
