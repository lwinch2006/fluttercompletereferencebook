import 'dart:async';
import 'dart:io';
import 'package:chapter22/chapter22.dart' as chapter22;

Future<void> main() async {
  runZonedGuarded(
    () async {
      final environment = Platform.environment['DART_ENVIRONMENT']!;

      print('Current directory: ${Directory.current}');
      print('Current URI: ${Platform.script}');
      print('Environment: $environment');



      // To start bind server to HTTPS use following
      // Pathes to certficate chain and key PEM files should be corrected
      // final certChain =
      //     Platform.script.resolve('path/to/certificate/chain.pem').toFilePath();
      // final key = Platform.script.resolve('path/to/key.pem').toFilePath();
      // final securityContext = SecurityContext()
      //   ..useCertificateChain(certChain)
      //   ..usePrivateKey(key);
      //
      // final httpsServer = await HttpServer.bindSecure(
      //     InternetAddress.loopbackIPv4, 5555, securityContext);

      print('HTTP server starting...');
      await startHttpServer(environment);


      print('HTTP server started.');
    },
    (error, stack) {
      print('Error: $error');
    },
  );
}

Future<HttpServer> startHttpServer(String environment) async {
  late HttpServer httpServer;

  switch (environment) {
    case 'Development':
      httpServer = await HttpServer.bind(InternetAddress.loopbackIPv4, 5555);
    default:
      throw Exception('Environment [$environment] not supported');
  }

  httpServer.listen(
        (HttpRequest httpRequest) async {
      // If you want to redirect all HTTP requests to HTTPS
      // Here we dont need close() since redirect is closing internally
      // await httpRequest.response.redirect(
      //     httpRequest.uri.replace(scheme: 'https'),
      //     status: HttpStatus.movedPermanently);

      print('Incoming HTTP request');
      _printHeadersInfo(httpRequest);
      _printQueryParameters(httpRequest);




      //_returnSimpleContent(httpRequest); // Returning content type: text/plain
      await _returnHtmlContent(httpRequest); // Returning content type: text/html



      await httpRequest.response.close(); // Should be always called
    },
  );

  return httpServer;
}

void _returnSimpleContent(HttpRequest httpRequest) {
  httpRequest.response.write('Hello HTTP client');
}

Future<void> _returnHtmlContent(HttpRequest httpRequest) async {
  httpRequest.response.headers.set(HttpHeaders.contentTypeHeader, '${ContentType.html}');
  final indexPage = await File('wwwroot/static/index.html').readAsString();
  httpRequest.response.write(indexPage);
}

void _printHeadersInfo(HttpRequest httpRequest) {
  print(httpRequest.headers.host);
  print(httpRequest.headers.contentType);
  print(httpRequest.headers.contentLength);
  print(httpRequest.headers.date);
  print(httpRequest.headers.value(HttpHeaders.acceptLanguageHeader));
}

void _printQueryParameters(HttpRequest httpRequest) {
  final uri = httpRequest.uri;
  print('Query string parameters');
  uri.queryParameters.forEach((key, value) {
    print('Name: $key, Value: $value');
  },);
}
