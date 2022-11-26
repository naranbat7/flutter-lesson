import 'package:facebook/models/newsfeed/index.dart';
import 'package:flutter/material.dart';

class NewsfeedCardHeader extends StatelessWidget {
  final NewsfeedModel data;

  const NewsfeedCardHeader(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              child: ClipOval(
                child: Image.network(data.user.profileImg),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${data.user.firstName} ${data.user.lastName}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${data.postDate} •",
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(data.postType == "public" ? Icons.public : Icons.person, size: 16, color: Colors.black45),
                  ],
                ),
              ],
            ),
          ],
        ),
        Icon(Icons.more_horiz),
      ],
    );
  }
}
