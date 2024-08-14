import 'dart:io';
import 'package:chapter14/components/chapter14_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Page5 extends StatefulWidget {
  final String title;

  const Page5({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  final _gridviewItems = List<Text>.generate(100, (index) => Text('$index'));

  final _scrollController = FixedExtentScrollController();

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
              const Text('Gridview with 4 elements/row'),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: SizedBox(
                  width: 200,
                  child: GridView.count(
                    crossAxisCount: 4,
                    children: _gridviewItems,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Gridview with max cross axis extent'),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: SizedBox(
                  width: 200,
                  child: GridView.extent(
                    maxCrossAxisExtent: 30,
                    children: _gridviewItems,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Never scrollable gridview'),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: SizedBox(
                  width: 200,
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    children: _gridviewItems,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Fixed extend scrolling'),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: ListWheelScrollView(
                    controller: _scrollController,
                    physics: const FixedExtentScrollPhysics(),
                    useMagnifier: true,
                    magnification: 1.5,
                    diameterRatio: 0.75,
                    itemExtent: 25,
                    children: _gridviewItems,
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
      bottomNavigationBar: Chapter14BottomNavigationBar(
          currentSelectedIndex: 5, context: context),
    );
  }
}
