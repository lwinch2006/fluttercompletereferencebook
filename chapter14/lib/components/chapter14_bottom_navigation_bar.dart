import 'package:chapter14/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Chapter14BottomNavigationBar extends BottomNavigationBar {
  Chapter14BottomNavigationBar(
      {super.key,
      required int currentSelectedIndex,
      required BuildContext context})
      : super(
          items: [
            const BottomNavigationBarItem(
              backgroundColor: Colors.grey,
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              backgroundColor: Colors.grey,
              icon: Icon(Icons.article),
              label: 'Page 1',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Page 2',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Page 3',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Page 4',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Page 5',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Page 6',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Page 7',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Page 8',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Page 9',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.amber[800],
          currentIndex: currentSelectedIndex,
          onTap: (int selectedIndex) {
            if (selectedIndex == currentSelectedIndex) {
              return;
            }

            if (selectedIndex == 0) {
              context.push(homePagePath);
              return;
            }

            final pagePath = '/page$selectedIndex';
            context.push(pagePath);
          },
        );
}
