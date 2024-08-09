import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'date_plugin_linux_method_channel.dart';

abstract class DatePluginLinuxPlatform extends PlatformInterface {
  /// Constructs a DatePluginLinuxPlatform.
  DatePluginLinuxPlatform() : super(token: _token);

  static final Object _token = Object();

  static DatePluginLinuxPlatform _instance = MethodChannelDatePluginLinux();

  /// The default instance of [DatePluginLinuxPlatform] to use.
  ///
  /// Defaults to [MethodChannelDatePluginLinux].
  static DatePluginLinuxPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DatePluginLinuxPlatform] when
  /// they register themselves.
  static set instance(DatePluginLinuxPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
