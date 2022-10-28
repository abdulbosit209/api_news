import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable(explicitToJson: true)
class Source {

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: "", name: "id")
  String id;

  Source({
    required this.name,
    required this.id,
  });

  factory Source.fromJson(Map<String, dynamic> json) =>
      _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
