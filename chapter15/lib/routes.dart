import 'package:chapter15/extensions/build_context_extensions.dart';
import 'package:chapter15/extensions/locale_extensions.dart';
import 'package:chapter15/pages/home_page.dart';
import 'package:chapter15/pages/page1_page.dart';
import 'package:chapter15/pages/page2_page.dart';
import 'package:chapter15/pages/page3_page.dart';
import 'package:chapter15/pages/page4_page.dart';
import 'package:chapter15/pages/page5_page.dart';
import 'package:chapter15/pages/page6_page.dart';
import 'package:chapter15/pages/page7_page.dart';
import 'package:chapter15/pages/page8_page.dart';
import 'package:chapter15/pages/page9_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const homePagePath = '/';
const page1Path = '/page1';
const page2Path = '/page2';
const page3Path = '/page3';
const page4Path = '/page4';
const page5Path = '/page5';
const page6Path = '/page6';
const page7Path = '/page7';
const page8Path = '/page8';
const page9Path = '/page9';

GoRouter generateRouter() {
  return GoRouter(
    initialLocation: homePagePath,
    routes: [
      GoRoute(
          path: homePagePath,
          builder: (context, state) {
            return HomePage(
                title:
                    '${context.l10n.localization} - ${Localizations.localeOf(context).getLocaleFullName(context)}');
            // '${context.customL10n.localization} - ${Localizations.localeOf(context).getLocaleFullName(context)}');
          }),
      GoRoute(
        path: page1Path,
        builder: (context, state) =>
            Page1(title: context.l10n.numberFormatters),
      ),
      GoRoute(
        path: page2Path,
        builder: (context, state) =>
            Page2(title: context.l10n.dateAndTimeFormatters),
      ),
      GoRoute(
        path: page3Path,
        builder: (context, state) => Page3(title: context.l10n.accessibility),
      ),
      GoRoute(
        path: page4Path,
        builder: (context, state) => Page4(title: context.l10n.deepDive),
      ),
      GoRoute(
        path: page5Path,
        builder: (context, state) => Page5(title: context.l10n.imagesAndFonts),
      ),
      GoRoute(
        path: page6Path,
        builder: (context, state) =>
            Page6(title: context.l10n.imagesInCustomPainter),
      ),
      GoRoute(
        path: page7Path,
        builder: (context, state) => const Page7(title: 'Animations'),
      ),
      GoRoute(
        path: page8Path,
        builder: (context, state) => const Page8(title: 'Animations'),
      ),
      GoRoute(
        path: page9Path,
        name: page9Path,
        builder: (context, state) =>
            const Page9(title: 'Scrolling and overlays'),
      ),
    ],
  );
}

GoRouter generateRouterWithCustomTransition() {
  return GoRouter(
    initialLocation: homePagePath,
    routes: [
      GoRoute(
        path: homePagePath,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: HomePage(
                title:
                    '${context.l10n.localization} - ${Localizations.localeOf(context).getLocaleFullName(context)}'),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // animation and secondaryAnimation used for entrance and leaving page
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: page1Path,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: Page1(title: context.l10n.numberFormatters),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // animation and secondaryAnimation used for entrance and leaving page
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: page2Path,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: Page2(title: context.l10n.dateAndTimeFormatters),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // animation and secondaryAnimation used for entrance and leaving page
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              });
        },
        builder: (context, state) =>
            Page2(title: context.l10n.dateAndTimeFormatters),
      ),
      GoRoute(
        path: page3Path,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: Page3(title: context.l10n.accessibility),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // animation and secondaryAnimation used for entrance and leaving page
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              });
        },
        builder: (context, state) => Page3(title: context.l10n.accessibility),
      ),
      GoRoute(
        path: page4Path,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: Page4(title: context.l10n.deepDive),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // animation and secondaryAnimation used for entrance and leaving page
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        path: page5Path,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: Page5(title: context.l10n.imagesAndFonts),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // animation and secondaryAnimation used for entrance and leaving page
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        path: page6Path,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: Page6(title: context.l10n.imagesInCustomPainter),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // animation and secondaryAnimation used for entrance and leaving page
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        path: page7Path,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: const Page7(title: 'Animations'),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // animation and secondaryAnimation used for entrance and leaving page
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        path: page8Path,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: const Page8(title: 'Animations'),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // animation and secondaryAnimation used for entrance and leaving page
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        path: page9Path,
        name: page9Path,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              child: const Page9(title: 'Scrolling and overlays'),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // animation and secondaryAnimation used for entrance and leaving page
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              });
        },
      ),
    ],
  );
}
