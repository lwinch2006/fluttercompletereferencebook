#ifndef FLUTTER_PLUGIN_DATE_PLUGIN_WINDOWS_PLUGIN_H_
#define FLUTTER_PLUGIN_DATE_PLUGIN_WINDOWS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace date_plugin_windows {

class DatePluginWindowsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  DatePluginWindowsPlugin();

  virtual ~DatePluginWindowsPlugin();

  // Disallow copy and assign.
  DatePluginWindowsPlugin(const DatePluginWindowsPlugin&) = delete;
  DatePluginWindowsPlugin& operator=(const DatePluginWindowsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace date_plugin_windows

#endif  // FLUTTER_PLUGIN_DATE_PLUGIN_WINDOWS_PLUGIN_H_
