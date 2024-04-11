import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String title;
  final String errorDetails;

  const ErrorPage({
    super.key,
    required this.title,
    required this.errorDetails
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Error details:',
            ),
            Text(
              errorDetails,
            ),
          ],
        ),
      ),
    );
  }
}