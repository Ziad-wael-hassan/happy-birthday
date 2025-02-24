import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class CustomConfittiWIdget extends StatelessWidget {
  const CustomConfittiWIdget({super.key, required this.controllerCenterTop});

  final ConfettiController controllerCenterTop;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        confettiController: controllerCenterTop,
        blastDirection: pi / 2,
        particleDrag: 0.05,
        emissionFrequency: 0.05,
        numberOfParticles: 50,
        gravity: 0.05,
        shouldLoop: false,
        colors: const [Colors.green, Colors.blue, Colors.pink],
        strokeWidth: 1,
        strokeColor: Colors.white,
      ),
    );
  }
}
