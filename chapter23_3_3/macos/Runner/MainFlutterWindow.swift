import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  private class NativeDateImplementation: NativeDateAPI {
    func getDate(completion: @escaping (Result<String, Error>) -> Void) {
      let formatter = DateFormatter()
      formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
      completion(.success(formatter.string(from: Date())))
    }
  }

  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    let registrar = flutterViewController.registrar(forPlugin: "DateAndTime")
    let api = NativeDateImplementation()
    NativeDateAPISetup.setUp(binaryMessenger: registrar.messenger, api: api)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
