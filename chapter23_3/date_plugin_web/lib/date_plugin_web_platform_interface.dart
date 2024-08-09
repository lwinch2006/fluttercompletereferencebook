import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'date_plugin_web_method_channel.dart';

abstract class DatePluginWebPlatform extends PlatformInterface {
  /// Constructs a DatePluginWebPlatform.
  DatePluginWebPlatform() : super(token: _token);

  static final Object _token = Object();

  static DatePluginWebPlatform _instance = MethodChannelDatePluginWeb();

  /// The default instance of [DatePluginWebPlatform] to use.
  ///
  /// Defaults to [MethodChannelDatePluginWeb].
  static DatePluginWebPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DatePluginWebPlatform] when
  /// they register themselves.
  static set instance(DatePluginWebPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
