import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'date_plugin_web_platform_interface.dart';

/// An implementation of [DatePluginWebPlatform] that uses method channels.
class MethodChannelDatePluginWeb extends DatePluginWebPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('date_plugin_web');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
