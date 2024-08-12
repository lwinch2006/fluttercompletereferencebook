import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class NativeDateAPI {

  @async
  String getDate();
}