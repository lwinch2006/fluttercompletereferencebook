import 'package:chapter13_3/models/active_page.dart';
import 'package:chapter13_3/navigation_state_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      NavigationStateWidget(
        currentPage: ValueNotifier<ActivePage>(ActivePage.homePage),
        pagesStack: <ActivePage>[ActivePage.homePage],
        child: const MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ListenableBuilder(
          listenable: context.navigationState.currentPage,
          builder: (context, _) {
            return Navigator(
              pages: context.navigationState.getNavigatorPages(),
              onPopPage: (route, result) {
                if (!route.didPop(result)) {
                    return false;
                }
                context.navigationState.pagesStack.removeLast();
                return true;
              },
            );
          },
        ),
    );
  }
}


