import 'dart:io';
import 'package:chapter22_3/src/arguments_parser.dart';
import 'package:chapter22_3/src/http_server.dart' as http_server;
import 'package:chapter22_3/src/https_server.dart' as https_server;
import 'package:shelf/shelf_io.dart';

void main(List<String> arguments) async {
  final httpServer = await serve(
      http_server.getPipeline(), InternetAddress.loopbackIPv4, 5001);
  final httpsServer = await serve(
      https_server.getPipeline(), InternetAddress.loopbackIPv4, 5002, securityContext: buildSecurityContextFromArgs(arguments));

  print('HTTP server listening on port ${httpServer.port}');
  print('HTTP server listening on port ${httpsServer.port}');
}
