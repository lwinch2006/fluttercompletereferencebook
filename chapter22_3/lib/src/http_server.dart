import 'package:shelf/shelf.dart';

Handler getPipeline() {
  return (request) {
    final newUri = request.requestedUri.replace(scheme: 'https', port: 5002);
    return Response.movedPermanently(newUri);
  };
}
