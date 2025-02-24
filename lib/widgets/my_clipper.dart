import 'dart:math';
import 'package:flutter/material.dart';

class WaveClipperTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);

    double waveHeight = 20;
    for (double i = 0; i < size.width; i++) {
      path.lineTo(
        i,
        waveHeight * sin(i / size.width * 2 * pi) + size.height / 2,
      );
    }

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
