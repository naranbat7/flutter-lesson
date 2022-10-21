import 'package:flutter/material.dart';
import 'package:movie/providers/common.dart';
import 'package:movie/screens/login.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(builder: ((context, provider, child) {
      return provider.isLoggedIn
          ? Center(
              child: ElevatedButton(
                onPressed: provider.onLogout,
                child: Text("Гарах"),
              ),
            )
          : LoginPage();
    }));
  }
}
