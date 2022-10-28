// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Articles _$ArticlesFromJson(Map<String, dynamic> json) => Articles(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      author: json['author'] as String? ?? '',
      url: json['url'] as String? ?? '',
      content: json['content'] as String? ?? '',
      publishedAt: json['publishedAt'] as String? ?? '',
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      urlToImage: json['urlToImage'] as String? ?? '',
    );

Map<String, dynamic> _$ArticlesToJson(Articles instance) => <String, dynamic>{
      'source': instance.source.toJson(),
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
