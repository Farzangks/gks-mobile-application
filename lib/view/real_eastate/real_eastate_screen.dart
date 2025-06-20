import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/component/custom_app_drawer.dart';
import 'package:ghar_ka_sathi/controller/carousel_controller.dart';
import 'package:ghar_ka_sathi/controller/property_controller.dart';
import 'package:ghar_ka_sathi/src/carousel_slider/carousel_slider_view.dart';
import 'package:ghar_ka_sathi/src/notification_page.dart';
import 'package:ghar_ka_sathi/src/property_categories/comercial_property/co_working_spaces.dart';
import 'package:ghar_ka_sathi/src/property_categories/comercial_property/industrial_units.dart';
import 'package:ghar_ka_sathi/src/property_categories/comercial_property/office_spaces.dart';
import 'package:ghar_ka_sathi/src/property_categories/comercial_property/retail_spaces.dart';
import 'package:ghar_ka_sathi/src/property_categories/comercial_property/warehouses_and_storage.dart';
import 'package:ghar_ka_sathi/src/property_categories/lands/agricultural_land.dart';
import 'package:ghar_ka_sathi/src/property_categories/lands/commercial_land.dart';
import 'package:ghar_ka_sathi/src/property_categories/lands/industrial_land.dart';
import 'package:ghar_ka_sathi/src/property_categories/lands/recreational_lands.dart';
import 'package:ghar_ka_sathi/src/property_categories/lands/residential_lands.dart';
import 'package:ghar_ka_sathi/src/property_categories/luxury_prperties/high_end_apartments.dart';
import 'package:ghar_ka_sathi/src/property_categories/luxury_prperties/pent_houses.dart';
import 'package:ghar_ka_sathi/src/property_categories/luxury_prperties/premium_villas.dart';
import 'package:ghar_ka_sathi/src/property_categories/residential_property/apartment_list_screen.dart';
import 'package:ghar_ka_sathi/src/property_categories/residential_property/houses_list_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/Builder_project_detail_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/agricultur_land_details_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/commercial_land_details_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/project_managment_details_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/property_and_legal_services_dedails_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/residential_land_details_screen.dart';
import 'package:ghar_ka_sathi/src/search_page.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/custom_widget.dart';

class RealEstateScreen extends StatefulWidget {
  const RealEstateScreen({Key? key}) : super(key: key);

  @override
  State<RealEstateScreen> createState() => _RealEstateScreenState();
}

