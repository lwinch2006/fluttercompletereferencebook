final class Constants {
  static const String homePagePath = '/';
  static const String aboutPagePath = '/about';
  static const String todosPagePath = '/todos';
  static const String errorPagePath = '/error';
}

enum ActivePage {
  homePage(Constants.homePagePath),
  aboutPage(Constants.aboutPagePath),
  todosPage(Constants.todosPagePath),
  errorPage(Constants.errorPagePath);

  final String path;
  const ActivePage(this.path);

  bool get isHomePage => index == 0;
  bool get isAboutPage => index == 1;
  bool get isTodosPage => index == 2;
  bool get isErrorPage => index == 3;
}