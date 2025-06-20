import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/globle_functions.dart';

class SplashScreen extends StatefulWidget {
  static String tag = '/SplashScreen';
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late Image logoImage;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _progressAnimation;
  late Animation<double> _pulseAnimation;

  // Total duration in seconds (sync with the timer)
  final int totalDuration = 4;

  // For particle animation
  final List<ParticleModel> particles = [];
  final Random random = Random();

  @override
  void initState() {
    super.initState();

    // Initialize animations
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: totalDuration),
    );

    // Logo animation - subtle scale up with bounce effect
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.2)
            .chain(CurveTween(curve: Curves.easeOutCubic)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.2, end: 1.0)
            .chain(CurveTween(curve: Curves.elasticOut)),
        weight: 70,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    // Opacity animation for logo - fade in
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
      ),
    );

    // Progress animation - starts after logo appears
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.3, 0.9, curve: Curves.easeInOut),
      ),
    );

    // Continuous pulse animation for glow effect
    _pulseAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.2)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.2, end: 1.0)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 50,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1.0, curve: Curves.linear),
      ),
    );

    // Generate particles for background
    _generateParticles();

    // Preload logo
    logoImage = Image.asset(
      'assets/gks/png_logo.png',
      width: 250,
      height: 150,
    );

    // Start animation
    _animationController.forward();

    // Set up navigation timer to match animation duration exactly
    Timer(
      Duration(seconds: totalDuration),
          () {
        GlobalFunction.disabledWalkThrough(context);
      },
    );
  }

  void _generateParticles() {
    // Create 30 particles with random properties
    for (int i = 0; i < 30; i++) {
      particles.add(ParticleModel(
        random: random,
        screenWidth: 1.0, // Will be updated in build
        screenHeight: 1.0, // Will be updated in build
      ));
    }
  }

  @override
  void didChangeDependencies() {
    precacheImage(logoImage.image, context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // Update particle dimensions
    for (var particle in particles) {
      particle.screenWidth = width;
      particle.screenHeight = height;
    }

    return Scaffold(
      backgroundColor: AppColors.appBarColor,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          // Update particles position based on animation progress
          for (var particle in particles) {
            particle.update(_animationController.value);
          }

          return Stack(
            children: [
              // Background gradient
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.appBarColor,
                      Color.lerp(AppColors.appBarColor, Colors.black, 0.4) ?? AppColors.appBarColor,
                    ],
                  ),
                ),
              ),

              // Particles
              CustomPaint(
                size: Size(width, height),
                painter: ParticlePainter(
                  particles: particles,
                  progress: _progressAnimation.value,
                ),
              ),

              // Main content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo with pulsing effect
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Pulsing glow behind logo
                        AnimatedOpacity(
                          opacity: _opacityAnimation.value * 0.7,
                          duration: Duration(milliseconds: 300),
                          child: Transform.scale(
                            scale: _pulseAnimation.value,
                            child: Container(
                              width: 220,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.3),
                                    blurRadius: 30,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Logo
                        Opacity(
                          opacity: _opacityAnimation.value,
                          child: Transform.scale(
                            scale: _scaleAnimation.value,
                            child: logoImage,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.06),

                    // Progress indicator with animated fill
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.3),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              // Glow effect for progress bar
                              AnimatedOpacity(
                                opacity: _progressAnimation.value > 0.1 ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 300),
                                child: Container(
                                  height: 8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.6),
                                        blurRadius: 15 * _progressAnimation.value,
                                        spreadRadius: 2 * _progressAnimation.value,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Progress indicator
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: _progressAnimation.value,
                                    backgroundColor: Colors.white.withOpacity(0.2),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white.withOpacity(0.9),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Animated dots
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              3,
                                  (index) {
                                // Sequentially appear dots
                                double dotProgress = (_progressAnimation.value * 3 - index).clamp(0.0, 1.0);
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  height: 5,
                                  width: 5,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(dotProgress),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.5 * dotProgress),
                                        blurRadius: 4,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Tagline with typewriter effect
                    SizedBox(height: 30),
                    ClipRect(
                      child: AnimatedOpacity(
                        opacity: _progressAnimation.value > 0.5 ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: SizedBox(
                          height: 20,
                          child: Text(
                            _getProgressText(),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Text that appears to be typing based on animation progress
  String _getProgressText() {
    final String fullText = "Finding Your Perfect Home...";
    if (_progressAnimation.value < 0.6) return "";

    final textProgress = ((_progressAnimation.value - 0.6) / 0.3).clamp(0.0, 1.0);
    final visibleLength = (fullText.length * textProgress).floor();
    return fullText.substring(0, visibleLength);
  }
}

// Particle model for floating particles
class ParticleModel {
  late double x;
  late double y;
  late double size;
  late double speed;
  late double opacity;
  late double direction;
  double screenWidth;
  double screenHeight;
  final Random random;

  ParticleModel({
    required this.random,
    required this.screenWidth,
    required this.screenHeight,
  }) {
    reset(0);
  }

  void reset(double progress) {
    x = random.nextDouble() * screenWidth;
    y = random.nextDouble() * screenHeight;
    size = 2 + random.nextDouble() * 4;
    speed = 20 + random.nextDouble() * 40;
    opacity = 0.1 + random.nextDouble() * 0.4;
    direction = random.nextDouble() * 2 * pi;
  }

  void update(double progress) {
    // Move particles
    y += cos(direction) * speed * 0.02;
    x += sin(direction) * speed * 0.02;

    // Reset if out of bounds
    if (x < 0 || x > screenWidth || y < 0 || y > screenHeight) {
      reset(progress);
    }

    // Make particles fade in based on overall progress
    opacity = (0.1 + random.nextDouble() * 0.4) * min(1.0, progress * 3);
  }
}

// Custom painter for particle effect
class ParticlePainter extends CustomPainter {
  final List<ParticleModel> particles;
  final double progress;

  ParticlePainter({required this.particles, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      final paint = Paint()
        ..color = Colors.white.withOpacity(particle.opacity * progress)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(particle.x, particle.y),
        particle.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}