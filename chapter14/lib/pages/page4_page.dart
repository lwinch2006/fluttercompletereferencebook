import 'dart:io';
import 'package:chapter14/components/chapter14_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Page4 extends StatefulWidget {
  final String title;

  const Page4({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  final _container = Container(
    color: Colors.grey,
    width: 50,
    height: 50,
    margin: const EdgeInsets.all(5),
  );

  final _reorderableList = List<int>.generate(20, (index) => index+1);

  final scrollController1 = ScrollController();
  final scrollController2 = ScrollController();

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
  }

  @override
  void dispose() {
    scrollController1.dispose();
    super.dispose();
  }

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
          FilledButton(
              onPressed: () {
                scrollController1.animateTo(scrollController1.offset + 100,
                    duration: const Duration(seconds: 1), curve: Curves.ease);
              },
              child: const Text('Click to scroll')),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 100,
            child: ListView.builder(
              controller: scrollController1,
              scrollDirection: Axis.vertical,
              itemExtent: 20,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Text('Item $index');
              },
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 100,
            child: Scrollbar(
              controller: scrollController2,
              // this is mandatory to avoid error
              thumbVisibility: true,
              thickness: 4,
              trackVisibility: false,
              radius: const Radius.circular(0),
              child: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollStartNotification) {
                    debugPrint('User started scrolling');
                  }

                  if (notification is ScrollUpdateNotification) {
                    final position = notification.metrics.pixels;
                    final isAtEdge = notification.metrics.atEdge;
                    final scrollDistance = notification.scrollDelta;

                    var info = 'User is scrolling ${Platform.lineTerminator}'
                        '* Position: $position${Platform.lineTerminator}'
                        '* Is at edge: $isAtEdge${Platform.lineTerminator}'
                        '* Scroll distance: $scrollDistance${Platform.lineTerminator}';

                    debugPrint(info);
                  }

                  if (notification is ScrollEndNotification) {
                    debugPrint('User stopped scrolling');
                  }

                  return true;
                },
                child: RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: ListView.separated(
                    controller: scrollController2,
                    // this is mandatory to avoid error
                    scrollDirection: Axis.vertical,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Text('Item $index');
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            height: 160,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _container,
                  _container,
                  _container,
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 100,
            child: ReorderableListView.builder(
              itemCount: _reorderableList.length,
              itemBuilder: (context, index) {
                return Text('Item ${_reorderableList[index]}', key: Key('${_reorderableList[index]}'),);
              },
              onReorder: (oldIndex, newIndex) {
                debugPrint('Old index: $oldIndex, New index: $newIndex');

                if (oldIndex < newIndex) {
                  newIndex--;
                }

                // Very clean readable implementation
                final item = _reorderableList.removeAt(oldIndex);
                _reorderableList.insert(newIndex, item);

                // Very not readable implementation
                // if (newIndex < oldIndex) {
                //   var value = _reorderableList[oldIndex];
                //   for (var i = oldIndex; i > newIndex; i--) {
                //     _reorderableList[i] = _reorderableList[i-1];
                //   }
                //   _reorderableList[newIndex] = value;
                // } else {
                //   var value = _reorderableList[oldIndex];
                //   for (var i = oldIndex; i < newIndex-1; i++) {
                //     _reorderableList[i] = _reorderableList[i+1];
                //   }
                //   _reorderableList[newIndex-1] = value;
                // }
              },
            ),
          ),
        ],
      )),
      bottomNavigationBar: Chapter14BottomNavigationBar(
          currentSelectedIndex: 4, context: context),
    );
  }
}
