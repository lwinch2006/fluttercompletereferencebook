import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'date_plugin_linux_platform_interface.dart';

/// An implementation of [DatePluginLinuxPlatform] that uses method channels.
class MethodChannelDatePluginLinux extends DatePluginLinuxPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('date_plugin_linux');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
