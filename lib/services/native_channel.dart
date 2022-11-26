import 'package:flutter/services.dart';

class NativeChannelService {
  static Future<String?> getNativeCodeResult() async {
    MethodChannel channel = MethodChannel('mn.naranbat.income');
    String result = await channel.invokeMethod('getMyData');
    return result;
  }
}
