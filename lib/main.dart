import 'package:facebook/global_keys.dart';
import 'package:facebook/provider/common.dart';
import 'package:facebook/provider/loader.dart';
import 'package:facebook/routes/index.dart';
import 'package:facebook/screens/home/index.dart';
import 'package:facebook/screens/login.dart';
import 'package:facebook/themes/dark.dart';
import 'package:facebook/themes/light.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? image;

  @override
  void initState() {
    super.initState();
    initLocalStorage();
  }

  void initLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      image = prefs.getString("userProfile");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoaderProvider()),
        ChangeNotifierProvider(create: (_) => CommonProvider()),
      ],
      child: Consumer<CommonProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'Facebook',
            routes: routes,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: provider.themeMode,
            navigatorKey: GlobalKeys.navigatorKey,
            home: image != null ? HomePage() : LoginPage(),
          );
        },
      ),
    );
  }
}
