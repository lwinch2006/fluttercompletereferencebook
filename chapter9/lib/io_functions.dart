import 'dart:async';
import 'dart:convert';
import 'dart:io';

void ioFunc1() async {
  print(Directory.current);
  final file = File('demo.txt');
  final content = await file.readAsString();
  print('File content:');
  print(content);

  await file.writeAsString( '${DateTime.timestamp().toString()}${Platform.lineTerminator}', mode: FileMode.append);
}

void ioFunc2() {
  stdout.writeln('First number:');
  final num1AsString = stdin.readLineSync() ?? '';

  stdout.writeln('Second number:');
  final num2AsString = stdin.readLineSync() ?? '';

  final num1 = int.tryParse(num1AsString);
  final num2 = int.tryParse(num2AsString);

  if (num1 != null && num2 != null) {
    stdout.writeln('num1 + num2 = ${num1+num2}');
  } else {
    stderr.writeln('Error while parsing numbers');
  }
}

void ioFunc3() async{
  final process = await Process.start('ls', ['-l', '-a']);
  await stdout.addStream(process.stdout);

  final hasErrors = !await process.stderr.isEmpty;

  print('The process PID is ${process.pid} with ${hasErrors ? 'errors' : 'no errors'}');
  process.kill();
}

void ioFunc4() async {
  final server = await ServerSocket.bind('127.0.0.1', 5000);
  final decoder = Utf8Decoder();

  server.listen((event) {
    decoder.bind(event).listen(print);
  });

  final client = await Socket.connect('127.0.0.1', 5000);
  client.write('Request to server >> Hello World');
  client.close();
}

