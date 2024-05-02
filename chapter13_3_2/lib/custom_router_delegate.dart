import 'package:chapter13_3_2/models/active_page.dart';
import 'package:chapter13_3_2/pages/about_page.dart';
import 'package:chapter13_3_2/pages/error_page.dart';
import 'package:chapter13_3_2/pages/home_page.dart';
import 'package:chapter13_3_2/pages/todos_page.dart';
import 'package:flutter/material.dart';

class CustomRouterDelegate extends RouterDelegate<ActivePage>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ActivePage> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  var _isHome = true, _isAbout = false, _isTodos = false;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  bool get _isError => !_isHome && !_isAbout && !_isTodos;

  @override
  ActivePage? get currentConfiguration {
    if (_isHome) {
      return ActivePage.homePage;
    } else if (_isAbout) {
      return ActivePage.aboutPage;
    } else if (_isTodos) {
      return ActivePage.todosPage;
    }

    return ActivePage.errorPage;
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






          return true;
        },
      ),
    );
  }

  @override
  Future<void> setNewRoutePath(ActivePage configuration) async {
    switch (configuration.path) {
      case Constants.homePagePath:
        _isHome = true;
        _isAbout = _isTodos = false;
        break;

      case Constants.aboutPagePath:
        _isAbout = true;
        _isHome = _isTodos = false;
        break;

      case Constants.todosPagePath:
        _isTodos = true;
        _isHome = _isAbout = false;
        break;

      case Constants.errorPagePath:
      default:
        _isHome = _isAbout = _isTodos = false;
        break;
    }
  }

  List<Page<dynamic>> _getNavigatorPages() {
    var result = <Page<dynamic>>[];

    if (_isError) {
      result.add(const MaterialPage(
        key: ValueKey('ErrorPage'),
        child: ErrorPage(
            title: 'Flutter Demo Error Page',
            errorDetails: 'Route has not been found'),
      ));
    } else if (_isHome) {
      result.add(MaterialPage(
        key: const ValueKey('HomePage'),
        child: HomePage(
          title: 'Flutter Demo Home Page',
          onNavigateToAboutPage: () {
            _isAbout = true;
            _isHome = _isTodos = false;
            notifyListeners();
          },
          onNavigateToTodosPage: () {
            _isTodos = true;
            _isHome = _isAbout = false;
            notifyListeners();
          },
        ),
      ));
    } else if (_isAbout) {
      result.add(MaterialPage(
        key: const ValueKey('AboutPage'),
        child: AboutPage(
          title: 'Flutter Demo About Page',
          onNavigateToHomePage: () {
            _isHome = true;
            _isAbout = _isTodos = false;
            notifyListeners();
          },
          onNavigateToTodosPage: () {
            _isTodos = true;
            _isHome = _isAbout = false;
            notifyListeners();
          },
        ),
      ));
    } else if (_isTodos) {
      result.add(MaterialPage(
        key: const ValueKey('TodosPage'),
        child: TodosPage(
          title: 'Flutter Demo Todos Page',
          onNavigateToHomePage: () {
            _isHome = true;
            _isAbout = _isTodos = false;
            notifyListeners();
          },
          onNavigateToAboutPage: () {
            _isAbout = true;
            _isHome = _isTodos = false;
            notifyListeners();
          },
        ),
      ));
    }

    return result;
  }
}
