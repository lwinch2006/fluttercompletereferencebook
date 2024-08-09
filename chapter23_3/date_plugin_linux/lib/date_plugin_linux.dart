
import 'date_plugin_linux_platform_interface.dart';

class DatePluginLinux {
  Future<String?> getPlatformVersion() {
    return DatePluginLinuxPlatform.instance.getPlatformVersion();
  }
}
