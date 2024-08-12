import 'package:chapter23_3_3/date_pigeon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformDateTime extends StatefulWidget {
  const PlatformDateTime();

  @override
  State<StatefulWidget> createState() => _PlatformDateTimeState();
}

class _PlatformDateTimeState extends State<PlatformDateTime> {
  late final _value = getDateTime();

  Future<String> getDateTime() async {
    const error = 'Can not get date and time on device';

    try {
      return await Future<String>.delayed(const Duration(seconds: 5), () async {
        return await NativeDateAPI().getDate() ?? error;
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