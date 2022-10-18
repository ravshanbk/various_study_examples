

import 'package:flutter/material.dart';

class ClipOvalExample extends StatelessWidget {
  const ClipOvalExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: ClipOval(
      // clipper: CustomClip(),
      child: Container(
        alignment: Alignment.center,
        height: 120,
        width: 120,
        color: Colors.cyan,
        child: Container(
          color: Colors.amber,
          width: 80,
          height: 80,
          transform: Matrix4.translationValues(
              40, -0, 60)
            ..rotateZ(45 * 3.1415927 / 180),
        ),
      ),
      // ),
    );
  }
}

class CustomClip extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width - 70, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
