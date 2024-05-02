enum ActivePage {
  homePage('/'),
  aboutPage('/about'),
  todosPage('/todos'),
  error('/error');

  final String path;
  const ActivePage(this.path);

  bool get isHomePage => index == 0;
  bool get isAboutPage => index == 1;
  bool get isTodosPage => index == 2;
  bool get isErrorPage => index == 3;
}