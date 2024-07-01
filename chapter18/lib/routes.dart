import 'package:chapter18/pages/home/home_page.dart';
import 'package:chapter18/pages/page1/page1_page.dart';
import 'package:chapter18/pages/page2/page2_page.dart';
import 'package:chapter18/pages/page3/page3_page.dart';
import 'package:go_router/go_router.dart';

const homePagePath = '/';
const page1Path = '/page1';
const page2Path = '/page2';
const page3Path = '/page3';

GoRouter generateRouter() {
  return GoRouter(
    initialLocation: homePagePath,
    routes: [
      GoRoute(
          path: homePagePath,
          builder: (context, state) {
            return const HomePage(title: 'Form controls');
          }),
      GoRoute(
        path: page1Path,
        builder: (context, state) => const Page1(title: 'Handling forms'),
      ),
      GoRoute(
        path: page2Path,
        builder: (context, state) => const Page2(title: 'Gestures'),
      ),
      GoRoute(
        path: page3Path,
        builder: (context, state) => const Page3(title: 'Deep dive'),
      ),
    ],
  );
}