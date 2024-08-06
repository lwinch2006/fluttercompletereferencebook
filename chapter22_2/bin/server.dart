import 'dart:io';
import 'package:shelf/shelf_io.dart';
import 'package:chapter22_2/pipeline1.dart' as pipeline1;
import 'package:chapter22_2/pipeline2.dart' as pipeline2;

void main(List<String> args) async {
  final ip = InternetAddress.loopbackIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '5555'); // For running in containers, we respect the PORT environment variable.
  final server = await serve(pipeline2.getPipeline(), ip, port);
  print('Server listening on port ${server.port}');
}
