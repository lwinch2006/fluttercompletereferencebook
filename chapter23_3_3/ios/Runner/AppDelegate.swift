import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    private class NativeDateImplementation: NativeDateAPI {
      func getDate(completion: @escaping (Result<String, Error>) -> Void) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        completion(.success(formatter.string(from: Date())))
      }
    }

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let api = NativeDateImplementation()
    NativeDateAPISetup.setUp(binaryMessenger: controller.binaryMessenger, api: api)

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
