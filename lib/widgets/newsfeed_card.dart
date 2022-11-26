import 'package:facebook/models/newsfeed/index.dart';
import 'package:facebook/widgets/emotion.dart';
import 'package:facebook/widgets/newsfeed_card_header.dart';
import 'package:facebook/widgets/newsfeed_interact_list.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'emotion_popup.dart';

class NewsfeedCard extends StatefulWidget {
  final NewsfeedModel data;

  const NewsfeedCard(this.data, {super.key});

  @override
  State<NewsfeedCard> createState() => _NewsfeedCardState();
}

class _NewsfeedCardState extends State<NewsfeedCard> {
  bool showPopup = false;
  ActionType? type;

  void _onPress() {
    setState(() {
      type = type != null ? null : ActionType.like;
    });
  }

  void _onLongPress() {
    setState(() {
      showPopup = true;
    });
  }

  void _onPressActionPopup(ActionType val) {
    setState(() {
      type = val;
      showPopup = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NewsfeedCardHeader(widget.data),
                    SizedBox(height: 10),
                    Text(
                      widget.data.contentDescription,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              if (widget.data.contentImage != null) Image.network(widget.data.contentImage!),
              NewsfeedInteractListWidget(widget.data.interact),
              Divider(height: 1),
              EmotionWidget(type, _onPress, _onLongPress),
            ],
          ),
        ),
        Visibility(
          visible: showPopup,
          child: Transform.translate(
            offset: Offset(0, -50),
            child: EmotionPopup(_onPressActionPopup),
          ),
        ),
      ],
    );
  }
}
