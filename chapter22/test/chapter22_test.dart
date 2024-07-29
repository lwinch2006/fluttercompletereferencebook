import 'dart:io';
import 'package:test/test.dart';

import '../bin/main.dart';

void main() {
  group('Http Server tests', () {
    late HttpServer httpServer;
    late HttpClient httpClient;

    setUpAll(() async {
      final environment = Platform.environment['DART_ENVIRONMENT']!;
      print('Environment: $environment');

      httpServer = await startHttpServer(environment);
      httpClient = HttpClient();
    },);

    tearDownAll(() async {
      httpClient.close();
      await httpServer.close();
    },);

    test('Testing home page', () async {
        final httpRequest = await httpClient.get(InternetAddress.loopbackIPv4.host, 5555, '/');
        final httpResponse = await httpRequest.close();
        expect(httpResponse.statusCode, equals(200));
    },);
  },);
}
