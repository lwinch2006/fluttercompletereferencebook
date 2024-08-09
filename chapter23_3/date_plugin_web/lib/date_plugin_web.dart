
import 'date_plugin_web_platform_interface.dart';

class DatePluginWeb {
  Future<String?> getPlatformVersion() {
    return DatePluginWebPlatform.instance.getPlatformVersion();
  }
}
