
import 'package:chapter14/pages/home_page.dart';
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
        const HomePage(title: 'Flutter Demo Home Page'),
      ),
      GoRoute(
        path: page1Path,
        builder: (context, state) =>
        const TodosPage(title: 'Flutter Demo Todos Page'),
      ),
      GoRoute(
        path: page2Path,
        builder: (context, state) =>
        const AboutPage(title: 'Flutter Demo About Page'),
      ),
      GoRoute(
        path: page3Path,
        builder: (context, state) =>
        const AboutPage(title: 'Flutter Demo About Page'),
      ),
      GoRoute(
        path: page4Path,
        builder: (context, state) =>
        const AboutPage(title: 'Flutter Demo About Page'),
      ),
    ],
  );
}