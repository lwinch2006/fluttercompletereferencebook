import 'dart:io';

void ioFunc1() async {
  print(Directory.current);
  final file = File('demo.txt');
  final content = await file.readAsString();
  print('File content:');
  print(content);

  await file.writeAsString( '${DateTime.timestamp().toString()}${Platform.lineTerminator}', mode: FileMode.append);
}

