
import 'dart:io';

import 'package:chapter22_3/src/http_server.dart';
import 'package:shelf/shelf_io.dart';
import 'package:test/test.dart';

void main() {
  late HttpServer server;

  setUpAll(() async {
    server = await serve(getPipeline(), InternetAddress.loopbackIPv4, 5001);
  },);

  tearDownAll(() async {
    await server.close();
  },);

  group('Testing HTTP server', () {
    test('Redirect from HTTP to HTTPS', () async {
      final httpClient = HttpClient();

      try {
        var request = await httpClient.get(InternetAddress.loopbackIPv4.address, 5001, '/');
        request.followRedirects = false;
        final response = await request.close();

        expect(response.statusCode, HttpStatus.movedPermanently);
        expect(response.headers['location']![0], startsWith('https://'));
      } finally {
        httpClient.close();
      }
    }, );
  },);
}



