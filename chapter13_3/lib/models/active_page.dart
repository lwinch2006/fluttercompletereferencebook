enum ActivePage {
  homePage('/'),
  aboutPage('/about'),
  todosPage('/todos');

  final String path;
  const ActivePage(this.path);
}