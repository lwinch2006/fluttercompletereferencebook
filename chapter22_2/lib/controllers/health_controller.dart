import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class HealthController {
  Response map(Request request) {
    final action = request.params['action'];

    switch (action) {
      case null:
      case '':
        return Response.ok('{\'status\': \'success\'}', headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.toString()
        });

      default:
        return Response.notFound(null);
    }
  }
}
