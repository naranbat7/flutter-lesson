import 'package:facebook/bloc/common/bloc.dart';
import 'package:facebook/bloc/common/events.dart';
import 'package:facebook/models/notification/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/common.dart';

class NofiticationPage extends StatefulWidget {
  const NofiticationPage({super.key});

  @override
  State<NofiticationPage> createState() => _NofiticationPageState();
}

class _NofiticationPageState extends State<NofiticationPage> {
  final _bloc = CommonBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(CommonNotificationGet());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(
      builder: ((context, provider, child) {
        return ListView.builder(
          itemCount: provider.notificationList.length,
          itemBuilder: ((context, index) {
            return _buildTile(provider, provider.notificationList[index]);
          }),
        );
      }),
    );
  }

  Widget _buildTile(CommonProvider provider, NotificationModel item) {
    return ListTile(
      onTap: () => provider.setRead(item.id),
      title: Text(
        item.description.join(' '),
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 20 / 14,
        ),
      ),
      subtitle: Text(
        item.createdDate,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      leading: Image.network(item.coverImage),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_horiz),
      ),
      tileColor: provider.isRead(item.id) ? Colors.grey[100] : Colors.blue.withOpacity(0.15),
    );
  }
}
