import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';

final _onlyGetRequestsMiddleware2 = createMiddleware(
  requestHandler: (request) async {
    if (request.method != 'GET' && request.method != 'POST') {
      return Response.badRequest(
          body: 'Only GET and POST requests are allowed');
    }
  },
  errorHandler: (error, stackTrace) {
    print('Error: $error${Platform.lineTerminator}Stack trace: $stackTrace');
    return Response.internalServerError();
  },
);

final _staticFilesHandler = createStaticHandler('wwwroot',
    defaultDocument: 'index.html', listDirectories: true);

final _router = Router(
  notFoundHandler: (request) {
    return Response.notFound('Whoops! URL not found :(');
  },
)
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler)
  ..post('/testPost', _postHandler)
  ..get('/static/<file|.*>', _staticFilesHandler); // I don't like this

Handler getPipeline() {
  final handler = Pipeline()
      .addMiddleware(logRequests())
      //.addMiddleware(_onlyGetRequestsMiddleware) // Alternative 1
      .addMiddleware(_onlyGetRequestsMiddleware2) // Alternative 2
      .addHandler(_router.call);

  return handler;
}

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  // Uncomment this to test error handler
  // throw Exception('Only GET requests are allowed');

  final message = Uri.decodeComponent(request.params['message']!);
  return Response.ok('$message\n');
}

Response _postHandler(Request request) {
  return Response.ok('{\'status\': \'success\'}',
      headers: {HttpHeaders.contentTypeHeader: ContentType.json.toString()});
}

Handler _onlyGetRequestsMiddleware1(Handler innerHandler) {
  return (Request request) async {
    if (request.method == 'GET' || request.method == 'POST') {
      return await innerHandler(request);
    } else {
      return Response.badRequest(
          body: 'Only GET and POST requests are allowed');
    }
  };
}
