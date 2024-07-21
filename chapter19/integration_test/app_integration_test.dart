import 'package:chapter19/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Integration test',
    (widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle();

      expectLater(find.text('Counter: 0'), findsOneWidget);

      await widgetTester.tap(find.byIcon(Icons.add));
      await widgetTester.pumpAndSettle();

      expectLater(find.text('Counter: 0'), findsNothing);
      expectLater(find.text('Counter: 1'), findsOneWidget);
    },
  );
}
