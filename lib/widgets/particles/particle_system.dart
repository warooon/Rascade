import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rascade/widgets/particles/particle.dart';

class ParticleSystem extends StatefulWidget {
  @override
  _ParticleSystemState createState() => _ParticleSystemState();
}

class _ParticleSystemState extends State<ParticleSystem> {
  List<Particle> particles = [];
  final double width = 400;
  final double height = 800; 
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    generateParticles();
  }

  void generateParticles() {
    for (int i = 0; i < 150; i++) {
      particles.add(Particle(
        position: Offset(random.nextDouble() * width, random.nextDouble() * height),
        size: random.nextDouble() * 2 + 1,
        color: Colors.white.withOpacity(random.nextDouble()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: ParticlePainter(particles),
      child: Container(),
    );
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (var particle in particles) {
      paint.color = particle.color;
      canvas.drawCircle(particle.position, particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
