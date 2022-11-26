import 'package:facebook/models/interact/index.dart';
import 'package:facebook/models/user/index.dart';

import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class NewsfeedModel {
  int id;
  UserModel user;
  String postDate, postType, contentDescription;
  String? contentImage;
  InteractModel interact;

  NewsfeedModel({
    required this.id,
    required this.user,
    required this.postDate,
    required this.postType,
    required this.contentDescription,
    this.contentImage,
    required this.interact,
  });

  static List<NewsfeedModel> fromList(List<dynamic> data) => data.map((e) => NewsfeedModel.fromJson(e)).toList();

  factory NewsfeedModel.fromJson(Map<String, dynamic> json) => _$NewsfeedModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsfeedModelToJson(this);
}
