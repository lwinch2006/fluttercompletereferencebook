library date_plugin_platform_interface;

import 'package:date_plugin_platform_interface/method_channel_date_plugin.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class DatePluginPlatform extends PlatformInterface {
  static final Object _token = Object();
  static DatePluginPlatform _instance = MethodChannelDatePlugin();

  DatePluginPlatform() : super(token: _token);


  static DatePluginPlatform get instance => _instance;
  static set instance(DatePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String> getDate();
}