import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'testtesttest_method_channel.dart';

abstract class TesttesttestPlatform extends PlatformInterface {
  /// Constructs a TesttesttestPlatform.
  TesttesttestPlatform() : super(token: _token);

  static final Object _token = Object();

  static TesttesttestPlatform _instance = MethodChannelTesttesttest();

  /// The default instance of [TesttesttestPlatform] to use.
  ///
  /// Defaults to [MethodChannelTesttesttest].
  static TesttesttestPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TesttesttestPlatform] when
  /// they register themselves.
  static set instance(TesttesttestPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
