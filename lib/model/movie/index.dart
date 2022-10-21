import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class MovieModel {
  int id;
  String title, imgUrl;
  int? publishedYear, durationMin;
  String? type, description;

  MovieModel({
    required this.id,
    required this.title,
    required this.imgUrl,
    this.description,
    this.durationMin,
    this.publishedYear,
    this.type,
  });

  static List<MovieModel> fromList(List<dynamic> data) => data.map((e) => MovieModel.fromJson(e)).toList();

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
