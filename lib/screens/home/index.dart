import 'package:facebook/screens/home/newsfeed.dart';
import 'package:facebook/screens/home/notification.dart';
import 'package:facebook/screens/home/settings.dart';
import 'package:facebook/screens/home/shop.dart';
import 'package:facebook/screens/home/watch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../provider/common.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  onPress() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("userProfile");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(
      builder: ((context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Image.asset("assets/cover.png", height: 50),
            centerTitle: false,
            actions: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => provider.toggleThemeMode(),
                    icon: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        provider.themeMode == ThemeMode.light ? Icons.light_mode : Icons.dark_mode,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.search, color: Colors.black),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.chat, size: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: [
            NewsfeedPage(),
            WatchPage(),
            ShopPage(),
            NofiticationPage(),
            SettingsPage(),
          ][provider.bottomBarIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.bottomBarIndex,
            onTap: provider.changeBottomBarIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'Нүүр'),
              BottomNavigationBarItem(icon: Icon(Icons.video_camera_back_outlined), label: 'Бичлэг'),
              BottomNavigationBarItem(icon: Icon(Icons.storefront_outlined), label: 'Дэлгүүр'),
              BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Мэдэгдэл'),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Тохиргоо'),
            ],
          ),
        );
      }),
    );
  }
}
