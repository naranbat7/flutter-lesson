import 'package:facebook/global_keys.dart';
import 'package:facebook/provider/loader.dart';
import 'package:provider/provider.dart';

class Utils {
  static String? validateEmpty(String? val) {
    if (val == null || val.isEmpty) return "Cannot be empty.";
    return null;
  }

  static void startLoader() {
    Provider.of<LoaderProvider>(GlobalKeys.navigatorKey.currentContext!, listen: false).startLoading();
  }

  static void cancelLoader() {
    Provider.of<LoaderProvider>(GlobalKeys.navigatorKey.currentContext!, listen: false).cancelLoading();
  }

  static String thousandify(int val) {
    if (val < 1000) return "$val";
    if (val < 1000000) return "${(val / 1000).toStringAsFixed(1)}K";
    return "${(val / 1000000).toStringAsFixed(1)}M";
  }
}
