// lib/widgets/confetti_animation.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class ConfettiAnimation extends StatefulWidget {
  final bool isPlaying;
  final Widget child;

  const ConfettiAnimation({
    Key? key,
    required this.isPlaying,
    required this.child,
  }) : super(key: key);

  @override
  _ConfettiAnimationState createState() => _ConfettiAnimationState();
}

class _ConfettiAnimationState extends State<ConfettiAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<ConfettiPiece> _confettiPieces = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    // Create confetti pieces
    for (int i = 0; i < 100; i++) {
      _confettiPieces.add(ConfettiPiece(random: _random));
    }

    if (widget.isPlaying) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(ConfettiAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPlaying && !oldWidget.isPlaying) {
      _controller.reset();
      _controller.forward();
    } else if (!widget.isPlaying && oldWidget.isPlaying) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.isPlaying)
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return CustomPaint(
                painter: ConfettiPainter(
                  animation: _controller,
                  confettiPieces: _confettiPieces,
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                ),
              );
            },
          ),
        widget.child,
      ],
    );
  }
}

class ConfettiPiece {
  late double x;
  late double y;
  late double size;
  late Color color;
  late double angle;
  late double speed;
  late double rotationSpeed;

  ConfettiPiece({required Random random}) {
    reset(random);
  }

  void reset(Random random) {
    x = random.nextDouble() * 400;
    y = -50 - random.nextDouble() * 300; // Start above the screen
    size = 5 + random.nextDouble() * 10;
    angle = random.nextDouble() * pi * 2;
    speed = 2 + random.nextDouble() * 3;
    rotationSpeed = (random.nextDouble() - 0.5) * 0.1;

    // Random colors for confetti
    List<Color> colors = [
      AppColors.appBarColor,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.pink,
    ];
    color = colors[random.nextInt(colors.length)];
  }

  void update(double progress, Random random, Size size) {
    y += speed;
    angle += rotationSpeed;

    // Add a slight horizontal drift
    x += (random.nextDouble() - 0.5) * 1.5;

    // Reset if it's gone off screen
    if (y > size.height || x < 0 || x > size.width) {
      reset(random);
    }
  }
}

class ConfettiPainter extends CustomPainter {
  final Animation<double> animation;
  final List<ConfettiPiece> confettiPieces;
  final Random _random = Random();

  ConfettiPainter({
    required this.animation,
    required this.confettiPieces,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final progress = animation.value;

    for (var piece in confettiPieces) {
      piece.update(progress, _random, size);

      canvas.save();
      canvas.translate(piece.x, piece.y);
      canvas.rotate(piece.angle);

      // Draw confetti piece
      final paint = Paint()..color = piece.color;
      canvas.drawRect(
        Rect.fromCenter(
          center: Offset.zero,
          width: piece.size,
          height: piece.size * 2.5,
        ),
        paint,
      );

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(ConfettiPainter oldDelegate) => true;
}