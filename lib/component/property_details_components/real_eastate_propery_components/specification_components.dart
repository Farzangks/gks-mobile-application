import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Enhanced Technical Specifications Item
class SpecificationItem extends StatefulWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color bgColor;
  final Color primaryColor;
  final int animationIndex;

  const SpecificationItem({
    Key? key,
    required this.label,
    required this.value,
    required this.icon,
    required this.bgColor,
    this.primaryColor = const Color(0xFFB9121A),
    this.animationIndex = 0,
  }) : super(key: key);

  @override
  State<SpecificationItem> createState() => _SpecificationItemState();
}

class _SpecificationItemState extends State<SpecificationItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _slideAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _slideAnimation = Tween<double>(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutQuint,
      ),
    );

    // Delay animation based on index for staggered effect
    Future.delayed(Duration(milliseconds: 100 * widget.animationIndex), () {
      if (mounted) {
        _controller.forward();
      }
    });
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
          child: Transform.translate(
            offset: Offset(_slideAnimation.value, 0),
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(_isHovered ? 0.15 : 0.1),
                      spreadRadius: _isHovered ? 2 : 1,
                      blurRadius: _isHovered ? 8 : 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: widget.bgColor.withOpacity(_isHovered ? 0.5 : 0.3),
                    width: _isHovered ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: widget.bgColor.withOpacity(_isHovered ? 0.3 : 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        widget.icon,
                        color: widget.primaryColor,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.label,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey[600],
                              fontWeight: _isHovered ? FontWeight.w500 : FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.value,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: _isHovered ? widget.primaryColor : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Enhanced Technical Specifications Section
class SpecificationsSection extends StatelessWidget {
  final List<Map<String, dynamic>> specifications;
  final VoidCallback onViewAll;
  final Color primaryColor;
  final Color secondaryColor;
  final int initialDisplayCount;

  const SpecificationsSection({
    Key? key,
    required this.specifications,
    required this.onViewAll,
    this.primaryColor = const Color(0xFFB9121A),
    this.secondaryColor = const Color(0xFFF2E6E6),
    this.initialDisplayCount = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define colors for specification backgrounds
    final bgColors = [
      Colors.indigo[100]!,
      Colors.pink[100]!,
      Colors.teal[100]!,
      Colors.amber[100]!,
      Colors.deepPurple[100]!,
      Colors.lime[100]!,
    ];

    // Define icons if not provided
    final defaultIcons = [
      Icons.now_wallpaper_outlined,
      Icons.grid_4x4,
      Icons.grid_on,
      Icons.view_column_outlined,
      Icons.power_outlined,
      Icons.height_outlined,
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.build,
                  color: primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Technical Specifications',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Specifications
          ...List.generate(
            specifications.length > initialDisplayCount ? initialDisplayCount : specifications.length,
                (index) {
              final spec = specifications[index];
              return SpecificationItem(
                label: spec['label'] ?? 'Specification',
                value: spec['value'] ?? '-',
                icon: spec['icon'] ?? defaultIcons[index % defaultIcons.length],
                bgColor: spec['bgColor'] ?? bgColors[index % bgColors.length],
                primaryColor: primaryColor,
                animationIndex: index,
              );
            },
          ),

          // View All Button
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 16),
            child: OutlinedButton(
              onPressed: () {
                HapticFeedback.mediumImpact();
                onViewAll();
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                side: BorderSide(color: primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'View All Specifications',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    size: 18,
                    color: primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Enhanced Nearby Places Category Selector
class NearbyCategorySelector extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onCategorySelected;
  final List<IconData> icons;
  final Color primaryColor;
  final Color secondaryColor;

  const NearbyCategorySelector({
    Key? key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.icons,
    this.primaryColor = const Color(0xFFB9121A),
    this.secondaryColor = const Color(0xFFF2E6E6),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategory == category;
          final icon = index < icons.length ? icons[index] : Icons.place;

          return GestureDetector(
            onTap: () {
              onCategorySelected(category);
              HapticFeedback.lightImpact();
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 100,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: isSelected ? primaryColor.withOpacity(0.1) : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected ? primaryColor : Colors.grey[300]!,
                  width: isSelected ? 2 : 1,
                ),
                boxShadow: isSelected ? [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ] : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isSelected ? primaryColor.withOpacity(0.2) : secondaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      color: isSelected ? primaryColor : Colors.grey[600],
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    category,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? primaryColor : Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Enhanced Nearby Place Item
class NearbyPlaceItem extends StatefulWidget {
  final String name;
  final String type;
  final String distance;
  final IconData icon;
  final Color primaryColor;
  final Color secondaryColor;
  final int animationIndex;

  const NearbyPlaceItem({
    Key? key,
    required this.name,
    required this.type,
    required this.distance,
    required this.icon,
    this.primaryColor = const Color(0xFFB9121A),
    this.secondaryColor = const Color(0xFFF2E6E6),
    this.animationIndex = 0,
  }) : super(key: key);

  @override
  State<NearbyPlaceItem> createState() => _NearbyPlaceItemState();
}

class _NearbyPlaceItemState extends State<NearbyPlaceItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _slideAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    _slideAnimation = Tween<double>(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutQuint,
      ),
    );

    // Delay animation based on index for staggered effect
    Future.delayed(Duration(milliseconds: 100 * widget.animationIndex), () {
      if (mounted) {
        _controller.forward();
      }
    });
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
          child: Transform.translate(
            offset: Offset(_slideAnimation.value, 0),
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(_isHovered ? 0.15 : 0.1),
                      spreadRadius: _isHovered ? 2 : 1,
                      blurRadius: _isHovered ? 8 : 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: widget.primaryColor.withOpacity(_isHovered ? 0.3 : 0.1),
                    width: _isHovered ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: widget.secondaryColor.withOpacity(_isHovered ? 0.3 : 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        widget.icon,
                        color: widget.primaryColor,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: _isHovered ? widget.primaryColor : Colors.black87,
                            ),
                          ),
                          Text(
                            widget.type,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: widget.secondaryColor.withOpacity(_isHovered ? 0.3 : 0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: _isHovered ? Border.all(
                          color: widget.primaryColor.withOpacity(0.3),
                        ) : null,
                      ),
                      child: Text(
                        widget.distance,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: widget.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}