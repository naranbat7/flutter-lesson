import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class NotificationModel {
  int id;
  @JsonKey(name: "cover_image")
  String coverImage;
  List<String> description;
  @JsonKey(name: "created_date")
  String createdDate;

  NotificationModel({
    required this.id,
    required this.coverImage,
    required this.createdDate,
    required this.description,
  });

  static List<NotificationModel> fromList(List<dynamic> data) => data.map((e) => NotificationModel.fromJson(e)).toList();

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
