import Cocoa
import FlutterMacOS

public class DatePluginMacosPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "plugins.example.com/date_plugin", binaryMessenger: registrar.messenger)
    let instance = DatePluginMacosPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getDate":
      let formatter = DateFormatter()
      formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
      result(formatter.string(from: Date()))
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
