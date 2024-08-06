import 'package:shelf/shelf.dart';
import 'package:shelf_static/shelf_static.dart';

Handler getPipeline() {
  final requestPipeline =
      Cascade().add(_staticContent()).handler;

  final pipeline = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(requestPipeline);

  return pipeline;
}

Handler _staticContent() {
  return createStaticHandler('public',
      defaultDocument: 'index.html', listDirectories: false);
}
