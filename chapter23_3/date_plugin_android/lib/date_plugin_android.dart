import 'package:date_plugin_platform_interface/date_plugin_platform_interface.dart';
import 'package:flutter/services.dart';

const _channel = MethodChannel('plugins.example.com/date_plugin');

class DatePluginAndroid extends DatePluginPlatform {
  static void registerWith() {
    DatePluginPlatform.instance = DatePluginAndroid();
  }

  @override
  Future<String> getDate() => _channel.invokeMethod<String>('getDate').then((value) => value ?? 'Can not get the date');
}


