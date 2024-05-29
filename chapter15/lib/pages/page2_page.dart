import 'package:chapter15/extensions/build_context_extensions.dart';
import 'package:chapter15/widgets/chapter15_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Page2 extends StatefulWidget {
  final String title;

  const Page2({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  @override
  Widget build(BuildContext context) {

    final date = DateTime.now();

    final dateFormat1Sys = DateFormat(null, context.localeState.value.toString());

    final dateFormat1EN = DateFormat('y-M-d h:m.s', 'en_US');
    final dateFormat2EN = DateFormat('d M y', 'en_US');
    final dateFormat1NO = DateFormat('d-M-y H:m.s', 'nb_NO');
    final dateFormat3EN = DateFormat('y MMMM d (E)', 'en_US');
    final dateFormat2NO = DateFormat('y MMMM d (E)', 'nb_NO');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('System format - ${dateFormat1Sys.format(date)}'),
            Text('English format - ${dateFormat1EN.format(date)}'),
            Text('English format - ${dateFormat2EN.format(date)}'),
            Text('Norwegian format - ${dateFormat1NO.format(date)}'),
            Text('English format - ${dateFormat3EN.format(date)}'),
            Text('Norwegian format - ${dateFormat2NO.format(date)}'),
          ],
        ),
      ),
      bottomNavigationBar: Chapter15BottomNavigationBar(
          currentSelectedIndex: 2, context: context),
    );
  }
}
