import 'package:chapter13_4/pages/about_page.dart';
import 'package:chapter13_4/pages/home_page.dart';
import 'package:chapter13_4/pages/todo_details_page.dart';
import 'package:chapter13_4/pages/todos_page.dart';
import 'package:go_router/go_router.dart';

const homePagePath = '/';
const aboutPagePath = '/about';
const todosPagePath = '/todos';
const todoDetailsPagePath = '/todoDetails';

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
        path: todosPagePath,
        builder: (context, state) =>
            const TodosPage(title: 'Flutter Demo Todos Page'),
      ),
      GoRoute(
        path: aboutPagePath,
        builder: (context, state) =>
            const AboutPage(title: 'Flutter Demo About Page'),
      ),
      GoRoute(
        //path: todoDetailsPagePath, // Alternatives 1 & 2
        path: '$todoDetailsPagePath/:todoTitle/:todoDetails',
        builder: (context, state) {
          // Alternative 1 to pass todo title and details
          // var params = state.extra as String;
          // var paramsAsArray = params.split('|');

          // Alternative 2 to pass todo title and details
          // var paramsAsArray = [
          //   state.uri.queryParameters['todoTitle'] ?? '',
          //   state.uri.queryParameters['todoDetails'] ?? ''
          // ];

          // Alternative 3 to pass todo title and details
          var paramsAsArray = [
            state.pathParameters['todoTitle'] ?? '',
            state.pathParameters['todoDetails'] ?? ''
          ];

          return TodoDetailsPage(
            title: 'Flutter Demo Todo Details Page',
            todoTitle: paramsAsArray[0],
            todoDetails: paramsAsArray[1],
          );
        },
      ),
    ],
  );
}
