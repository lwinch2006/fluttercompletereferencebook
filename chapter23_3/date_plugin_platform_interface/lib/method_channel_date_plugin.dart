import 'package:date_plugin_platform_interface/date_plugin_platform_interface.dart';
import 'package:flutter/services.dart';

const _channel = MethodChannel('plugins.example.com/date_plugin');
const _error = 'Can not get a date';

class MethodChannelDatePlugin extends DatePluginPlatform {
  @override
  Future<String> getDate() =>
      _channel.invokeMethod<String>('getDate').then((value) => value ?? _error);
}
