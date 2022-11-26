import 'package:facebook/models/notification/index.dart';
import 'package:facebook/models/story/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../global_keys.dart';
import '../models/newsfeed/index.dart';

class CommonProvider extends ChangeNotifier {
  String? userProfile;
  List<StoryModel> storyList = [];
  List<NewsfeedModel> newsfeedList = [];
  List<NotificationModel> notificationList = [];
  List<int> readNotifications = [];
  int bottomBarIndex = 3;
  int newsFeedPage = 1;
  ThemeMode themeMode = ThemeMode.light;

  CommonProvider() {
    getUserProfile();
  }

  void toggleThemeMode() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  bool isRead(int id) {
    return readNotifications.any((element) => element == id);
  }

  void setRead(int id) {
    readNotifications.add(id);
    notifyListeners();
  }

  void setNotification(List<NotificationModel> data) {
    notificationList = data;
    notifyListeners();
  }

  bool get isLogged => userProfile != null;

  void setUserProfile(String value) async {
    userProfile = value;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("userProfile", value);
    notifyListeners();
  }

  void getUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    userProfile = prefs.getString("userProfile");
    if (userProfile != null) notifyListeners();
  }

  void changeBottomBarIndex(int value) {
    bottomBarIndex = value;
    notifyListeners();
  }

  void addStory(List<StoryModel> value) {
    storyList.addAll(value);
    notifyListeners();
  }

  void setNewsfeedClear() {
    newsfeedList.clear();
    notifyListeners();
  }

  void setNewsfeed(List<NewsfeedModel> value) {
    newsfeedList.clear();
    newsfeedList.addAll(value);
    newsFeedPage = 1;
    notifyListeners();
  }

  void addNewsfeed(List<NewsfeedModel> value, int page) {
    newsfeedList.addAll(value);
    newsFeedPage = page;
    notifyListeners();
  }

  static CommonProvider get instance => Provider.of<CommonProvider>(GlobalKeys.navigatorKey.currentContext!, listen: false);
}
