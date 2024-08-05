import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class EchoController {
  Response map(Request request) {
    final action = request.params['action'];

    switch (action) {
      case 'send':
        return _send(request);

      default:
        return Response.notFound(null);
    }
  }

  Response _send(Request request) {
    final message = Uri.decodeComponent(request.params['data']!);
    return Response.ok('$message\n');
  }
}