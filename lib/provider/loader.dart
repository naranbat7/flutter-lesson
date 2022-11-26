import 'package:facebook/global_keys.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoaderProvider extends ChangeNotifier {
  bool _isLoading = false;

  void startLoading() {
    if (!_isLoading) {
      _isLoading = true;
      showDialog(
        context: GlobalKeys.navigatorKey.currentContext!,
        builder: ((context) => Container(
              color: Colors.black.withOpacity(0.1),
              child: Center(
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(),
                ),
              ),
            )),
      );
    }
  }

  void cancelLoading() {
    if (_isLoading) {
      _isLoading = false;
      Navigator.pop(GlobalKeys.navigatorKey.currentContext!);
    }
  }

  static LoaderProvider get instance => Provider.of<LoaderProvider>(GlobalKeys.navigatorKey.currentContext!, listen: false);
}
