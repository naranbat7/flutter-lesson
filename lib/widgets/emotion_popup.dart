import 'package:facebook/widgets/action.dart';
import 'package:flutter/material.dart';

class EmotionPopup extends StatelessWidget {
  final void Function(ActionType) onPress;

  const EmotionPopup(this.onPress, {super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    return Container(
      width: width,
      // margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: ActionType.values
            .map((e) => InkWell(
                onTap: () => onPress(e),
                child: ActionWidget(
                  type: e,
                  size: width / ActionType.values.length - 20,
                )))
            .toList(),
      ),
    );
  }
}
