import 'package:facebook/widgets/action.dart';
import 'package:flutter/material.dart';

class EmotionWidget extends StatelessWidget {
  final ActionType? type;
  final VoidCallback widgetOnPress, widgetOnLongPress;

  const EmotionWidget(this.type, this.widgetOnPress, this.widgetOnLongPress, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            type == null ? _itemBuilder(Icons.waving_hand, "Like", widgetOnPress, widgetOnLongPress) : _itemActionBuilder,
            _itemBuilder(Icons.comment, "Comment"),
            _itemBuilder(Icons.share, "Share"),
          ],
        ),
      ],
    );
  }

  Widget _itemBuilder(IconData icon, String text, [VoidCallback? onPress, VoidCallback? onPressLong]) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        onLongPress: onPressLong,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.grey[500], size: 20),
              SizedBox(width: 5),
              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _itemActionBuilder {
    return Expanded(
      child: InkWell(
        onTap: widgetOnPress,
        onLongPress: widgetOnLongPress,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActionWidget(type: type ?? ActionType.like),
              SizedBox(width: 5),
              Text(
                type?.label ?? 'Like',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
