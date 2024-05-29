import 'package:chapter15/extensions/build_context_extensions.dart';
import 'package:chapter15/widgets/chapter15_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Page1 extends StatefulWidget {
  final String title;

  const Page1({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  @override
  Widget build(BuildContext context) {
    final numberFormatterSys = NumberFormat('###.0#', context.localeState.value.toString());
    final numberFormatterWithCurrencySys = NumberFormat('###.0# ¤', context.localeState.value.toString());

    final numberFormatterEN = NumberFormat('###.0#', 'en_US');
    final numberFormatterWithCurrencyEN = NumberFormat('###.0# ¤', 'en_US');
    final numberFormatterNO = NumberFormat('###.0#', 'nb_NO');
    final numberFormatterWithCurrencyNO = NumberFormat('###.0# ¤', 'nb_NO');
    final numberFormatterWithSeparatorsNO = NumberFormat('###,###,###.0#', 'nb_NO');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('System format - ${numberFormatterSys.format(123.456)}'),
            Text('System format - ${numberFormatterSys.currencyName}'),
            Text('System format - ${NumberFormat.currency(locale: context.localeState.value.toString()).format(123.456)}'),
            Text('System format (Custom) - ${numberFormatterWithCurrencySys.format(123.456)}'),
            const SizedBox(
              height: 10,
            ),
            Text('English format - ${numberFormatterEN.format(123.456)}'),
            Text('Norwegian format - ${numberFormatterNO.format(123.456)}'),
            Text('Norwegian format - ${numberFormatterWithSeparatorsNO.format(123123123.456)}'),
            const SizedBox(
              height: 10,
            ),
            Text('English format - ${numberFormatterEN.currencyName}'),
            Text('Norwegian format - ${numberFormatterNO.currencyName}'),
            const SizedBox(
              height: 10,
            ),
            Text('English format - ${NumberFormat.currency(locale: 'en_US').format(123.456)}'),
            Text('English format (Custom) - ${numberFormatterWithCurrencyEN.format(123.456)}'),
            Text('Norwegian format - ${NumberFormat.currency(locale: 'nb_NO').format(123.456)}'),
            Text('Norwegian format (Custom) - ${numberFormatterWithCurrencyNO.format(123.456)}'),
            Text('Great Britain format - ${NumberFormat.currency(locale: 'en_GB').format(123.456)}'),
            Text('Germany format - ${NumberFormat.currency(locale: 'de_DE').format(123.456)}'),
          ],
        ),
      ),
      bottomNavigationBar: Chapter15BottomNavigationBar(
          currentSelectedIndex: 1, context: context),
    );
  }
}
