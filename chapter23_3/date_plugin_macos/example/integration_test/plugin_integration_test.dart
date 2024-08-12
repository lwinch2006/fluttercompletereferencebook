// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing

import 'package:date_plugin_platform_interface/date_plugin_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getPlatformVersion test', (WidgetTester tester) async {
    final String? version = await DatePluginPlatform.instance.getDate();
    // The version string depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(version?.isNotEmpty, true);
  });
}