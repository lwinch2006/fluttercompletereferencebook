import 'package:flutter/material.dart';

class Chapter14DesktopAlwaysVisibleScrollbarBehaviour
    extends MaterialScrollBehavior {
  const Chapter14DesktopAlwaysVisibleScrollbarBehaviour();

  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    if (axisDirectionToAxis(details.direction) == Axis.horizontal) {
      return child;
    }

    switch (Theme.of(context).platform) {
      case TargetPlatform.windows:
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
        return Scrollbar(
            controller: details.controller,
            thumbVisibility: true,
            thickness: 4,
            trackVisibility: false,
            radius: const Radius.circular(0),
            child: child);

      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return child;
    }
  }
}
