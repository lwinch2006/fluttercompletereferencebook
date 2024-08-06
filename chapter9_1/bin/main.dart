import 'package:chapter9_1/streams.dart';

void main(List<String> arguments) async {

  final server = await startServer();
  final client = await sendRequestToServer();
  await client.close();
  await server.close();

  // startServer().then((server) {
  //   sendRequestToServer().then((client) {
  //     client.close().then((_) {
  //       client.destroy();
  //       print('Client closed');
  //       server.close().then((_) {
  //         print('Server closed');
  //       });
  //     });
  //   });
  // });






}
