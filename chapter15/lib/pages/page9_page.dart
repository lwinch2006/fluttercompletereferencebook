import 'package:chapter15/models/hero_tags.dart';
import 'package:chapter15/routes.dart';
import 'package:chapter15/widgets/chapter15_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page9 extends StatefulWidget {
  final String title;

  const Page9({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page9State();
}

class _Page9State extends State<Page9> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Hero(
                tag: page8Page9TagHero,
                child: Image(image: AssetImage('assets/images/044.png')),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () async {
                  await context.push(page8Path);
                },
                child: const Text('To page 8'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Chapter15BottomNavigationBar(
          currentSelectedIndex: 9, context: context),
    );
  }
}
