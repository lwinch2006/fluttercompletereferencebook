import 'package:date_plugin_platform_interface/date_plugin_platform_interface.dart';

Future<String> getDate() => DatePluginPlatform.instance.getDate();