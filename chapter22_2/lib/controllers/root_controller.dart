import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class RootController {
  Response map(Request request) {
    final action = request.params['action'];

    switch (action) {
      case null:
      case '':
        return Response.ok('Hello, World!\n');

      default:
        return Response.notFound(null);
    }
  }
}