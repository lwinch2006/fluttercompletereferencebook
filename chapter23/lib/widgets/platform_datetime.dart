import 'package:chapter23/method_channel_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformDateTime extends StatefulWidget {
  const PlatformDateTime();

  @override
  State<StatefulWidget> createState() => _PlatformDateTimeState();
}

class _PlatformDateTimeState extends State<PlatformDateTime> {
  static const channel = MethodChannel(methodChannelDateTime);
  late final _value = getDateTime();

  Future<String> getDateTime() async {
    const error = 'Can not get date and time on device';

    try {
      return await Future<String>.delayed(const Duration(seconds: 5), () async {
        return await channel.invokeMethod<String>(methodGetDateTime) ?? error;
      },);
    } on Exception {
      return error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _value,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Text('Current date and time: ${snapshot.data}');
          }

          if (snapshot.hasError) {
            return const Text('Operation failed');
          }

          return const Text('Operation completed with no data');
        }

        return Text('Loading...');
      },);
  }
}