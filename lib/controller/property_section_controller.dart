import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

// Create a controller for managing scrolling between sections
class PropertySectionController {
  // Controllers
  final ItemScrollController sectionScrollController = ItemScrollController();
  final ItemPositionsListener positionsListener = ItemPositionsListener.create();
  final ScrollController tabScrollController = ScrollController();

  // State
  final RxInt selectedTabIndex = 0.obs;
  final List<GlobalKey> sectionKeys = [];

  // Initialize for the given number of sections
  void initialize(int sectionCount) {
    sectionKeys.clear();
    for (int i = 0; i < sectionCount; i++) {
      sectionKeys.add(GlobalKey(debugLabel: 'section_key_$i'));
    }
  }

  // Smooth scroll to a section with perfect positioning
  void scrollToSection(int index, BuildContext context) {
    // Update the selected index
    selectedTabIndex.value = index;

    // Scroll the tab into view in the horizontal tab bar
    _scrollTabToCenter(index, context);

    // Scroll to the section with precise positioning
    if (sectionScrollController.isAttached) {
      try {
        // First scroll - get to approximate position
        sectionScrollController.scrollTo(
          index: index,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic,
          alignment: 0.0, // Position at top of viewport
        );

        // Second scroll - fine-tune position (accounts for tab height)
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!sectionScrollController.isAttached) return;

          sectionScrollController.scrollTo(
            index: index,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOut,
            alignment: 0.0,
          );
        });
      } catch (e) {
        debugPrint('Error scrolling to section: $e');
      }
    }
  }

  // Scroll tab to center in the tab bar
  void _scrollTabToCenter(int index, BuildContext context) {
    if (!tabScrollController.hasClients) return;

    // Find the tab by tag for consistent scrolling
    final key = GlobalKey(debugLabel: 'category_tab_$index');

    try {
      // If tab exists in the context, scroll to it
      final renderObject = key.currentContext?.findRenderObject();
      if (renderObject != null) {
        final RenderBox renderBox = renderObject as RenderBox;
        if (!renderBox.hasSize) return;

        final tabPosition = renderBox.localToGlobal(Offset.zero);
        final screenWidth = MediaQuery.of(context).size.width;
        final tabWidth = renderBox.size.width;

        final double scrollOffset = tabScrollController.offset +
            tabPosition.dx - (screenWidth / 2) + (tabWidth / 2);

        tabScrollController.animateTo(
          scrollOffset.clamp(0.0, tabScrollController.position.maxScrollExtent),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    } catch (e) {
      debugPrint('Error scrolling tab to center: $e');
    }
  }

  // Find which section is currently visible and update tabs
  void updateActiveTabFromScroll() {
    if (positionsListener.itemPositions.value.isEmpty) return;

    try {
      // Find the most visible item
      final visiblePositions = positionsListener.itemPositions.value
          .where((position) => position.itemTrailingEdge > 0 && position.itemLeadingEdge < 1);

      if (visiblePositions.isEmpty) return;

      final int firstVisibleItemIndex = visiblePositions
          .reduce((min, position) => position.itemLeadingEdge < min.itemLeadingEdge ? position : min)
          .index;

      // Update selected tab if needed
      if (selectedTabIndex.value != firstVisibleItemIndex) {
        selectedTabIndex.value = firstVisibleItemIndex;

        // Also scroll the tab into view when scrolling content
        // This ensures tabs and content stay in sync when manually scrolling
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.context != null ? _scrollTabToCenter(firstVisibleItemIndex, Get.context!) : null;
        });
      }
    } catch (e) {
      debugPrint('Error updating active tab from scroll: $e');
    }
  }

  // Dispose of controllers
  void dispose() {
    tabScrollController.dispose();
  }
}

// Usage in your RealEstateScreen:
// 1. Create the controller:
//    final PropertySectionController _propertySectionController = PropertySectionController();
//
// 2. Initialize it in initState:
//    _propertySectionController.initialize(_sections.length);
//
// 3. Use it in your _selectCategory method:
//    void _selectCategory(int index) {
//      _propertySectionController.scrollToSection(index, context);
//    }
//
// 4. Connect the listeners in initState:
//    _propertySectionController.positionsListener.itemPositions.addListener(
//      _propertySectionController.updateActiveTabFromScroll
//    );