
import 'package:chapter14/pages/home_page.dart';
import 'package:chapter14/pages/page1_page.dart';
import 'package:chapter14/pages/page2_page.dart';
import 'package:chapter14/pages/page3_page.dart';
import 'package:chapter14/pages/page4_page.dart';
import 'package:go_router/go_router.dart';

const homePagePath = '/';
const page1Path = '/page1';
const page2Path = '/page2';
const page3Path = '/page3';
const page4Path = '/page4';



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
        builder: (context, state) =>
        const Page1(title: 'Row, Column, Expanded, Flexible, Wrap, ConstrainedBox widgets'),
      ),
      GoRoute(
        path: page2Path,
        builder: (context, state) =>
        const Page2(title: 'Table widget'),
      ),
      GoRoute(
        path: page3Path,
        builder: (context, state) =>
        const Page3(title: 'Flutter Demo About Page'),
      ),
      GoRoute(
        path: page4Path,
        builder: (context, state) =>
        const Page4(title: 'Flutter Demo About Page'),
      ),
    ],
  );
}