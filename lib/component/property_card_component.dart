import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ghar_ka_sathi/controller/favorite_controller.dart';
import 'package:ghar_ka_sathi/model/rent_property_model.dart';
import 'package:ghar_ka_sathi/view/real_eastate/property_detail_page.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/constant.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:shimmer/shimmer.dart';

class PropertyCard extends StatefulWidget {
  final String title;
  final String details;
  final String price;
  final String location;
  final List<String> images;
  final String type;
  final Color typeColor;
  final VoidCallback? onTap;
  final PropertyRentResource? allPropertyList;

  const PropertyCard({
    super.key,
    required this.title,
    required this.details,
    required this.price,
    required this.location,
    required this.images,
    required this.type,
    required this.typeColor,
    this.allPropertyList,
    this.onTap,
  });

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard>
    with SingleTickerProviderStateMixin {
  final FavoriteController favoriteController = Get.find<FavoriteController>();
  int _currentImageIndex = 0;
  late PageController _pageController;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start the auto-scroll timer after widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startAutoScroll();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    _autoScrollTimer?.cancel();
    super.dispose();
  }

  void startAutoScroll() {
    // Cancel any existing timer
    _autoScrollTimer?.cancel();

    // Only start auto-scroll if we have more than one image
    if (widget.images.length > 1) {
      _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }

        if (_pageController.hasClients) {
          final nextIndex = (_currentImageIndex + 1) % widget.images.length;
          _pageController.animateToPage(
            nextIndex,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  void pauseAutoScroll() {
    _autoScrollTimer?.cancel();
  }

  void resumeAutoScroll() {
    // Add a delay before resuming auto-scroll
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        startAutoScroll();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTapDown: (_) {
              _animationController.forward();
              setState(() => _isPressed = true);
            },
            onTapUp: (_) {
              _animationController.reverse();
              setState(() => _isPressed = false);
              if (widget.onTap != null) {
                widget.onTap!();
              } else {
                Get.to(() => PropertyDetailPage(
                  property: widget.allPropertyList,
                ));
              }
            },
            onTapCancel: () {
              _animationController.reverse();
              setState(() => _isPressed = false);
            },
            child: Container(
              // width: 220,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    offset: const Offset(0, 5),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    offset: const Offset(0, 2),
                    blurRadius: 5,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageSection(),
                  _buildContentSection(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageSection() {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Stack(
        children: [
          // Image slider
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Listener(
              onPointerDown: (_) => pauseAutoScroll(),
              onPointerUp: (_) => resumeAutoScroll(),
              onPointerCancel: (_) => resumeAutoScroll(),
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.images.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentImageIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Hero(
                    tag: 'property_image_${widget.allPropertyList?.id}_$index',
                    child: CachedNetworkImage(
                      imageUrl: widget.images[index],
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 150,
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        height: 150,
                        color: Colors.grey[100],
                        child: Center(
                          child: Icon(
                            Icons.image_not_supported_rounded,
                            color: Colors.grey[400],
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Gradient overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.btnDarkRed.withOpacity(0.3),
                  ],
                  stops: const [0.7, 1.0],
                ),
              ),
            ),
          ),

          // Property type badge
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: AppColors.greenGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                widget.type,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),

          // Favorite button
          Positioned(
            top: 12,
            right: 12,
            child: Obx(() {
              bool isFavorite = widget.allPropertyList != null &&
                  favoriteController
                      .isPropertyFavorite(widget.allPropertyList!.id);

              return GestureDetector(
                onTap: () {
                  if (getStringAsync(emailMobile).isEmpty) {
                    toast('Please login to add to favorites');
                    return;
                  }

                  if (widget.allPropertyList != null) {
                    favoriteController.toggleFavorite(
                      context,
                      widget.allPropertyList!.id,
                    );
                  }
                },
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.8, end: isFavorite ? 1.0 : 0.8),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.elasticOut,
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          isFavorite
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: isFavorite
                              ? AppColors.btnDarkRed
                              : AppColors.secondaryBtnLigRed,
                          size: 18,
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),

          // Image indicators
          if (widget.images.length > 1)
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.images.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: _currentImageIndex == index ? 16 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: _currentImageIndex == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                      boxShadow: _currentImageIndex == index
                          ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ]
                          : null,
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContentSection() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.3,
              height: 1.2,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 8),

          // Price with currency symbol
          Row(
            children: [
              const Text(
                "₹",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.btnDarkRed, // Price color
                ),
              ),
              const SizedBox(width: 2),
              Text(
                widget.price,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.btnDarkRed,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Location with icon
          Row(
            children: [
              const Icon(
                Icons.location_on_rounded,
                size: 14,
                color: AppColors.headerColor,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  widget.location,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Property features/amenities
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.info_outline_rounded,
                  size: 14,
                  color: AppColors.appBarColor,
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    widget.details,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}