class _RealEstateScreenState extends State<RealEstateScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Controllers
  final propertyController = Get.put(PropertyController());
  final carouselController = Get.put(CarouselsController());
  final ScrollController _scrollController = ScrollController();

  // Observable state variables
  final RxInt _selectedCategoryIndex = 0.obs;
  final RxBool _showFloatingButton = false.obs;

  // Static data
  final List<String> staticBannerList = [
    'assets/gks/pixlr-image-generator-43b95ecc-a913-4418-9df0-75a6a9b9a1c3.png',
    'assets/gks/wrapped-house-with-keys-money-background.jpg',
    'assets/gks/analog-landscape-city-with-buildings.jpg',
  ];

  final List<VoidCallback> navigationCallbacks = [
        () => Get.to(() => BuilderProjectDetailScreen()),
        () => Get.to(() => ResidentialLandDetailsScreen()),
        () => Get.to(() => CommercialLandDetailsScreen()),
  ];

  // Property category definitions
  final List<Map<String, dynamic>> _categories = [
    {
      'title': 'Residential',
      'icon': Icons.home,
      'gradient': const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppColors.btnLightRed, AppColors.btnDarkRed],
      ),
    },
    {
      'title': 'Commercial',
      'icon': Icons.business,
      'gradient': const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppColors.btnLightGreen, AppColors.btnDarkGreen],
      ),
    },
    {
      'title': 'Land',
      'icon': Icons.landscape,
      'gradient': const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppColors.btnLightRed, AppColors.btnDarkRed],
      ),
    },
    {
      'title': 'Lavish Estates',
      'icon': Icons.villa,
      'gradient': const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppColors.btnLightGreen, AppColors.btnDarkGreen],
      ),
    },
    {
      'title': 'Rental',
      'icon': Icons.house_siding,
      'gradient': const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppColors.btnLightRed, AppColors.btnDarkRed],
      ),
    },
    {
      'title': 'New Projects',
      'icon': Icons.apartment,
      'gradient': const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [AppColors.btnLightGreen, AppColors.btnDarkGreen],
      ),
    },
  ];

  // List of section definitions for each category
  late List<Map<String, dynamic>> _sections;

  @override
  void initState() {
    super.initState();

    // Load properties and carousel data
    Future.microtask(() => propertyController.getAllProperties());
    Future.microtask(() => carouselController.fetchCarouselData());

    // Initialize sections
    _initializeSections();

    // Setup scroll listeners
    _scrollController.addListener(_onScroll);
  }

  void _initializeSections() {
    _sections = [
      {
        'title': 'Residential',
        'gradient': const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.btnLightRed, AppColors.appBarColor],
        ),
        'propertyTypes': [
          PropertyType(
            icon: Icons.apartment,
            title: 'Apartments',
            count: 234,
            onTap: () {
              Get.to(() => ApartmentListScreen());
            },
          ),
          PropertyType(
            icon: Icons.home,
            title: 'Houses',
            count: 156,
            onTap: () {
              Get.to(() => HousesListScreen());
            },
          ),
        ],
      },
      {
        'title': 'Commercial',
        'gradient': const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.btnLightGreen, AppColors.btnDarkGreen],
        ),
        'propertyTypes': [
          PropertyType(
            icon: Icons.business,
            title: 'Office Spaces',
            count: 89,
            onTap: () {
              Get.to(() => OfficeSpaces());
            },
          ),
          PropertyType(
            icon: Icons.store,
            title: 'Retail Spaces',
            count: 67,
            onTap: () {
              Get.to(() => RetailSpaces());
            },
          ),
          PropertyType(
            icon: Icons.warehouse,
            title: 'Warehouses & Storage',
            count: 45,
            onTap: () {
              Get.to(() => WarehousesAndStorage());
            },
          ),
          PropertyType(
            icon: Icons.factory,
            title: 'Industrial Units',
            count: 34,
            onTap: () {
              Get.to(() => IndustrialUnits());
            },
          ),
          PropertyType(
            icon: Icons.groups,
            title: 'Co-working Spaces',
            count: 34,
            onTap: () {
              Get.to(() => CoWorkingSpaces());
            },
          ),
        ],
      },
      {
        'title': 'Land',
        'gradient': const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.btnLightRed, AppColors.appBarColor],
        ),
        'propertyTypes': [
          PropertyType(
            icon: Icons.landscape,
            title: 'Residential Plots',
            count: 89,
            onTap: () {
              Get.to(() => ResidentialLands());
            },
          ),
          PropertyType(
            icon: Icons.grass,
            title: 'Agricultural Land',
            count: 67,
            onTap: () {
              Get.to(() => AgriculturalLand());
            },
          ),
          PropertyType(
            icon: Icons.location_city,
            title: 'Commercial Plots',
            count: 45,
            onTap: () {
              Get.to(() => CommercialLand());
            },
          ),
          PropertyType(
            icon: Icons.factory_outlined,
            title: 'Industrial Land',
            count: 34,
            onTap: () {
              Get.to(() => IndustrialLand());
            },
          ),
          PropertyType(
            icon: Icons.villa,
            title: 'Recreational Land',
            subtitle: 'Farmhouses, Resorts',
            count: 34,
            onTap: () {
              Get.to(() => RecreationalLands());
            },
          ),
        ],
      },
      {
        'title': 'Lavish Estates',
        'gradient': const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.btnLightGreen, AppColors.btnDarkGreen],
        ),
        'propertyTypes': [
          PropertyType(
            icon: Icons.villa_outlined,
            title: 'Premium Villas',
            count: 89,
            onTap: () {
              Get.to(() => PremiumVillas());
            },
          ),
          PropertyType(
            icon: Icons.apartment_outlined,
            title: 'Penthouses',
            count: 67,
            onTap: () {
              Get.to(() => PentHouses());
            },
          ),
          PropertyType(
            icon: Icons.domain,
            title: 'High-End Apartments',
            count: 45,
            onTap: () {
              Get.to(() => HighEndApartments());
            },
          ),
        ],
      },
      {
        'title': 'Rental',
        'gradient': const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.btnLightRed, AppColors.appBarColor],
        ),
        'propertyTypes': [
          PropertyType(
            icon: Icons.apartment,
            title: 'Rental Apartments',
            count: 312,
            onTap: () {
              // Navigate to rental apartments
            },
          ),
          PropertyType(
            icon: Icons.home,
            title: 'Rental Houses',
            count: 198,
            onTap: () {
              // Navigate to rental houses
            },
          ),
          PropertyType(
            icon: Icons.business_center,
            title: 'Commercial Rentals',
            count: 76,
            onTap: () {
              // Navigate to commercial rentals
            },
          ),
        ],
      },
      {
        'title': 'New Projects',
        'gradient': const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.btnLightGreen, AppColors.btnDarkGreen],
        ),
        'propertyTypes': [
          PropertyType(
            icon: Icons.domain,
            title: 'Under Construction',
            count: 67,
            onTap: () {
              // Navigate to under construction projects
            },
          ),
          PropertyType(
            icon: Icons.architecture,
            title: 'Pre-Launch',
            count: 43,
            onTap: () {
              // Navigate to pre-launch projects
            },
          ),
          PropertyType(
            icon: Icons.villa,
            title: 'Ready to Move',
            count: 89,
            onTap: () {
              // Navigate to ready to move projects
            },
          ),
        ],
      },
    ];
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  // Show floating button after scrolling down
  void _onScroll() {
    if (_scrollController.offset > 200) {
      _showFloatingButton.value = true;
    } else {
      _showFloatingButton.value = false;
    }
  }

  // Handle category tab selection
  void _selectCategory(int index) {
    _selectedCategoryIndex.value = index;

    // Calculate the offset to scroll to the right section
    double offset = 0;

    // Add header heights to find the correct offset
    final double topSectionHeight = 300; // Estimated height for search + carousel
    final double servicesHeight = 220; // Estimated height for real estate services
    final double tabsHeight = 56; // Height of the category tabs

    offset = topSectionHeight + servicesHeight + tabsHeight;

    // Add heights of previous sections
    for (int i = 0; i < index; i++) {
      // Estimate section height based on number of property types
      // Each row is about 200 height units (including padding)
      // 2 items per row for smaller screens
      final int itemCount = _sections[i]['propertyTypes'].length;
      final int rowCount = (itemCount / 2).ceil();
      offset += 60 + (rowCount * 200); // Section header (60) + rows
    }

    // Scroll to the calculated offset
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      drawer: CustomAppDrawer(),
      body: _buildBody(),
      floatingActionButton: Obx(() => AnimatedScale(
        scale: _showFloatingButton.value ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 200),
        child: FloatingActionButton.extended(
          onPressed: () {
            _scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          backgroundColor: AppColors.appBarColor,
          label: const Text('Top', style: TextStyle(color: Colors.white)),
          icon: const Icon(Icons.arrow_upward, color: Colors.white),
        ),
      )),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 0,
      centerTitle: false,
      title: Image.asset(
        'assets/images/IMG_0742.PNG',
        height: 150,
      ).marginOnly(left: 5),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.appBarColor, AppColors.btnDarkRed],
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.white),
          onPressed: () {
            Get.to(() => const NotificationPage());
          },
        ),
      ],
    );
  }

  Widget _buildBody() {
    return RefreshIndicator(
      color: AppColors.appBarColor,
      onRefresh: () async {
        propertyController.getAllProperties();
        await carouselController.fetchCarouselData();
      },
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // Top Section - Search and Carousel
          SliverToBoxAdapter(
            child: _buildTopSection(),
          ),

          // Real Estate Services
          SliverToBoxAdapter(
            child: _buildRealEstateServices(),
          ),

          // Sticky Category Tabs
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyTabsDelegate(
              child: _buildCategoryTabs(),
            ),
          ),

          // Property Sections
          SliverToBoxAdapter(
            child: _buildPropertySections(),
          ),
        ],
      ),
    );
  }

  Widget _buildTopSection() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSearchBox(),
          _buildCarouselSlider(),
        ],
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: AnimatedSearchBox(
        animatedTexts: [
          'Search up to 3 Localities or Landmarks',
          'Find your perfect place',
          'Discover new areas today',
        ],
        onTap: () {
          Get.to(() => SearchScreen());
        },
      ),
    );
  }

  Widget _buildCarouselSlider() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Obx(() => CarouselSliderView(
        bannerList: carouselController.real_estateUrls.isEmpty
            ? staticBannerList
            : carouselController.real_estateUrls,
        onPressedCallbacks: navigationCallbacks,
        isLoading: carouselController.isLoading.value,
      )),
    );
  }

  Widget _buildRealEstateServices() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.btnLightRed, AppColors.appBarColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Text(
              'Real Estate Services',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildRealEstateServiceCategories(),
        ],
      ),
    );
  }

  Widget _buildRealEstateServiceCategories() {
    final categories = [
      {
        'icon': 'assets/gks/builder_project.png',
        'label': 'Builder\nProjects',
        'onTap': () {
          propertyController.getPropertiesByCategories(
              context, "Builders project");
          Get.to(() => BuilderProjectDetailScreen());
        },
      },
      {
        'icon': 'assets/gks/project_managment.png',
        'label': 'Property\nManagement',
        'onTap': () {
          Get.to(() => ProjectManagmentDetailsScreen());
        },
      },
      {
        'icon': 'assets/gks/property_Legel_Services.png',
        'label': 'Estate\nLegal Services',
        'onTap': () {
          Get.to(() => PropertyAndLegalServicesDedailsScreen());
        },
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.9,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return _buildServiceCard(
          icon: categories[index]['icon'] as String,
          label: categories[index]['label'] as String,
          onTap: categories[index]['onTap'] as VoidCallback,
        );
      },
    );
  }

  Widget _buildServiceCard({
    required String icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.bgColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    icon,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      height: 56,
      color: Colors.grey[50],
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          return Obx(() {
            final bool isSelected = _selectedCategoryIndex.value == index;
            return Container(
              margin: const EdgeInsets.only(right: 12),
              child: _buildCategoryTab(
                title: _categories[index]['title'],
                icon: _categories[index]['icon'],
                isSelected: isSelected,
                onTap: () => _selectCategory(index),
                gradient: _categories[index]['gradient'],
              ),
            );
          });
        },
      ),
    );
  }

  Widget _buildCategoryTab({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    required Gradient gradient,
  }) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            gradient: isSelected ? gradient : null,
            color: isSelected ? null : Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            border: !isSelected
                ? Border.all(color: Colors.grey.withOpacity(0.3), width: 1)
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey[600],
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPropertySections() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(_sections.length, (index) {
        // Only build the property section if it's visible or near visible
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PropertySection(
              title: _sections[index]['title'],
              gradient: _sections[index]['gradient'],
              propertyTypes: _sections[index]['propertyTypes'],
            ),
            const SizedBox(height: 32),
          ],
        );
      }),
    );
  }
}

