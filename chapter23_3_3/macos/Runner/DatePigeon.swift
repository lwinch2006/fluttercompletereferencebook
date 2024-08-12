// Autogenerated from Pigeon (v21.1.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

/// Error class for passing custom error details to Dart side.
final class PigeonError: Error {
  let code: String
  let message: String?
  let details: Any?

  init(code: String, message: String?, details: Any?) {
    self.code = code
    self.message = message
    self.details = details
  }

  var localizedDescription: String {
    return
      "PigeonError(code: \(code), message: \(message ?? "<nil>"), details: \(details ?? "<nil>")"
      }
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let pigeonError = error as? PigeonError {
    return [
      pigeonError.code,
      pigeonError.message,
      pigeonError.details,
    ]
  }
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}
private class DatePigeonPigeonCodecReader: FlutterStandardReader {
}

private class DatePigeonPigeonCodecWriter: FlutterStandardWriter {
}

private class DatePigeonPigeonCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return DatePigeonPigeonCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return DatePigeonPigeonCodecWriter(data: data)
  }
}

class DatePigeonPigeonCodec: FlutterStandardMessageCodec, @unchecked Sendable {
  static let shared = DatePigeonPigeonCodec(readerWriter: DatePigeonPigeonCodecReaderWriter())
}


/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol NativeDateAPI {
  func getDate(completion: @escaping (Result<String, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class NativeDateAPISetup {
  static var codec: FlutterStandardMessageCodec { DatePigeonPigeonCodec.shared }
  /// Sets up an instance of `NativeDateAPI` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: NativeDateAPI?, messageChannelSuffix: String = "") {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    let getDateChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.chapter23_3_3.NativeDateAPI.getDate\(channelSuffix)", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getDateChannel.setMessageHandler { _, reply in
        api.getDate { result in
          switch result {
          case .success(let res):
            reply(wrapResult(res))
          case .failure(let error):
            reply(wrapError(error))
          }
        }
      }
    } else {
      getDateChannel.setMessageHandler(nil)
    }
  }
}
