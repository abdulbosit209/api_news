import 'package:api_with_cubit/data/models/articles/articles.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

@JsonSerializable()
class Status {

  @JsonKey(defaultValue: "", name: "ok")
  String ok;

  @JsonKey(defaultValue: 0, name: "totalResults")
  int totalResults;

  @JsonKey(defaultValue: [], name: "articles")
  List<Articles> articles;

  Status({
    required this.articles,
    required this.ok,
    required this.totalResults
  });

  factory Status.fromJson(Map<String, dynamic> json) =>
      _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
