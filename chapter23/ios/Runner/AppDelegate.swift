import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  let CHANNEL_DATETIME = "chapter23/datetime"

  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let channelDateTime = FlutterMethodChannel.init(name: CHANNEL_DATETIME, binaryMessenger: controller.binaryMessenger)
        channelDateTime.setMethodCallHandler({(call: FlutterMethodCall, result: FlutterResult) -> Void in
            switch call.method {
                case "getDateTime":
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
                    result(formatter.string(from: Date()))

                default:
                    result(FlutterMethodNotImplemented)
            }
        });

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
