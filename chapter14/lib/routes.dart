import 'package:chapter14/pages/home_page.dart';
import 'package:chapter14/pages/page1_page.dart';
import 'package:chapter14/pages/page2_page.dart';
import 'package:chapter14/pages/page3_page.dart';
import 'package:chapter14/pages/page4_page.dart';
import 'package:chapter14/pages/page5_page.dart';
import 'package:chapter14/pages/page6_page.dart';
import 'package:chapter14/pages/page7_page.dart';
import 'package:chapter14/pages/page8_page.dart';
import 'package:chapter14/pages/page9_page.dart';
import 'package:go_router/go_router.dart';

const homePagePath = '/';
const page1Path = '/page1';
const page2Path = '/page2';
const page3Path = '/page3';
const page4Path = '/page4';
const page5Path = '/page5';
const page6Path = '/page6';
const page7Path = '/page7';
const page8Path = '/page8';
const page9Path = '/page9';

GoRouter generateRouter() {
  return GoRouter(
    initialLocation: homePagePath,
    routes: [
      GoRoute(
        path: homePagePath,
        builder: (context, state) =>
            const HomePage(title: 'Container with Row of Icons'),
      ),
      GoRoute(
        path: page1Path,
        builder: (context, state) => const Page1(
            title:
                'Row, Column, Expanded, Flexible, Wrap, ConstrainedBox widgets'),
      ),
      GoRoute(
        path: page2Path,
        builder: (context, state) => const Page2(title: 'Table widget'),
      ),
      GoRoute(
        path: page3Path,
        builder: (context, state) => const Page3(title: 'Responsive layouts'),
      ),
      GoRoute(
        path: page4Path,
        builder: (context, state) => const Page4(title: 'Scrollable widgets'),
      ),
      GoRoute(
        path: page5Path,
        builder: (context, state) => const Page5(title: 'Gridviews'),
      ),
      GoRoute(
        path: page6Path,
        builder: (context, state) => const Page6(title: 'Slivers 1'),
      ),
      GoRoute(
        path: page7Path,
        builder: (context, state) => const Page7(title: 'Slivers 2'),
      ),
      GoRoute(
        path: page8Path,
        builder: (context, state) => const Page8(title: 'Render objects'),
      ),
      GoRoute(
        path: page9Path,
        builder: (context, state) => const Page9(title: 'Scrolling and overlays'),
      ),
    ],
  );
}
