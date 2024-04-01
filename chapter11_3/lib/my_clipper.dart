import 'package:flutter/cupertino.dart';

class MyClipper extends CustomClipper<Rect> {

  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(0, 0, 50, 50);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }

}