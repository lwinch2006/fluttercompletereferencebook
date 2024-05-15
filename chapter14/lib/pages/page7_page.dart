import 'dart:io';
import 'package:chapter14/components/chapter14_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Page7 extends StatefulWidget {
  final String title;

  const Page7({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page7State();
}

class _Page7State extends State<Page7> {
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
              const Text('ListView and GridView with common scrolling'),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: SizedBox(
                  width: 300,
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => _items[index],
                          childCount: _items.length,
                        ),
                      ),
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                            (context, index) => _items[index],
                            childCount: _items.length),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Sticky headers'),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: SizedBox(
                  width: 300,
                  child: CustomScrollView(
                    slivers: [
                      const SliverAppBar(
                        automaticallyImplyLeading: false,
                        centerTitle: true,
                        pinned: true,
                        title: Text('ListView #1'),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) => _items[index],
                          childCount: _items.length,
                        ),
                      ),
                      const SliverAppBar(
                        automaticallyImplyLeading: false,
                        centerTitle: true,
                        pinned: true,
                        title: Text('ListView #2'),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) => _items[index],
                          childCount: _items.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Header with fading on scrolling'),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: SizedBox(
                  width: 300,
                  child: CustomScrollView(
                    slivers: [
                      const SliverAppBar(
                        automaticallyImplyLeading: false,
                        centerTitle: true,
                        pinned: false,
                        title: Text('ListView #1'),
                        expandedHeight: 100,
                        backgroundColor: Colors.grey,
                        flexibleSpace: FlexibleSpaceBar(
                          background: ColoredBox(color: Colors.amberAccent),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) => _items[index],
                          childCount: _items.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      )),
      bottomNavigationBar: Chapter14BottomNavigationBar(
          currentSelectedIndex: 7, context: context),
    );
  }
}
