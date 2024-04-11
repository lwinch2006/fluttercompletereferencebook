import 'package:chapter13/models/todo_item.dart';
import 'package:chapter13/pages/about_page.dart';
import 'package:chapter13/pages/error_page.dart';
import 'package:chapter13/pages/home_page.dart';
import 'package:chapter13/pages/todo_details_page.dart';
import 'package:chapter13/pages/todos_page.dart';
import 'package:flutter/material.dart';

const homePageRouteName = '/';
const aboutPageRouteName = '/about';
const todosPageRouteName = '/todos';
const todoDetailsPageRouteName = '/todoDetails';

Route<Object?> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case homePageRouteName:
      return MaterialPageRoute<void>(builder: (_) {
        return const HomePage(title: 'Flutter Demo Home Page');
      });

    case aboutPageRouteName:
      return MaterialPageRoute<void>(builder: (_) {
        return const AboutPage(title: 'Flutter Demo About Page');
      });

    case todosPageRouteName:
      return MaterialPageRoute<void>(builder: (_) {
        return const TodosPage(title: 'Flutter Demo Todos Page');
      });

    case todoDetailsPageRouteName:
      return MaterialPageRoute<String>(
          settings: settings,
          builder: (_) {
            return const TodoDetailsPage(
              title: 'Flutter Demo Todo Details Page',
              todoTitle: '',
              todoDetails: '',
            );
          });

    default:
      return MaterialPageRoute<void>(builder: (_) {
        return const ErrorPage(
            title: 'Flutter Demo Error Page',
            errorDetails: 'Route has not been found');
      });
  }
}

void navigateByBottomNavigationBarSelectedIndex(
    BuildContext context, int currentIndex, int selectedIndex) async {
  if (currentIndex == selectedIndex) {
    return;
  }

  switch (selectedIndex) {
    case 0:
      debugPrint('Navigating to Home page...');
      await Navigator.of(context).pushNamed(homePageRouteName);

    case 1:
      debugPrint('Navigating to Todos page...');
      await Navigator.of(context).pushNamed(todosPageRouteName);

    case 2:
      debugPrint('Navigating to About page...');
      await Navigator.of(context).pushNamed(aboutPageRouteName);

    default:
      debugPrint('Navigating to Error page...');
      await Navigator.of(context).pushNamed('errorPageRouteName');
  }
}
