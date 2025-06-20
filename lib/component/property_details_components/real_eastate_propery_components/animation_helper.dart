import 'package:flutter/material.dart';
import 'dart:ui';

/// Animation helpers for premium real estate app
class PremiumAnimations {
  /// Staggered animation for list items
  static Widget staggeredListItem({
    required Widget child,
    required int index,
    Duration? delay,
    Duration? duration,
    Curve curve = Curves.easeOutQuint,
    Offset? beginOffset,
  }) {
    final actualDelay = delay ?? Duration(milliseconds: 100 * index);
    final actualDuration = duration ?? const Duration(milliseconds: 600);
    final actualBeginOffset = beginOffset ?? const Offset(0.0, 50.0);

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: actualDuration,
      curve: curve,
      builder: (context, value, animatedChild) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(
              0,
              actualBeginOffset.dy * (1 - value),
            ),
            child: animatedChild,
          ),
        );
      },
      child: child,
    );
  }

  /// Pulse animation for highlighting elements
  static Widget pulseAnimation({
    required Widget child,
    Duration duration = const Duration(milliseconds: 1500),
    Curve curve = Curves.easeInOut,
    bool repeat = true,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.95, end: 1.05),
      duration: duration,
      curve: curve,
      builder: (context, value, animatedChild) {
        return Transform.scale(
          scale: value,
          child: animatedChild,
        );
      },
      child: child,
    );
  }

  /// Shimmer loading effect
  static Widget shimmerLoading({
    required Widget child,
    Color baseColor = const Color(0xFFE0E0E0),
    Color highlightColor = const Color(0xFFF5F5F5),
    Duration duration = const Duration(milliseconds: 1500),
  }) {
    return ShimmerEffect(
      baseColor: baseColor,
      highlightColor: highlightColor,
      duration: duration,
      child: child,
    );
  }

  /// Fade in image with blur
  static Widget fadeInBlurImage({
    required ImageProvider imageProvider,
    BoxFit fit = BoxFit.cover,
    Duration duration = const Duration(milliseconds: 800),
    Curve curve = Curves.easeOut,
  }) {
    return FadeInBlurImage(
      imageProvider: imageProvider,
      fit: fit,
      duration: duration,
      curve: curve,
    );
  }

  /// Animated page indicator
  static Widget pageIndicator({
    required int count,
    required int current,
    double size = 8.0,
    double spacing = 4.0,
    Color activeColor = Colors.blue,
    Color inactiveColor = Colors.grey,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        count,
            (index) => AnimatedContainer(
          duration: duration,
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: current == index ? activeColor : inactiveColor,
          ),
        ),
      ),
    );
  }

  /// Hero transition with fade
  static Widget fadeHero({
    required String tag,
    required Widget child,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return Hero(
      tag: tag,
      flightShuttleBuilder: (
          BuildContext flightContext,
          Animation<double> animation,
          HeroFlightDirection flightDirection,
          BuildContext fromHeroContext,
          BuildContext toHeroContext,
          ) {
        return AnimatedBuilder(
          animation: animation,
          child: child,
          builder: (context, child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          },
        );
      },
      child: child,
    );
  }
}

/// Shimmer effect implementation
class ShimmerEffect extends StatefulWidget {
  final Widget child;
  final Color baseColor;
  final Color highlightColor;
  final Duration duration;

  const ShimmerEffect({
    Key? key,
    required this.child,
    required this.baseColor,
    required this.highlightColor,
    required this.duration,
  }) : super(key: key);

  @override
  _ShimmerEffectState createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: const [0.0, 0.5, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: _SlidingGradientTransform(
                slidePercent: _animation.value,
              ),
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(
      bounds.width * slidePercent,
      0.0,
      0.0,
    );
  }
}

/// Fade in blur image implementation
class FadeInBlurImage extends StatefulWidget {
  final ImageProvider imageProvider;
  final BoxFit fit;
  final Duration duration;
  final Curve curve;

  const FadeInBlurImage({
    Key? key,
    required this.imageProvider,
    required this.fit,
    required this.duration,
    required this.curve,
  }) : super(key: key);

  @override
  _FadeInBlurImageState createState() => _FadeInBlurImageState();
}

class _FadeInBlurImageState extends State<FadeInBlurImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _blurAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _blurAnimation = Tween<double>(begin: 10.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );

    // Start animation when image is loaded
    _loadImage();
  }

  void _loadImage() {
    final ImageStream stream = widget.imageProvider.resolve(
      const ImageConfiguration(),
    );

    final listener = ImageStreamListener((_, __) {
      if (mounted) {
        _controller.forward();
      }
    });

    stream.addListener(listener);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: _blurAnimation.value,
              sigmaY: _blurAnimation.value,
            ),
            child: Image(
              image: widget.imageProvider,
              fit: widget.fit,
            ),
          ),
        );
      },
    );
  }
}

/// Animated button with hover effect
class AnimatedPressableButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color? color;
  final Color? hoverColor;
  final Color? splashColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double pressedScale;
  final Duration duration;

  const AnimatedPressableButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.color,
    this.hoverColor,
    this.splashColor,
    this.borderRadius,
    this.padding,
    this.pressedScale = 0.95,
    this.duration = const Duration(milliseconds: 150),
  }) : super(key: key);

  @override
  _AnimatedPressableButtonState createState() => _AnimatedPressableButtonState();
}

