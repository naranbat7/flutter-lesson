import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let channel = FlutterMethodChannel(name: "mn.naranbat.income", binaryMessenger: controller.binaryMessenger)
      
      channel.setMethodCallHandler({
          [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
          guard call.method == "getMyData" else {
            result(FlutterMethodNotImplemented)
            return
          }
          self?.getMyData(result: result)
      })
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func getMyData(result: FlutterResult) {
    result("Ios Swift Nativa кодоос мэндчилж байна.")
  }
}
