// Base Service Screen Template
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/view/in_home_services/cleaning_details_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/service_bottom_sheet_components.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class BaseServiceScreen extends StatefulWidget {
  final String title;
  final String? serviceType;
  final List<Map<String, dynamic>> services;
  final List<String>? serviceTypeList;
  final List<String>? serviceSubTypeList;

  const BaseServiceScreen({
    Key? key,
    required this.title,
    this.serviceType,
    required this.services,
    this.serviceTypeList,
    this.serviceSubTypeList,
  }) : super(key: key);

  @override
  State<BaseServiceScreen> createState() => _BaseServiceScreenState();
}

class _BaseServiceScreenState extends State<BaseServiceScreen> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  // Track the currently selected service category index
  int _selectedServiceIndex = -1;
  // Store service section positions for accurate scrolling
  final Map<int, double> _sectionPositions = {};
  // Map of scroll targets that include references to section headers
  final Map<int, GlobalKey> _sectionKeys = {};
  // Animation controller for scroll indicator
  late AnimationController _animationController;
  // Flag to track if scroll animation is in progress
  bool _isScrolling = false;
  // Initialize cart controller
  final CartController cartController = Get.put(CartController());


  @override
  void initState() {
    super.initState();

    // Initialize the animation controller for scroll effects
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Initialize global keys for each section
    for (int i = 0; i < widget.services.length; i++) {
      _sectionKeys[i] = GlobalKey();
    }

    // Add scroll listener to update selected index based on scroll position
    _scrollController.addListener(_onScroll);

    // Initialize section positions after the first frame renders
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateSectionPositions();
    });
  }

  void _onScroll() {
    // Only update the selected index if not currently animating to prevent feedback loops
    if (!_isScrolling) {
      // Find the section that's most visible in the viewport
      double currentOffset = _scrollController.offset;
      int? closestSectionIndex;
      double closestDistance = double.infinity;

      _sectionPositions.forEach((index, position) {
        double distance = (position - currentOffset).abs();
        if (distance < closestDistance) {
          closestDistance = distance;
          closestSectionIndex = index;
        }
      });

      // Update the selected index if we found a section and it's different from the current one
      if (closestSectionIndex != null && closestSectionIndex != _selectedServiceIndex) {
        setState(() {
          _selectedServiceIndex = closestSectionIndex!;
        });
      }
    }
  }

  void _calculateSectionPositions() {
    if (!mounted) return;

    // Add a tiny delay to ensure the UI has fully rendered
    Future.microtask(() {
      setState(() {
        _sectionPositions.clear();

        for (int i = 0; i < widget.services.length; i++) {
          if (_sectionKeys.containsKey(i)) {
            final RenderBox? renderBox = _sectionKeys[i]?.currentContext?.findRenderObject() as RenderBox?;

            if (renderBox != null) {
              // Get the global position and convert to offset relative to the scroll view
              final position = renderBox.localToGlobal(Offset.zero);
              // Adjust for top padding and app bar
              final scrollPosition = position.dy - kToolbarHeight - MediaQuery.of(context).padding.top;
              // Store adjusted position
              _sectionPositions[i] = scrollPosition;
            }
          }
        }
      });
    });
  }

  void _scrollToIndex(int index) {
    // Safety check for valid index and mounting
    if (index < 0 || index >= widget.services.length || !mounted) return;

    // Set flag to prevent scroll listener updates during animation
    _isScrolling = true;

    // Update the selected index
    setState(() {
      _selectedServiceIndex = index;
    });

    // Use a single post-frame callback for all UI updates
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Get the target section key
      final sectionKey = _sectionKeys[index];
      if (sectionKey?.currentContext != null) {
        final RenderBox renderBox = sectionKey!.currentContext!.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);

        // Calculate the target scroll offset
        final targetOffset = position.dy -
            kToolbarHeight -
            MediaQuery.of(context).padding.top -
            10.0;

        // Reset animation controller and clear listeners
        _animationController.reset();
        _animationController.clearListeners();

        // Set up animation
        final startOffset = _scrollController.offset;
        final distanceToScroll = targetOffset - startOffset;

        // Create curved animation
        final Animation<double> scrollAnimation = CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeInOutCubic,
        );

        // Add scroll animation listener
        _animationController.addListener(() {
          if (_scrollController.hasClients) {
            final double currentPosition = startOffset +
                (distanceToScroll * scrollAnimation.value);
            _scrollController.jumpTo(currentPosition);
          }
        });

        // Handle animation completion
        _animationController.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            Future.delayed(Duration(milliseconds: 100), () {
              if (mounted) {
                _isScrolling = false;
                _showSectionIndicator(index);
              }
            });
          }
        });

        // Start the animation
        _animationController.forward();
      } else {
        // If context isn't ready, try again after a short delay
        Future.delayed(Duration(milliseconds: 50), () {
          if (mounted) {
            _isScrolling = false;
            _scrollToIndex(index);
          }
        });
      }
    });
  }

  void _showSectionIndicator(int index) {
    // Show a subtle highlight effect to indicate which section is selected
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle_outline, color: Colors.white),
            SizedBox(width: 8),
            Text('${widget.services[index]['category']}'),
          ],
        ),
        duration: Duration(milliseconds: 800),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.appBarColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      ),
    );
  }

  void _showCategoryGridBottomSheet() {
    // Capture the necessary context values before any async operations
    final double screenHeight = MediaQuery.of(context).size.height;
    final double topPadding = MediaQuery.of(context).padding.top;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (bottomSheetContext) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Draggable indicator
            Container(
              height: 4,
              width: 40,
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                "Service Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: screenHeight * 0.4, // Using captured value
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.7,
                ),
                itemCount: widget.services.length,
                itemBuilder: (context, index) {
                  final service = widget.services[index];
                  final bool isSelected = _selectedServiceIndex == index;

                  return GestureDetector(
                    onTap: () {
                      // Capture the index we want to scroll to
                      final int targetIndex = index;

                      // First, close the bottom sheet
                      Navigator.pop(bottomSheetContext);

                      // Simple scrolling approach with delay
                      Future.delayed(Duration(milliseconds: 300), () {
                        if (!mounted) return;

                        setState(() {
                          _selectedServiceIndex = targetIndex;
                          _isScrolling = true;
                        });

                        // Now try to scroll directly to the section
                        _directScrollToSection(targetIndex, topPadding);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: isSelected ? AppColors.appBarColor.withOpacity(0.05) : Colors.transparent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: isSelected ? AppColors.appBarColor : AppColors.grey
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                                  color: isSelected
                                      ? AppColors.appBarColor.withOpacity(0.2)
                                      : Colors.black.withOpacity(0.1),
                                  blurRadius: isSelected ? 6 : 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                service['imagePath'],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[200],
                                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 80,
                            child: Text(
                              service['category'],
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                color: isSelected ? AppColors.appBarColor : Colors.black,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _directScrollToSection(int index, double topPadding) {
    if (!mounted || !_scrollController.hasClients) {
      _isScrolling = false;
      return;
    }

    // Simple approach: Calculate section positions manually
    // First, let's try direct scrolling to a known section position
    if (_sectionPositions.containsKey(index) && _sectionPositions[index] != null) {
      // Jump directly to the calculated position
      final double position = _sectionPositions[index]!;
      // Adjust to ensure it's at the top of the screen (accounting for app bar)
      final double adjustedPosition = position > 0 ? position : 0;

      _scrollController.jumpTo(adjustedPosition);

      // Show feedback and re-enable scrolling
      Future.delayed(Duration(milliseconds: 100), () {
        if (mounted) {
          _showSectionIndicator(index);
          _isScrolling = false;
        }
      });
      return;
    }

    // If positions aren't calculated or available, try to use keys
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        _isScrolling = false;
        return;
      }

      // Recalculate positions first
      _calculateSectionPositions();

      // Try to scroll one more time using updated positions
      Future.delayed(Duration(milliseconds: 50), () {
        if (!mounted || !_scrollController.hasClients) {
          _isScrolling = false;
          return;
        }

        if (_sectionPositions.containsKey(index)) {
          final double position = _sectionPositions[index]!;
          final double adjustedPosition = position > 0 ? position : 0;

          _scrollController.jumpTo(adjustedPosition);
        }

        // Either way, re-enable scrolling and show indicator
        Future.delayed(Duration(milliseconds: 100), () {
          if (mounted) {
            _isScrolling = false;
            _showSectionIndicator(index);
          }
        });
      });
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: AppColors.white, fontSize: 18),
        ),
        backgroundColor: AppColors.appBarColor,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: AppColors.white,
          onPressed: () {
            // Simply pop this screen without any other navigation
            Navigator.of(context).pop();
          },
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        // Scroll notification listener...
        child: ListView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          children: [
            GridViewSection(
              services: widget.services,
              onServiceTap: (index) {
                _scrollToIndex(index);
              },
              selectedIndex: _selectedServiceIndex,
            ),
            const SizedBox(height: 1),
            ServiceListSection(
              services: widget.services,
              serviceType: widget.serviceType ?? '',
              // Pass empty lists instead of hardcoded lists - will be replaced by dynamic values
              serviceTypeList: const [],
              serviceSubTypeList: const [],
              selectedIndex: _selectedServiceIndex,
              sectionKeys: _sectionKeys,
              cartController: cartController, // Pass the cart controller

              // We'll use the dynamic options from the service data
              useDynamicOptions: true,
            ),
          ],
        ),
      ),
      floatingActionButton: TweenAnimationBuilder<double>(
        // Add animation to FAB for better integration
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 500),
        curve: Curves.elasticOut,
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: FloatingActionButton(
              onPressed: _showCategoryGridBottomSheet,
              backgroundColor: AppColors.appBarColor,
              child: Icon(
                Icons.grid_view_rounded,
                color: Colors.white,
              ),
              tooltip: "Browse categories",
              elevation: 4,
            ),
          );
        },
      ),
    );
  }
}