class _AnimatedPressableButtonState extends State<AnimatedPressableButton> {
  bool _isPressed = false;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: widget.duration,
          curve: Curves.easeOut,
          transform: Matrix4.identity()..scale(_isPressed ? widget.pressedScale : 1.0),
          decoration: BoxDecoration(
            color: _isHovered ? widget.hoverColor : widget.color,
            borderRadius: widget.borderRadius,
          ),
          padding: widget.padding,
          child: widget.child,
        ),
      ),
    );
  }
}

/// Animated FAB menu that expands to show more options
class AnimatedFabMenu extends StatefulWidget {
  final IconData mainIcon;
  final List<FabMenuItem> menuItems;
  final Color mainColor;
  final Color backgroundColor;
  final Duration duration;

  const AnimatedFabMenu({
    Key? key,
    required this.mainIcon,
    required this.menuItems,
    this.mainColor = Colors.blue,
    this.backgroundColor = Colors.white,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  @override
  _AnimatedFabMenuState createState() => _AnimatedFabMenuState();
}

class _AnimatedFabMenuState extends State<AnimatedFabMenu> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isOpen = !_isOpen;
      if (_isOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Menu items
        SizeTransition(
          sizeFactor: _expandAnimation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.menuItems.length, (index) {
              final menuItem = widget.menuItems[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ScaleTransition(
                  scale: CurvedAnimation(
                    parent: _expandAnimation,
                    curve: Interval(
                      0.0,
                      1.0 - index / widget.menuItems.length / 2.0,
                      curve: Curves.easeOut,
                    ),
                  ),
                  child: FloatingActionButton.small(
                    heroTag: "fabMenuItem$index",
                    backgroundColor: menuItem.backgroundColor ?? widget.backgroundColor,
                    foregroundColor: menuItem.iconColor ?? widget.mainColor,
                    onPressed: () {
                      _toggle();
                      menuItem.onTap();
                    },
                    child: Icon(menuItem.icon),
                  ),
                ),
              );
            }),
          ),
        ),

        // Space between menu items and main FAB
        SizedBox(height: _isOpen ? 8.0 : 0.0),

        // Main FAB
        FloatingActionButton(
          backgroundColor: widget.mainColor,
          foregroundColor: widget.backgroundColor,
          onPressed: _toggle,
          child: AnimatedRotation(
            duration: widget.duration,
            turns: _isOpen ? 0.125 : 0.0, // 45 degrees when open
            child: Icon(_isOpen ? Icons.close : widget.mainIcon),
          ),
        ),
      ],
    );
  }
}

class FabMenuItem {
  final IconData icon;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  FabMenuItem({
    required this.icon,
    required this.onTap,
    this.backgroundColor,
    this.iconColor,
  });
}

/// Scrolling parallax effect for images
class ParallaxImage extends StatelessWidget {
  final String imageUrl;
  final double parallaxFactor;
  final double aspectRatio;
  final BoxFit fit;

  const ParallaxImage({
    Key? key,
    required this.imageUrl,
    this.parallaxFactor = 0.3,
    this.aspectRatio = 16 / 9,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context)!,
        listItemContext: context,
        parallaxFactor: parallaxFactor,
      ),
      children: [
        AspectRatio(
          aspectRatio: aspectRatio,
          child: Image.network(
            imageUrl,
            fit: fit,
          ),
        ),
      ],
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final double parallaxFactor;

  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.parallaxFactor,
  }) : super(repaint: scrollable.position);

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
      height: constraints.maxHeight + (constraints.maxHeight * parallaxFactor * 2),
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Get the list item position
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
      listItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    // Calculate the percent position of the list item within the scrollable
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction = (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment based on the scroll percentage
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Calculate the image offset based on parallax factor and scroll position
    final imageOffset = Alignment.lerp(
      Alignment.topCenter,
      Alignment.bottomCenter,
      scrollFraction,
    )!;

    // Paint the child with the calculated offset
    context.paintChild(
      0,
      transform: Transform.translate(
        offset: Offset(
          0.0,
          -parallaxFactor * listItemBox.size.height * scrollFraction,
        ),
      ).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        parallaxFactor != oldDelegate.parallaxFactor;
  }
}

/// Staggered grid tile animation
class StaggeredGridTileAnimation extends StatelessWidget {
  final Widget child;
  final int columnIndex;
  final int rowIndex;
  final Duration? delay;
  final Duration? duration;

  const StaggeredGridTileAnimation({
    Key? key,
    required this.child,
    required this.columnIndex,
    required this.rowIndex,
    this.delay,
    this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = columnIndex + rowIndex * 2; // Assuming 2-column grid
    final calculatedDelay = delay ?? Duration(milliseconds: 100 * index);
    final calculatedDuration = duration ?? const Duration(milliseconds: 600);

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: calculatedDuration,
      curve: Curves.easeOutQuint,
      builder: (context, value, animatedChild) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(
              0,
              50 * (1 - value),
            ),
            child: animatedChild,
          ),
        );
      },
      child: child,
    );
  }
}