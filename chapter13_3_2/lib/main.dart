import 'package:chapter13_3_2/custom_router_delegate.dart';
import 'package:chapter13_3_2/custom_route_information_parser.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp.router(
        routeInformationParser: const CustomRouteInformationParser(),
        routerDelegate: CustomRouterDelegate(),
      ));
}