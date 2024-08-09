#include "include/testtesttest/testtesttest_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "testtesttest_plugin.h"

void TesttesttestPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  testtesttest::TesttesttestPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
