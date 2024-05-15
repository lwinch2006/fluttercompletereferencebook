import 'dart:io';
import 'package:chapter14/components/chapter14_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Page6 extends StatefulWidget {
  final String title;

  const Page6({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  final _items = List<Text>.generate(100, (index) => Text('Item $index'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('ListView presented as Sliver'),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: SizedBox(
                    width: 200,
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                          return _items[index];
                        }, childCount: _items.length))
                      ],
                    )),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Column wrapped in SliverToBoxAdapter'),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: SizedBox(
                    width: 200,
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: _items,
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('ListView and GridView in same Column'),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: SizedBox(
                    width: 300,
                    child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) => _items[index],
                    )),
              ),
              Flexible(
                child: SizedBox(
                    width: 300,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemCount: _items.length,
                      itemBuilder: (context, index) => _items[index],
                    )),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      )),
      bottomNavigationBar: Chapter14BottomNavigationBar(
          currentSelectedIndex: 6, context: context),
    );
  }
}
