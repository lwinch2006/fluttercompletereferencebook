#include "include/date_plugin_windows/date_plugin_windows_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "date_plugin_windows_plugin.h"

void DatePluginWindowsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  date_plugin_windows::DatePluginWindowsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
