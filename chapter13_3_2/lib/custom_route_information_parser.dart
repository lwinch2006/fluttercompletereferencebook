import 'package:chapter13_3_2/models/active_page.dart';
import 'package:flutter/material.dart';

class CustomRouteInformationParser extends RouteInformationParser<ActivePage> {
  const CustomRouteInformationParser();
  
  @override
  Future<ActivePage> parseRouteInformation(RouteInformation routeInformation) async {
    switch (routeInformation.uri.path) {
      case Constants.homePagePath:
        return ActivePage.homePage;

      case Constants.aboutPagePath:
        return ActivePage.aboutPage;

      case Constants.todosPagePath:
        return ActivePage.todosPage;

      default:
        return ActivePage.errorPage;
    }
  }

  @override
  RouteInformation? restoreRouteInformation(ActivePage configuration) {
    switch (configuration.path) {
      case Constants.homePagePath:
        return RouteInformation(
          uri: Uri.parse(Constants.homePagePath)
        );

      case Constants.aboutPagePath:
        return RouteInformation(
          uri: Uri.parse(Constants.aboutPagePath)
        );

      case Constants.todosPagePath:
        return RouteInformation(
          uri: Uri.parse(Constants.todosPagePath)
        );

      default:
        return null;
    }
  }
}