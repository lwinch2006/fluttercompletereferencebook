#include "date_plugin_windows_plugin.h"

// This must be included before many other Windows headers.
#include <windows.h>

// For getPlatformVersion; remove unless needed for your plugin implementation.
#include <VersionHelpers.h>

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <flutter/standard_method_codec.h>

#include <memory>
#include <sstream>

namespace date_plugin_windows {

// static
void DatePluginWindowsPlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarWindows *registrar) {
  auto channel =
      std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
          registrar->messenger(), "plugins.example.com/date_plugin",
          &flutter::StandardMethodCodec::GetInstance());

  auto plugin = std::make_unique<DatePluginWindowsPlugin>();

  channel->SetMethodCallHandler(
      [plugin_pointer = plugin.get()](const auto &call, auto result) {
        plugin_pointer->HandleMethodCall(call, std::move(result));
      });

  registrar->AddPlugin(std::move(plugin));
}

DatePluginWindowsPlugin::DatePluginWindowsPlugin() {}

DatePluginWindowsPlugin::~DatePluginWindowsPlugin() {}

void DatePluginWindowsPlugin::HandleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue> &method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  if (method_call.method_name().compare("getDate") == 0) {
    auto now = std::chrono::system_clock::now()
    auto time_t = std::chrono::system_clock::to_time_t(now);
    std::tm tm;
    gmtime_s(&tm, &time_t);
    std::stringstream ss;
    ss << std::put_time(&tm, "UTC: %Y.%m.%d %H:%M:%S");
    result->Success(flutter::EncodableValue(ss.str()));
  } else {
    result->NotImplemented();
  }
}

}  // namespace date_plugin_windows
