
import 'package:chapter19/main.dart';
import 'package:chapter19/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Home page', () {
    testWidgets('Smoke tests', (widgetTester) async {
      await widgetTester.pumpWidget(const App());
      
      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.text('Hello World'), findsOneWidget);
      expect(find.text('Hello World 123'), findsNWidgets(0));
      expect(find.text('Hello World 123'), findsNothing);

      expect(find.byKey(const Key('Home-Page-Center-Widget-Key')), findsOneWidget);

      final helloWorldTextWidgetFinder = find.text('Hello World');
      final helloWorldTextWidget = widgetTester.widget<Text>(helloWorldTextWidgetFinder);
      expect(helloWorldTextWidget.textAlign, TextAlign.center);



    },);

    testWidgets('Exercise test - Increment button', (widgetTester) async {
      await widgetTester.pumpWidget(const App());

      expect(find.widgetWithText(HomePage, 'Counter: 0'), findsOneWidget);

      await widgetTester.tap(find.byIcon(Icons.add));
      await widgetTester.pump();

      expect(find.widgetWithText(HomePage, 'Counter: 0'), findsNothing);
      expect(find.widgetWithText(HomePage, 'Counter: 1'), findsOneWidget);
      
      final homePageFinder = find.byType(HomePage);
      final homePageState = widgetTester.state<HomePageState>(homePageFinder);
      expect(homePageState.counter, 1);
      
    },);

    testWidgets('Golden test - Home page', (widgetTester) async {
      await widgetTester.pumpWidget(const App());
      await expectLater(find.byKey(const Key('Home-Page-Center-Widget-Key')), matchesGoldenFile('goldens/home_page_outlook.png'));
    },);
  });
}

