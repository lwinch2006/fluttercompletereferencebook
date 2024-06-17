import 'package:chapter18/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Chapter18BottomNavigationBar extends BottomNavigationBar {
  Chapter18BottomNavigationBar(
      {super.key,
      required int currentSelectedIndex,
      required BuildContext context})
      : super(
          items: [
            const BottomNavigationBarItem(
              backgroundColor: Colors.grey,
              icon: Icon(Icons.home),
              label: 'Home',
              // label: context.customL10n.home,
            ),
            const BottomNavigationBarItem(
              backgroundColor: Colors.grey,
              icon: Icon(Icons.article),
              label: 'Page 1',
              // label: '${context.customL10n.page} 1',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Page 2',
              // label: '${context.customL10n.page} 2',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.article),
              label: 'Page 3',
              // label: '${context.customL10n.page} 3',
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
