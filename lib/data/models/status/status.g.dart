// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) => Status(
      articles: (json['articles'] as List<dynamic>?)
              ?.map((e) => Articles.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      ok: json['ok'] as String? ?? '',
      totalResults: json['totalResults'] as int? ?? 0,
    );

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'ok': instance.ok,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
