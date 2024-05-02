import 'package:chapter13_3_2/models/active_page.dart';
import 'package:chapter13_3_2/pages/about_page.dart';
import 'package:chapter13_3_2/pages/error_page.dart';
import 'package:chapter13_3_2/pages/home_page.dart';
import 'package:chapter13_3_2/pages/todos_page.dart';
import 'package:flutter/material.dart';

class CustomRouterDelegate extends RouterDelegate<ActivePage>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ActivePage> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  ActivePage _currentPage = ActivePage.homePage;
  final List<ActivePage> _pagesStack = <ActivePage>[ActivePage.homePage];

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  ActivePage? get currentConfiguration {
    return _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Navigator(
        key: _navigatorKey,
        pages: _getNavigatorPages(),
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          _pagesStack.removeLast();
          return true;
        },
      ),
    );
  }

  @override
  Future<void> setNewRoutePath(ActivePage configuration) async {
    if (configuration == _currentPage) {
      return;
    }

    switch (configuration.path) {
      case Constants.homePagePath:
        _currentPage = ActivePage.homePage;
        _pagesStack.add(ActivePage.homePage);
        break;

      case Constants.aboutPagePath:
        _currentPage = ActivePage.aboutPage;
        _pagesStack.add(ActivePage.aboutPage);
        break;

      case Constants.todosPagePath:
        _currentPage = ActivePage.todosPage;
        _pagesStack.add(ActivePage.todosPage);
        break;

      case Constants.errorPagePath:
      default:
        _currentPage = ActivePage.errorPage;
        _pagesStack.clear();
        _pagesStack.add(ActivePage.errorPage);
        break;
    }
  }

  List<Page<dynamic>> _getNavigatorPages() {
    var result = <Page<dynamic>>[];

    for (var activePage in _pagesStack) {
      Page<dynamic> page;
      switch (activePage) {
        case ActivePage.homePage:
          page = MaterialPage(
              child: HomePage(
                title: 'Flutter Demo Home Page',
                onNavigateToAboutPage: () {
                  _currentPage = ActivePage.aboutPage;
                  _pagesStack.add(ActivePage.aboutPage);
                  notifyListeners();
                },
                onNavigateToTodosPage: () {
                  _currentPage = ActivePage.todosPage;
                  _pagesStack.add(ActivePage.todosPage);
                  notifyListeners();
                },
              ));
          break;
        case ActivePage.todosPage:
          page = MaterialPage(
              child: TodosPage(
                title: 'Flutter Demo Todos Page',
                onNavigateToHomePage: () {
                  _currentPage = ActivePage.homePage;
                  _pagesStack.add(ActivePage.homePage);
                  notifyListeners();
                },
                onNavigateToAboutPage: () {
                  _currentPage = ActivePage.aboutPage;
                  _pagesStack.add(ActivePage.aboutPage);
                  notifyListeners();
                },
              ));
          break;
        case ActivePage.aboutPage:
          page = MaterialPage(
              child: AboutPage(
                title: 'Flutter Demo About Page',
                onNavigateToHomePage: () {
                  _currentPage = ActivePage.homePage;
                  _pagesStack.add(ActivePage.homePage);
                  notifyListeners();
                },
                onNavigateToTodosPage: () {
                  _currentPage = ActivePage.todosPage;
                  _pagesStack.add(ActivePage.todosPage);
                  notifyListeners();
                },
              ));
          break;
        case ActivePage.errorPage:
          page = const MaterialPage(
              child: ErrorPage(
                  title: 'Flutter Demo Error Page',
                  errorDetails: 'Route has not been found'));
          break;
      }

      result.add(page);
    }

    return result;
  }
}
