import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
    let CHANNEL_DATETIME = "chapter23/datetime"

//    override func applicationDidFinishLaunching(_ notification: Notification) {
//        let controller : FlutterViewController = mainFlutterWindow?.contentViewController as! FlutterViewController
//        let channelDateTime = FlutterMethodChannel.init(name: CHANNEL_DATETIME, binaryMessenger: controller.engine.binaryMessenger)
//        channelDateTime.setMethodCallHandler({(call: FlutterMethodCall, result: FlutterResult) -> Void in
//            switch call.method {
//                case "getDateTime":
//                    let formatter = DateFormatter()
//                    formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
//                    result(formatter.string(from: Date()))
//
//                default:
//                    result(FlutterMethodNotImplemented)
//            }
//        });
//    }

  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }
}
