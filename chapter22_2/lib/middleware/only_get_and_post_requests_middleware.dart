import 'dart:io';

import 'package:shelf/shelf.dart';

final class OnlyGetAndPostRequestsMiddleware {

  static Middleware get middleware => createMiddleware(
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
}