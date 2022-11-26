import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class UserModel {
  String profileImg, lastName, firstName;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.profileImg,
  });

  static List<UserModel> fromList(List<dynamic> data) => data.map((e) => UserModel.fromJson(e)).toList();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
