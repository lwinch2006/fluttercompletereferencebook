

import 'dart:io';

import 'package:chapter22_3/src/https_server.dart';
import 'package:shelf/shelf_io.dart';
import 'package:test/test.dart';

void main() {
  late HttpServer server;

  setUpAll(() async {
    server = await serve(getPipeline(), InternetAddress.loopbackIPv4, 5002);
  },);

  tearDownAll(() async {
    await server.close();
  },);

  Future<void> sendRequest(String path, {bool invalidPath = false}) async {
    final httpClient = HttpClient();

    try {
      final request = await httpClient.get(InternetAddress.loopbackIPv4.address, 5002, path);
      final response = await request.close();

      if (invalidPath) {
        expect(response.statusCode, equals(HttpStatus.notFound));
        expect(response.headers.contentType!.mimeType, equals('text/plain'));
      } else {
        expect(response.statusCode, equals(HttpStatus.ok));
        expect(response.headers.contentLength, greaterThan(0));
        expect(response.headers.contentType!.mimeType, equals('text/html'));
      }
    } finally {
      httpClient.close();
    }
  }

  group('Testing HTTPS server', () {
    test('Home page', () async => await sendRequest('/'),);
    test('Overview page', () async => await sendRequest('/overview.html'),);
    test('Buy page', () async => await sendRequest('/buy.html'),);
    test('Invalid route', () async => await sendRequest('/index123.html', invalidPath: true),);
  },);
}


