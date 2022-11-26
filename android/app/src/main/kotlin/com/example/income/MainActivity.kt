package com.example.income

import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterFragmentActivity() {
    private val CHANNEL = "mn.naranbat.income"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "getMyData") {
                val res = getMyData()

                result.success(res)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getMyData(): String {
        return "Android kotlin хэлнээс мэндчилж байна."
    }
}
