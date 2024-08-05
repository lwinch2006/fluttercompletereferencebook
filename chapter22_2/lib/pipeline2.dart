import 'dart:io';

import 'package:chapter22_2/controllers/echo_controller.dart';
import 'package:chapter22_2/controllers/health_controller.dart';
import 'package:chapter22_2/controllers/root_controller.dart';
import 'package:chapter22_2/middleware/only_get_and_post_requests_middleware.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';


Handler getPipeline() {
  final requestPipeline =
      Cascade().add(_staticContent()).add(_endpoints()).handler;

  final pipeline = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(OnlyGetAndPostRequestsMiddleware.middleware)
      .addHandler(requestPipeline);

  return pipeline;
}

Handler _staticContent() {
  return createStaticHandler('wwwroot',
      defaultDocument: 'index.html', listDirectories: false);
}

Handler _endpoints() {
  return (Router(
    notFoundHandler: (request) {
      return Response.notFound('Whoops! URL not found :(');
    },
  )
        ..get('/', RootController().map)
        ..get('/root', RootController().map)
        ..get('/root/<action|.*>', RootController().map)
        ..get('/echo', EchoController().map)
        ..get('/echo/<action|.*>/<data|.*>', EchoController().map)
        ..post('/health', HealthController().map)
        ..post('/health/<action|.*>', HealthController().map))
      .call;
}