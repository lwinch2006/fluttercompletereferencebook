import 'package:chapter15/extensions/build_context_extensions.dart';
import 'package:chapter15/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Chapter15BottomNavigationBar extends BottomNavigationBar {
  Chapter15BottomNavigationBar(
      {super.key,
      required int currentSelectedIndex,
      required BuildContext context})
      : super(
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.grey,
              icon: const Icon(Icons.home),
              label: context.l10n.home,
              // label: context.customL10n.home,
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.grey,
              icon: const Icon(Icons.article),
              label: '${context.l10n.page} 1',
              // label: '${context.customL10n.page} 1',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.article),
              label: '${context.l10n.page} 2',
              // label: '${context.customL10n.page} 2',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.article),
              label: '${context.l10n.page} 3',
              // label: '${context.customL10n.page} 3',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.article),
              label: '${context.l10n.page} 4',
              // label: '${context.customL10n.page} 4',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.article),
              label: '${context.l10n.page} 5',
              // label: '${context.customL10n.page} 5',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.article),
              label: '${context.l10n.page} 6',
              // label: '${context.customL10n.page} 6',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.article),
              label: '${context.l10n.page} 7',
              // label: '${context.customL10n.page} 7',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.article),
              label: '${context.l10n.page} 8',
              // label: '${context.customL10n.page} 8',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.article),
              label: '${context.l10n.page} 9',
              // label: '${context.customL10n.page} 9',
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
