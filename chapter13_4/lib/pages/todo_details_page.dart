import 'package:flutter/material.dart';

class TodoDetailsPage extends StatelessWidget {
  final String title;
  final String todoTitle;
  final String todoDetails;

  const TodoDetailsPage({
    super.key,
    required this.title,
    required this.todoTitle,
    required this.todoDetails,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop('Returning from Todo Details Page');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Title: $todoTitle',
            ),
            Text(
              'Details: $todoDetails',
            ),
          ],
        ),
      ),
    );
  }
}