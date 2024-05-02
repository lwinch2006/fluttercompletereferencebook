import 'package:chapter13_3/models/active_page.dart';
import 'package:chapter13_3/pages/about_page.dart';
import 'package:chapter13_3/pages/home_page.dart';
import 'package:chapter13_3/pages/todos_page.dart';
import 'package:flutter/material.dart';

class NavigationStateWidget extends InheritedWidget {
  final ValueNotifier<ActivePage> currentPage;
  final List<ActivePage> pagesStack;

  const NavigationStateWidget(
      {super.key, required this.currentPage, required this.pagesStack, required super.child});

  @override
  bool updateShouldNotify(covariant NavigationStateWidget oldWidget) {
    return currentPage != oldWidget.currentPage;
  }

  static NavigationStateWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NavigationStateWidget>()!;
  }

  List<Page<dynamic>> getNavigatorPages() {
    var result = <Page<dynamic>>[];

    for(var activePage in pagesStack) {
      Widget child;
      switch (activePage) {
        case ActivePage.homePage:
          child = const HomePage(title: 'Flutter Demo Home Page');
          break;
        case ActivePage.todosPage:
          child = const TodosPage(title: 'Flutter Demo Todos Page');
          break;
        case ActivePage.aboutPage:
          child = const AboutPage(title: 'Flutter Demo About Page');
          break;
      }

      result.add(MaterialPage(child: child));
    }

    return result;
  }
}

extension NavigationStateWidgetExtentions on BuildContext {
  NavigationStateWidget get navigationState => NavigationStateWidget.of(this);
}
