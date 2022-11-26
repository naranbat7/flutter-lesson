import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class StoryModel {
  int id;
  String coverImg, name, circleImg;

  StoryModel({
    required this.id,
    required this.name,
    required this.circleImg,
    required this.coverImg,
  });

  static List<StoryModel> fromList(List<dynamic> data) => data.map((e) => StoryModel.fromJson(e)).toList();

  factory StoryModel.fromJson(Map<String, dynamic> json) => _$StoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoryModelToJson(this);
}
