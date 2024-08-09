import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  let CHANNEL_DATETIME = "chapter23/datetime"

  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    let registrar = flutterViewController.registrar(forPlugin: "DateAndTime")
    let channelDateTime = FlutterMethodChannel.init(name: CHANNEL_DATETIME, binaryMessenger: registrar.messenger)

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

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
