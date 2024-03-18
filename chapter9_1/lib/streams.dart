import 'dart:convert';
import 'dart:io';

Future<ServerSocket> startServer() async {
  final server = await ServerSocket.bind('127.0.0.1', 5000);
  final decoder = Utf8Decoder();

  server.listen((socket) {
    decoder.bind(socket).listen((message) {
      print(message);
      socket.write('Server >> Hello Client');
      socket.close();
    });
  },
  onDone: (){
    print('Server stopped listening');
  });

  return server;
}

Future<Socket> sendRequestToServer() async {
  final client = await Socket.connect('127.0.0.1', 5000);
  client.write('Client >> Hello Server');

  client.listen((event) {
    print(String.fromCharCodes(event));
  },
  onDone: (){
    print('Client stopped listening');
  });

  return client;
}
