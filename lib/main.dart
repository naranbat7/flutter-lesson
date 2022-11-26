import 'package:flutter/material.dart';
import 'package:income/global_keys.dart';
import 'package:income/providers/index.dart';
import 'package:income/services/native_channel.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DatabaseProvider()),
      ],
      child: MaterialApp(
        title: 'Миний орлого',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          textTheme: TextTheme(
            headline3: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 45.0,
              color: Colors.orange,
            ),
            button: TextStyle(
              fontFamily: 'OpenSans',
            ),
            subtitle1: TextStyle(fontFamily: 'NotoSans'),
            bodyText2: TextStyle(fontFamily: 'NotoSans'),
          ),
        ),
        navigatorKey: GlobalKeys.navigatorKey,
        home: Scaffold(
          body: FutureBuilder(
            future: NativeChannelService.getNativeCodeResult(),
            builder: (context, snapshot) {
              return Center(
                child: Text(
                  snapshot.data ?? "Хоосон",
                  style: TextStyle(color: Colors.amberAccent),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
