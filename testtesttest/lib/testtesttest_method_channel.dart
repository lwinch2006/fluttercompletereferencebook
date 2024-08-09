import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'testtesttest_platform_interface.dart';

/// An implementation of [TesttesttestPlatform] that uses method channels.
class MethodChannelTesttesttest extends TesttesttestPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('testtesttest');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