// Delegate for sticky category tabs header
class _StickyTabsDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyTabsDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.only(top: 8),
      child: child,
    );
  }

  @override
  double get maxExtent => 64.0; // Tab height + top padding

  @override
  double get minExtent => 64.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class PropertySection extends StatelessWidget {
  final String title;
  final List<PropertyType> propertyTypes;
  final Gradient gradient;

  const PropertySection({
    Key? key,
    required this.title,
    required this.propertyTypes,
    required this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the number of items per row based on screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final itemsPerRow = screenWidth > 600 ? 3 : 2;
    final double childAspectRatio = screenWidth > 600 ? 1.1 : 0.95;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: gradient,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 14,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: itemsPerRow,
                  childAspectRatio: childAspectRatio,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: propertyTypes.length,
                itemBuilder: (context, index) {
                  return PropertyTypeCard(propertyType: propertyTypes[index]);
                },
              );
            }
        ),
      ],
    );
  }
}

class PropertyType {
  final IconData icon;
  final String title;
  final String? subtitle;
  final int count;
  final VoidCallback onTap;

  PropertyType({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.count,
    required this.onTap,
  });
}

class PropertyTypeCard extends StatelessWidget {
  final PropertyType propertyType;

  const PropertyTypeCard({
    Key? key,
    required this.propertyType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: propertyType.onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.bgColors.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  propertyType.icon,
                  size: 28,
                  color: AppColors.appBarColor,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                propertyType.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (propertyType.subtitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  propertyType.subtitle!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.bgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${propertyType.count}',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.appBarColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}