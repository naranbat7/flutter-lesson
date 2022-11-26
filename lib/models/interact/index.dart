import 'package:facebook/models/key-value.dart';
import 'package:facebook/widgets/action.dart';

import 'package:json_annotation/json_annotation.dart';

part 'index.g.dart';

@JsonSerializable()
class InteractModel {
  int like, love, haha, care, wow, angry, sad, comments, shares;
  List<String>? friends;

  InteractModel({
    required this.like,
    this.friends,
    required this.angry,
    required this.care,
    required this.comments,
    required this.haha,
    required this.love,
    required this.sad,
    required this.shares,
    required this.wow,
  });

  int get sumOfInteract => like + love + haha + care + wow + angry + sad;

  List<ActionType> get mostHighActionTypes {
    final List<KeyValueModel> jsonList = [
      KeyValueModel("like", like),
      KeyValueModel("love", love),
      KeyValueModel("haha", haha),
      KeyValueModel("care", care),
      KeyValueModel("wow", wow),
      KeyValueModel("angry", angry),
      KeyValueModel("sad", sad),
    ];
    jsonList.sort((a, b) => b.value - a.value);
    return jsonList.sublist(0, 2).map((e) => ActionType.strToActionType(e.key)).toList();
  }

  static List<InteractModel> fromList(List<dynamic> data) => data.map((e) => InteractModel.fromJson(e)).toList();

  factory InteractModel.fromJson(Map<String, dynamic> json) => _$InteractModelFromJson(json);
  Map<String, dynamic> toJson() => _$InteractModelToJson(this);
}
