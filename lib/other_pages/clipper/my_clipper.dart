import 'package:flutter/material.dart';

class MyClipperwidget extends StatelessWidget {
  const MyClipperwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.bottomRight,
          color: Colors.amber.shade100,
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width - 50,
          child: ClipPath(
            clipper: DiagonalPathClipperTwo(),
            child: Container(
              height: 40,
              width: 100,
              color: Colors.blue.shade900,
            ),
          ),
        ),
      ),
    );
  }
}

class DiagonalPathClipperTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height / 2)
      ..lineTo(size.width / 7, 0.0)
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width / 7, size.height)
      ..lineTo(0.0, size.height / 2)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
