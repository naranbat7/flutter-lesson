import 'package:flutter/material.dart';

enum ActionType {
  like,
  love,
  care,
  haha,
  wow,
  sad,
  angry;

  String get assetPath {
    switch (this) {
      case ActionType.like:
        return "assets/action/like.png";
      case ActionType.love:
        return "assets/action/love.png";
      case ActionType.care:
        return "assets/action/care.png";
      case ActionType.haha:
        return "assets/action/haha.png";
      case ActionType.wow:
        return "assets/action/wow.png";
      case ActionType.sad:
        return "assets/action/sad.png";
      case ActionType.angry:
        return "assets/action/angry.png";
    }
  }

  static ActionType strToActionType(String val) {
    switch (val) {
      case "like":
        return ActionType.like;
      case "love":
        return ActionType.love;
      case "care":
        return ActionType.care;
      case "haha":
        return ActionType.haha;
      case "wow":
        return ActionType.wow;
      case "sad":
        return ActionType.sad;
      case "angry":
        return ActionType.angry;
      default:
        return ActionType.like;
    }
  }

  String get label {
    switch (this) {
      case ActionType.like:
        return "Like";
      case ActionType.love:
        return "Love";
      case ActionType.care:
        return "Care";
      case ActionType.haha:
        return "Haha";
      case ActionType.wow:
        return "Wow";
      case ActionType.sad:
        return "Sad";
      case ActionType.angry:
        return "Angry";
    }
  }
}

class ActionWidget extends StatelessWidget {
  final ActionType type;
  final double size;

  const ActionWidget({super.key, this.type = ActionType.like, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      type.assetPath,
      height: size,
      width: size,
      fit: BoxFit.cover,
    );
  }
}
