// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ghar_ka_sathi/src/property_categories/comercial_property/co_working_spaces.dart';
// import 'package:ghar_ka_sathi/src/property_categories/comercial_property/industrial_units.dart';
// import 'package:ghar_ka_sathi/src/property_categories/comercial_property/office_spaces.dart';
// import 'package:ghar_ka_sathi/src/property_categories/comercial_property/retail_spaces.dart';
// import 'package:ghar_ka_sathi/src/property_categories/comercial_property/warehouses_and_storage.dart';
// import 'package:ghar_ka_sathi/src/property_categories/lands/agricultural_land.dart';
// import 'package:ghar_ka_sathi/src/property_categories/lands/commercial_land.dart';
// import 'package:ghar_ka_sathi/src/property_categories/lands/industrial_land.dart';
// import 'package:ghar_ka_sathi/src/property_categories/lands/recreational_lands.dart';
// import 'package:ghar_ka_sathi/src/property_categories/lands/residential_lands.dart';
// import 'package:ghar_ka_sathi/src/property_categories/luxury_prperties/high_end_apartments.dart';
// import 'package:ghar_ka_sathi/src/property_categories/luxury_prperties/pent_houses.dart';
// import 'package:ghar_ka_sathi/src/property_categories/luxury_prperties/premium_villas.dart';
// import 'package:ghar_ka_sathi/src/property_categories/residential_property/apartment_list_screen.dart';
// import 'package:ghar_ka_sathi/src/property_categories/residential_property/houses_list_screen.dart';
// import 'package:ghar_ka_sathi/utils/colors_res.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
//
// class PropertyListingScreen extends StatefulWidget {
//   @override
//   State<PropertyListingScreen> createState() => _PropertyListingScreenState();
// }
//
// class _PropertyListingScreenState extends State<PropertyListingScreen> {
//   // Controllers for scrollable tabs
//   final ScrollController _tabScrollController = ScrollController();
//
//   // Controller for the main content scroll
//   final ItemScrollController _sectionScrollController = ItemScrollController();
//   final ItemPositionsListener _positionsListener = ItemPositionsListener.create();
//
//   // Currently selected category index
//   final RxInt _selectedTabIndex = 0.obs;
//
//   // Property category definitions
//   final List<Map<String, dynamic>> _categories = [
//     {
//       'title': 'Residential',
//       'icon': Icons.home,
//       'gradient': const LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [AppColors.btnLightRed, AppColors.btnDarkRed],
//       ),
//     },
//     {
//       'title': 'Commercial',
//       'icon': Icons.business,
//       'gradient': const LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [AppColors.btnLightGreen, AppColors.btnDarkGreen],
//       ),
//     },
//     {
//       'title': 'Land',
//       'icon': Icons.landscape,
//       'gradient': const LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [AppColors.btnLightRed, AppColors.btnDarkRed],
//       ),
//     },
//     {
//       'title': 'Lavish Estates',
//       'icon': Icons.villa,
//       'gradient': const LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [AppColors.btnLightGreen, AppColors.btnDarkGreen],
//       ),
//     },
//     {
//       'title': 'Rental',
//       'icon': Icons.house_siding,
//       'gradient': const LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [AppColors.btnLightRed, AppColors.btnDarkRed],
//       ),
//     },
//     {
//       'title': 'New Projects',
//       'icon': Icons.apartment,
//       'gradient': const LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [AppColors.btnLightGreen, AppColors.btnDarkGreen],
//       ),
//     },
//   ];
//
//   // List of section definitions for each category
//   late List<Map<String, dynamic>> _sections;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Define sections for each category
//     _sections = [
//       {
//         'title': 'Residential',
//         'gradient': const LinearGradient(
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//           colors: [AppColors.btnLightRed, AppColors.appBarColor],
//         ),
//         'propertyTypes': [
//           PropertyType(
//             icon: Icons.apartment,
//             title: 'Apartments',
//             count: 234,
//             onTap: () {
//               Get.to(() => ApartmentListScreen());
//             },
//           ),
//           PropertyType(
//             icon: Icons.home,
//             title: 'Houses',
//             count: 156,
//             onTap: () {
//               Get.to(() => HousesListScreen());
//             },
//           ),
//         ],
//       },
//       {
//         'title': 'Commercial',
//         'gradient': const LinearGradient(
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//           colors: [AppColors.btnLightGreen, AppColors.btnDarkGreen],
//         ),
//         'propertyTypes': [
//           PropertyType(
//             icon: Icons.business,
//             title: 'Office Spaces',
//             count: 89,
//             onTap: () {
//               Get.to(() => OfficeSpaces());
//             },
//           ),
//           PropertyType(
//             icon: Icons.store,
//             title: 'Retail Spaces',
//             count: 67,
//             onTap: () {
//               Get.to(() => RetailSpaces());
//             },
//           ),
//           PropertyType(
//             icon: Icons.warehouse,
//             title: 'Warehouses & Storage',
//             count: 45,
//             onTap: () {
//               Get.to(() => WarehousesAndStorage());
//             },
//           ),
//           PropertyType(
//             icon: Icons.factory,
//             title: 'Industrial Units',
//             count: 34,
//             onTap: () {
//               Get.to(() => IndustrialUnits());
//             },
//           ),
//           PropertyType(
//             icon: Icons.groups,
//             title: 'Co-working Spaces',
//             count: 34,
//             onTap: () {
//               Get.to(() => CoWorkingSpaces());
//             },
//           ),
//         ],
//       },
//       {
//         'title': 'Land',
//         'gradient': const LinearGradient(
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//           colors: [AppColors.btnLightRed, AppColors.appBarColor],
//         ),
//         'propertyTypes': [
//           PropertyType(
//             icon: Icons.landscape,
//             title: 'Residential Plots',
//             count: 89,
//             onTap: () {
//               Get.to(() => ResidentialLands());
//             },
//           ),
//           PropertyType(
//             icon: Icons.grass,
//             title: 'Agricultural Land',
//             count: 67,
//             onTap: () {
//               Get.to(() => AgriculturalLand());
//             },
//           ),
//           PropertyType(
//             icon: Icons.location_city,
//             title: 'Commercial Plots',
//             count: 45,
//             onTap: () {
//               Get.to(() => CommercialLand());
//             },
//           ),
//           PropertyType(
//             icon: Icons.factory_outlined,
//             title: 'Industrial Land',
//             count: 34,
//             onTap: () {
//               Get.to(() => IndustrialLand());
//             },
//           ),
//           PropertyType(
//             icon: Icons.villa,
//             title: 'Recreational Land',
//             subtitle: 'Farmhouses, Resorts',
//             count: 34,
//             onTap: () {
//               Get.to(() => RecreationalLands());
//             },
//           ),
//         ],
//       },
//       {
//         'title': 'Lavish Estates',
//         'gradient': const LinearGradient(
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//           colors: [AppColors.btnLightGreen, AppColors.btnDarkGreen],
//         ),
//         'propertyTypes': [
//           PropertyType(
//             icon: Icons.villa_outlined,
//             title: 'Premium Villas',
//             count: 89,
//             onTap: () {
//               Get.to(() => PremiumVillas());
//             },
//           ),
//           PropertyType(
//             icon: Icons.apartment_outlined,
//             title: 'Penthouses',
//             count: 67,
//             onTap: () {
//               Get.to(() => PentHouses());
//             },
//           ),
//           PropertyType(
//             icon: Icons.domain,
//             title: 'High-End Apartments',
//             count: 45,
//             onTap: () {
//               Get.to(() => HighEndApartments());
//             },
//           ),
//         ],
//       },
//       {
//         'title': 'Rental',
//         'gradient': const LinearGradient(
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//           colors: [AppColors.btnLightRed, AppColors.appBarColor],
//         ),
//         'propertyTypes': [
//           PropertyType(
//             icon: Icons.apartment,
//             title: 'Rental Apartments',
//             count: 312,
//             onTap: () {
//               // Navigate to rental apartments
//             },
//           ),
//           PropertyType(
//             icon: Icons.home,
//             title: 'Rental Houses',
//             count: 198,
//             onTap: () {
//               // Navigate to rental houses
//             },
//           ),
//           PropertyType(
//             icon: Icons.business_center,
//             title: 'Commercial Rentals',
//             count: 76,
//             onTap: () {
//               // Navigate to commercial rentals
//             },
//           ),
//         ],
//       },
//       {
//         'title': 'New Projects',
//         'gradient': const LinearGradient(
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//           colors: [AppColors.btnLightGreen, AppColors.btnDarkGreen],
//         ),
//         'propertyTypes': [
//           PropertyType(
//             icon: Icons.domain,
//             title: 'Under Construction',
//             count: 67,
//             onTap: () {
//               // Navigate to under construction projects
//             },
//           ),
//           PropertyType(
//             icon: Icons.architecture,
//             title: 'Pre-Launch',
//             count: 43,
//             onTap: () {
//               // Navigate to pre-launch projects
//             },
//           ),
//           PropertyType(
//             icon: Icons.villa,
//             title: 'Ready to Move',
//             count: 89,
//             onTap: () {
//               // Navigate to ready to move projects
//             },
//           ),
//         ],
//       },
//     ];
//
//     // Listen to position changes to update active tab based on scroll
//     _positionsListener.itemPositions.addListener(_updateActiveTabFromScroll);
//   }
//
//   @override
//   void dispose() {
//     _tabScrollController.dispose();
//     _positionsListener.itemPositions.removeListener(_updateActiveTabFromScroll);
//     super.dispose();
//   }
//
//   // Update active tab based on which section is visible
//   void _updateActiveTabFromScroll() {
//     if (
//         _positionsListener.itemPositions.value.isEmpty) return;
//
//     try {
//       // Get all visible positions
//       final visiblePositions = _positionsListener.itemPositions.value
//           .where((position) => position.itemTrailingEdge > 0 && position.itemLeadingEdge < 1);
//
//       if (visiblePositions.isEmpty) return;
//
//       // Find the most visible item (smallest leading edge)
//       final int firstVisibleItemIndex = visiblePositions
//           .reduce((min, position) => position.itemLeadingEdge < min.itemLeadingEdge ? position : min)
//           .index;
//
//       // Only update if we're not already showing this tab
//       if (_selectedTabIndex.value != firstVisibleItemIndex) {
//         _selectedTabIndex.value = firstVisibleItemIndex;
//         _scrollTabToCenter(firstVisibleItemIndex);
//       }
//     } catch (e) {
//       debugPrint('Error updating active tab from scroll: $e');
//     }
//   }
//
//   // Scroll tab to center when selected via scroll
//   void _scrollTabToCenter(int index) {
//     // Ensure this runs after the UI has been built and GlobalKeys are attached to widgets
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (!_tabScrollController.hasClients) return;
//
//       try {
//         // Check if the global key context exists
//         final context = _getCategoryTabKey(index).currentContext;
//         if (context == null) return;
//
//         // Get the render box and calculate the position
//         final RenderBox renderBox = context.findRenderObject() as RenderBox;
//         if (!renderBox.hasSize) return;
//
//         final tabPosition = renderBox.localToGlobal(Offset.zero);
//         final screenWidth = MediaQuery.of(context).size.width;
//         final tabWidth = renderBox.size.width;
//
//         final double scrollOffset = _tabScrollController.offset +
//             tabPosition.dx - (screenWidth / 2) + (tabWidth / 2);
//
//         // Only scroll if needed and if the offset is within bounds
//         if (scrollOffset != _tabScrollController.offset) {
//           _tabScrollController.animateTo(
//             scrollOffset.clamp(0.0, _tabScrollController.position.maxScrollExtent),
//             duration: const Duration(milliseconds: 300),
//             curve: Curves.easeInOut,
//           );
//         }
//       } catch (e) {
//         // Safely handle any errors during scrolling
//         debugPrint('Error scrolling tab to center: $e');
//       }
//     });
//   }
//
//   // Get global key for category tab
//   GlobalKey _getCategoryTabKey(int index) {
//     return GlobalKey(debugLabel: 'category_tab_$index');
//   }
//
//   // Handle category tab selection
//   void _selectCategory(int index) {
//     // Update the selected index
//     _selectedTabIndex.value = index;
//
//     // Verify that the scroll controller is attached before trying to scroll
//     if (_sectionScrollController.isAttached) {
//       try {
//         // Scroll to the corresponding section
//         _sectionScrollController.scrollTo(
//           index: index,
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//       } catch (e) {
//         debugPrint('Error scrolling to section: $e');
//       }
//     }
//
//     // Scroll the tab to center
//     _scrollTabToCenter(index);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Horizontal category tabs
//           _buildCategoryTabs(),
//
//           const SizedBox(height: 24),
//
//           // Main content with property sections
//           Expanded(
//             child: _buildPropertySections(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCategoryTabs() {
//     return Container(
//       height: 56,
//       margin: const EdgeInsets.only(top: 8),
//       child: ListView.builder(
//         controller: _tabScrollController,
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         itemCount: _categories.length,
//         itemBuilder: (context, index) {
//           // Use direct access with Obx widget for each tab item
//           return Obx(() {
//             final bool isSelected = _selectedTabIndex.value == index;
//             return Container(
//               key: _getCategoryTabKey(index),
//               margin: const EdgeInsets.only(right: 12),
//               child: _buildCategoryTab(
//                 title: _categories[index]['title'],
//                 icon: _categories[index]['icon'],
//                 isSelected: isSelected,
//                 onTap: () => _selectCategory(index),
//                 gradient: _categories[index]['gradient'],
//               ),
//             );
//           });
//         },
//       ),
//     );
//   }
//
//
//   Widget _buildCategoryTab({
//     required String title,
//     required IconData icon,
//     required bool isSelected,
//     required VoidCallback onTap,
//     required Gradient gradient,
//   }) {
//     return Material(
//       color: Colors.transparent,
//       borderRadius: BorderRadius.circular(30),
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(30),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           decoration: BoxDecoration(
//             gradient: isSelected ? gradient : null,
//             color: isSelected ? null : Colors.white,
//             borderRadius: BorderRadius.circular(30),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 4,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//             border: !isSelected
//                 ? Border.all(color: Colors.grey.withOpacity(0.3), width: 1)
//                 : null,
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min, // Important to prevent overflow
//             children: [
//               Icon(
//                 icon,
//                 color: isSelected ? Colors.white : Colors.grey[600],
//                 size: 20,
//               ),
//               const SizedBox(width: 8),
//               Text(
//                 title,
//                 style: TextStyle(
//                   color: isSelected ? Colors.white : Colors.grey[800],
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPropertySections() {
//     return ScrollablePositionedList.builder(
//       itemCount: _sections.length,
//       itemScrollController: _sectionScrollController,
//       itemPositionsListener: _positionsListener,
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       itemBuilder: (context, index) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             PropertySection(
//               title: _sections[index]['title'],
//               gradient: _sections[index]['gradient'],
//               propertyTypes: _sections[index]['propertyTypes'],
//             ),
//             const SizedBox(height: 32),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class PropertyCategoryCard extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final Gradient gradient;
//   final VoidCallback onTap;
//
//   const PropertyCategoryCard({
//     Key? key,
//     required this.title,
//     required this.icon,
//     required this.gradient,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Hero(
//       tag: 'category_$title',
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: onTap,
//           borderRadius: BorderRadius.circular(16),
//           child: AspectRatio(
//             aspectRatio: 1.5,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 8,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//                 image: DecorationImage(
//                   image: AssetImage('assets/gks/builder_project.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(16),
//                   gradient: gradient,
//                 ),
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         icon,
//                         color: Colors.white,
//                         size: 48,
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         title,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: 1.2,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// class PropertySection extends StatelessWidget {
//   final String title;
//   final List<PropertyType> propertyTypes;
//   final Gradient gradient;
//
//   const PropertySection({
//     Key? key,
//     required this.title,
//     required this.propertyTypes,
//     required this.gradient,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Calculate the number of items per row based on screen width
//     final screenWidth = MediaQuery.of(context).size.width;
//     final itemsPerRow = screenWidth > 600 ? 3 : 2;
//
//     // Calculate proper child aspect ratio to avoid overflow
//     // Use a slightly smaller aspectRatio to give more height
//     final double childAspectRatio = screenWidth > 600 ? 1.1 : 0.95;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.min, // Use min size to avoid extra space
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30),
//             gradient: gradient,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 4,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 18, // Reduced from 20
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               const SizedBox(width: 8), // Reduced from 16
//               const Icon(
//                 Icons.arrow_forward_ios_rounded,
//                 color: Colors.white,
//                 size: 14, // Reduced from 16
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 12), // Reduced from 16
//
//         // Use LayoutBuilder to get exact constraints for grid
//         LayoutBuilder(
//             builder: (context, constraints) {
//               // Calculate item width based on container width
//               final double itemWidth = (constraints.maxWidth - (itemsPerRow - 1) * 12) / itemsPerRow;
//
//               // Use a fixed height for items to avoid overflow
//               final double itemHeight = itemWidth / childAspectRatio;
//
//               return GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: itemsPerRow,
//                   childAspectRatio: childAspectRatio,
//                   crossAxisSpacing: 12, // Reduced from 16
//                   mainAxisSpacing: 12, // Reduced from 16
//                 ),
//                 itemCount: propertyTypes.length,
//                 itemBuilder: (context, index) {
//                   return PropertyTypeCard(propertyType: propertyTypes[index]);
//                 },
//               );
//             }
//         ),
//       ],
//     );
//   }
// }
//
// class PropertyType {
//   final IconData icon;
//   final String title;
//   final String? subtitle;
//   final int count;
//   final VoidCallback onTap;
//
//   PropertyType({
//     required this.icon,
//     required this.title,
//     this.subtitle,
//     required this.count,
//     required this.onTap,
//   });
// }
//
// class PropertyTypeCard extends StatelessWidget {
//   final PropertyType propertyType;
//
//   const PropertyTypeCard({
//     Key? key,
//     required this.propertyType,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: propertyType.onTap,
//       borderRadius: BorderRadius.circular(16),
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.1),
//               spreadRadius: 1,
//               blurRadius: 8,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: AppColors.bgColors.withOpacity(0.3),
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 propertyType.icon,
//                 size: 32,
//                 color: AppColors.appBarColor,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               propertyType.title,
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             if (propertyType.subtitle != null) ...[
//               const SizedBox(height: 4),
//               Text(
//                 propertyType.subtitle!,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ],
//             const SizedBox(height: 8),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//               decoration: BoxDecoration(
//                 color: AppColors.bgColor,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Text(
//                 '${propertyType.count}',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: AppColors.appBarColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// // services/property_service.dart
// class PropertyService {
//   // Mock data
//   List<PropertyModel> getProperties({String? category, String? type}) {
//     // Implement filtering based on category and type
//     return dummyProperties.where((property) {
//       bool categoryMatch = category == null || property.category == category;
//       bool typeMatch = type == null || property.type == type;
//       return categoryMatch && typeMatch;
//     }).toList();
//   }
//
//   // Sample data
//   final List<PropertyModel> dummyProperties = [
//     PropertyModel(
//       id: '1',
//       title: 'Modern Apartment in Downtown',
//       type: 'Apartments',
//       category: 'Residential',
//       price: 250000,
//       location: 'Downtown, City Center',
//       imageUrl: 'assets/images/apartment1.jpg',
//       bedrooms: 2,
//       bathrooms: 1,
//       area: 850,
//     ),
//     PropertyModel(
//       id: '2',
//       title: 'Luxury Villa with Pool',
//       type: 'Houses',
//       category: 'Residential',
//       price: 1200000,
//       location: 'Beachfront, Oceanview',
//       imageUrl: 'assets/images/house1.jpg',
//       bedrooms: 5,
//       bathrooms: 4,
//       area: 3200,
//     ),
//     // Add more properties as needed
//   ];
// }
//
// // screens/property_listing_detail.dart
// class PropertyListingDetailScreen extends StatelessWidget {
//   final String category;
//   final String type;
//
//   const PropertyListingDetailScreen({
//     Key? key,
//     required this.category,
//     required this.type,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final propertyService = PropertyService();
//     final properties = propertyService.getProperties(
//       category: category,
//       type: type,
//     );
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$type Listings'),
//         backgroundColor: category == 'Residential' ? Colors.blue : Colors.purple,
//       ),
//       body: properties.isEmpty
//           ? const Center(child: Text('No properties found'))
//           : ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: properties.length,
//         itemBuilder: (context, index) {
//           final property = properties[index];
//           return PropertyCard(property: property);
//         },
//       ),
//     );
//   }
// }
//
// class PropertyCard extends StatelessWidget {
//   final PropertyModel property;
//
//   const PropertyCard({
//     Key? key,
//     required this.property,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Property Image
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//                 child: AspectRatio(
//                   aspectRatio: 16 / 9,
//                   child: property.imageUrl.isNotEmpty
//                       ? Image.network(
//                     property.imageUrl,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return _buildPlaceholderImage();
//                     },
//                   )
//                       : _buildPlaceholderImage(),
//                 ),
//               ),
//               // Property type badge
//               Positioned(
//                 top: 16,
//                 left: 16,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: AppColors.appBarColor,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Text(
//                     property.type,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               // Favorite button
//               Positioned(
//                 top: 12,
//                 right: 12,
//                 child: Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     Icons.favorite_border,
//                     color: AppColors.appBarColor,
//                     size: 20,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // Property details
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Property title
//                 Text(
//                   property.title,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 8),
//                 // Property location
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.location_on,
//                       size: 16,
//                       color: Colors.grey[600],
//                     ),
//                     const SizedBox(width: 4),
//                     Expanded(
//                       child: Text(
//                         property.location,
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[600],
//                         ),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 // Price and details row
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Price
//                     Text(
//                       _formatPrice(property.price),
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.appBarColor,
//                       ),
//                     ),
//                     // Property details
//                     Row(
//                       children: [
//                         if (property.category == 'Residential' ||
//                             property.category == 'Lavish Estates') ...[
//                           _buildDetailItem(
//                             Icons.king_bed,
//                             '${property.bedrooms}',
//                           ),
//                           const SizedBox(width: 12),
//                           _buildDetailItem(
//                             Icons.bathtub,
//                             '${property.bathrooms}',
//                           ),
//                         ],
//                         const SizedBox(width: 12),
//                         _buildDetailItem(
//                           Icons.square_foot,
//                           _formatArea(property.area),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           // Contact agent row
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             decoration: BoxDecoration(
//               color: AppColors.bgColor,
//               borderRadius: const BorderRadius.vertical(
//                 bottom: Radius.circular(16),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   width: 36,
//                   height: 36,
//                   decoration: BoxDecoration(
//                     color: AppColors.bgColors,
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     Icons.person,
//                     color: AppColors.appBarColor,
//                     size: 20,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 const Expanded(
//                   child: Text(
//                     'Contact Agent',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.phone,
//                         color: AppColors.appBarColor,
//                         size: 16,
//                       ),
//                       const SizedBox(width: 4),
//                       Text(
//                         'Call',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.appBarColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildPlaceholderImage() {
//     return Container(
//       color: Colors.grey[200],
//       child: Center(
//         child: Icon(
//           property.type == 'Apartments' ? Icons.apartment : Icons.home,
//           size: 48,
//           color: Colors.grey[400],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildDetailItem(IconData icon, String text) {
//     return Row(
//       children: [
//         Icon(icon, size: 16, color: Colors.grey[600]),
//         const SizedBox(width: 4),
//         Text(
//           text,
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.grey[600],
//           ),
//         ),
//       ],
//     );
//   }
//
//   String _formatPrice(double price) {
//     if (price >= 10000000) {
//       return '₹${(price / 10000000).toStringAsFixed(2)} Cr';
//     } else if (price >= 100000) {
//       return '₹${(price / 100000).toStringAsFixed(2)} Lac';
//     } else {
//       return '₹${price.toStringAsFixed(0)}';
//     }
//   }
//
//   String _formatArea(double area) {
//     return '${area.toStringAsFixed(0)} sq ft';
//   }
// }
//
// // Detailed PropertyCard for property detail page
// class DetailedPropertyCard extends StatelessWidget {
//   final PropertyModel property;
//
//   const DetailedPropertyCard({
//     Key? key,
//     required this.property,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Property Image with gallery
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//                 child: AspectRatio(
//                   aspectRatio: 16 / 9,
//                   child: property.imageUrl.isNotEmpty
//                       ? Image.network(
//                     property.imageUrl,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return _buildPlaceholderImage();
//                     },
//                   )
//                       : _buildPlaceholderImage(),
//                 ),
//               ),
//               // Gallery indicator
//               Positioned(
//                 bottom: 16,
//                 right: 16,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.6),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Row(
//                     children: const [
//                       Icon(
//                         Icons.photo_library,
//                         color: Colors.white,
//                         size: 16,
//                       ),
//                       SizedBox(width: 4),
//                       Text(
//                         '12 Photos',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // Back button
//               Positioned(
//                 top: 16,
//                 left: 16,
//                 child: GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.5),
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(
//                       Icons.arrow_back,
//                       color: Colors.white,
//                       size: 20,
//                     ),
//                   ),
//                 ),
//               ),
//               // Share and favorite buttons
//               Positioned(
//                 top: 16,
//                 right: 16,
//                 child: Row(
//                   children: [
//                     Container(
//                       margin: const EdgeInsets.only(right: 8),
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.5),
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.share,
//                         color: Colors.white,
//                         size: 20,
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.5),
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.favorite_border,
//                         color: Colors.white,
//                         size: 20,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           // Property details
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                       decoration: BoxDecoration(
//                         color: AppColors.bgColor,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Text(
//                         property.type,
//                         style: TextStyle(
//                           color: AppColors.appBarColor,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                       decoration: BoxDecoration(
//                         color: AppColors.secondaryBtnLigRed.withOpacity(0.2),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Text(
//                         'For Sale',
//                         style: TextStyle(
//                           color: AppColors.appBarColor,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 // Property title
//                 Text(
//                   property.title,
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 // Property location
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.location_on,
//                       size: 16,
//                       color: Colors.grey[600],
//                     ),
//                     const SizedBox(width: 4),
//                     Expanded(
//                       child: Text(
//                         property.location,
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 // Price
//                 Text(
//                   _formatPrice(property.price),
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.appBarColor,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 // Property features
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     if (property.category == 'Residential' ||
//                         property.category == 'Lavish Estates') ...[
//                       _buildFeatureItem(
//                           Icons.king_bed,
//                           '${property.bedrooms}',
//                           'Bedrooms'
//                       ),
//                       _buildFeatureItem(
//                           Icons.bathtub,
//                           '${property.bathrooms}',
//                           'Bathrooms'
//                       ),
//                     ],
//                     _buildFeatureItem(
//                         Icons.square_foot,
//                         _formatArea(property.area),
//                         'Area'
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildPlaceholderImage() {
//     return Container(
//       color: Colors.grey[200],
//       child: Center(
//         child: Icon(
//           property.type == 'Apartments' ? Icons.apartment : Icons.home,
//           size: 48,
//           color: Colors.grey[400],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildFeatureItem(IconData icon, String value, String label) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: AppColors.bgColors.withOpacity(0.3),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(
//             icon,
//             color: AppColors.appBarColor,
//             size: 24,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           value,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 12,
//             color: Colors.grey[600],
//           ),
//         ),
//       ],
//     );
//   }
//
//   String _formatPrice(double price) {
//     if (price >= 10000000) {
//       return '₹${(price / 10000000).toStringAsFixed(2)} Cr';
//     } else if (price >= 100000) {
//       return '₹${(price / 100000).toStringAsFixed(2)} Lac';
//     } else {
//       return '₹${price.toStringAsFixed(0)}';
//     }
//   }
//
//   String _formatArea(double area) {
//     return '${area.toStringAsFixed(0)} sq ft';
//   }
// }
//
// // Model class (for reference, you already have this in your code)
// class PropertyModel {
//   final String id;
//   final String title;
//   final String type;
//   final String category;
//   final double price;
//   final String location;
//   final String imageUrl;
//   final int bedrooms;
//   final int bathrooms;
//   final double area;
//
//   PropertyModel({
//     required this.id,
//     required this.title,
//     required this.type,
//     required this.category,
//     required this.price,
//     required this.location,
//     required this.imageUrl,
//     required this.bedrooms,
//     required this.bathrooms,
//     required this.area,
//   });
// }