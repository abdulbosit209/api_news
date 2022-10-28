import 'package:api_with_cubit/data/models/articles/source.dart';
import 'package:json_annotation/json_annotation.dart';

part 'articles.g.dart';

@JsonSerializable(explicitToJson: true)
class Articles {

  @JsonKey(name: "source")
  Source source;

  @JsonKey(defaultValue: "", name: "title")
  String title;

  @JsonKey(defaultValue: "", name: "author")
  String author;

  @JsonKey(defaultValue: "", name: "description")
  String description;

  @JsonKey(defaultValue: "", name: "url")
  String url;

  @JsonKey(defaultValue: "", name: "urlToImage")
  String urlToImage;

  @JsonKey(defaultValue: "", name: "publishedAt")
  String publishedAt;

  @JsonKey(defaultValue: "", name: "content")
  String content;

  Articles({
    required this.title,
    required this.description,
    required this.author,
    required this.url,
    required this.content,
    required this.publishedAt,
    required this.source,
    required this.urlToImage
  });

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}
