import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/component/custom_app_drawer.dart';
import 'package:ghar_ka_sathi/component/property_card_component.dart';
import 'package:ghar_ka_sathi/component/view_all_section_title.dart';
import 'package:ghar_ka_sathi/controller/carousel_controller.dart';
import 'package:ghar_ka_sathi/controller/favorite_controller.dart';
import 'package:ghar_ka_sathi/controller/login_controller.dart';
import 'package:ghar_ka_sathi/controller/property_controller.dart';
import 'package:ghar_ka_sathi/src/carousel_slider/carousel_slider_view.dart';
import 'package:ghar_ka_sathi/view/in_home_services/construction_detail_page.dart';
import 'package:ghar_ka_sathi/view/in_home_services/carpenter_details_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/cleaning_details_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/electrician_details_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/electronic_appliances.dart';
import 'package:ghar_ka_sathi/view/in_home_services/gardening_service.dart';
import 'package:ghar_ka_sathi/view/in_home_services/home_interior.dart';
import 'package:ghar_ka_sathi/view/in_home_services/home_renovation.dart';
import 'package:ghar_ka_sathi/view/in_home_services/packers_and_movers.dart';
import 'package:ghar_ka_sathi/view/in_home_services/painting_details_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/pest_control_and_disinfect.dart';
import 'package:ghar_ka_sathi/view/in_home_services/plumbing_details_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/subscription_page.dart';
import 'package:ghar_ka_sathi/src/notification_page.dart';
import 'package:ghar_ka_sathi/view/real_eastate/Builder_project_detail_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/all_property_list_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/commercial_land_details_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/residential_land_details_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/vastu_consultation_details_screen.dart';
import 'package:ghar_ka_sathi/src/search_page.dart';
import 'package:ghar_ka_sathi/src/sell_property_form.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/custom_widget.dart';
import 'package:ghar_ka_sathi/utils/shimmer_loading_widget.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ghar_ka_sathi/view/in_home_services/service_bottom_sheet_components.dart';
import 'package:ghar_ka_sathi/view/in_home_services/cart_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  final propertyController = Get.put(PropertyController());
  final carouselController = Get.put(CarouselsController());
  final cartController = Get.put(CartController());

  // Animation controllers for premium effects
  late AnimationController _drawerAnimationController;
  late AnimationController _appBarAnimationController;
  late AnimationController _backdropController;
  late AnimationController _fabController;

  // Animations
  late Animation<double> _drawerAnimation;
  late Animation<double> _appBarAnimation;
  late Animation<double> _backdropAnimation;
  late Animation<Offset> _fabSlideAnimation;
  late Animation<double> _fabScaleAnimation;

  bool _isLoading = false;
  bool _isDrawerOpen = false;
  late List<Map<String, String>> propertyList;
  var propertyType = 'Buy';
  Color propertyTypeColor = Colors.green;

  final controller = Get.put(LoginController());
  final List<VoidCallback> navigationCallbacks = [
        () => Get.to(() => BuilderProjectDetailScreen()),
        () => Get.to(() => ResidentialLandDetailsScreen()),
        () => Get.to(() => CommercialLandDetailsScreen()),
  ];
  final List<VoidCallback> homeServiceBannerListNavigationCallbacks = [
        () => Get.to(() => CleaningDetailsScreen()),
        () => Get.to(() => PaintingDetailsScreen()),
        () => Get.to(() => PlumbingDetailsScreen()),
  ];
  final List<VoidCallback> homeInteriorBannerListNavigationCallbacks = [
        () => Get.to(() => HomeInterior()),
        () => Get.to(() => CarpenterDetailsScreen()),
        () => Get.to(() => HomeRenovation()),
  ];

  List<dynamic> getFilteredProperties() {
    return propertyController.allPropertyList.first.data
        .where((property) => property.type == propertyType)
        .toList();
  }

  Future<void> launchUrlWithLoader(String url) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_onTabChanged);

    // Initialize animation controllers
    _drawerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _appBarAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _backdropController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fabController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    // Setup animations
    _drawerAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _drawerAnimationController,
      curve: Curves.easeOutCubic,
    ));

    _appBarAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _appBarAnimationController,
      curve: Curves.easeOutCubic,
    ));

    _backdropAnimation = Tween<double>(
      begin: 0.0,
      end: 0.5,
    ).animate(CurvedAnimation(
      parent: _backdropController,
      curve: Curves.easeInOut,
    ));

    _fabSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _fabController,
      curve: Curves.easeOutCubic,
    ));

    _fabScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fabController,
      curve: Curves.easeOutCubic,
    ));

    // Start initial animations
    _appBarAnimationController.forward();

    // Delay FAB animation
    Future.delayed(const Duration(milliseconds: 500), () {
      _fabController.forward();
    });

    // Initialize user status
    controller.initializeUserStatus();

    // Initialize favorite controller
    if (!Get.isRegistered<FavoriteController>()) {
      Get.put(FavoriteController());
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    _drawerAnimationController.dispose();
    _appBarAnimationController.dispose();
    _backdropController.dispose();
    _fabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) {
      setState(() {
        switch (_tabController.index) {
          case 0:
            propertyType = 'Buy';
            propertyTypeColor = Colors.green;
            break;
          case 1:
            propertyType = 'Sell';
            propertyTypeColor = AppColors.appBarColor;
            break;
          case 2:
            propertyType = 'Rent';
            propertyTypeColor = AppColors.black;
            break;
          case 3:
            propertyType = 'Lease';
            propertyTypeColor = AppColors.blue;
            break;
          default:
            propertyType = 'Buy';
            propertyTypeColor = AppColors.green;
        }
      });
    }
  }

  void _toggleDrawer() {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      _closeDrawer();
    } else {
      _openDrawer();
    }
  }

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
    setState(() {
      _isDrawerOpen = true;
    });
    _drawerAnimationController.forward();
    _backdropController.forward();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
    setState(() {
      _isDrawerOpen = false;
    });
    _drawerAnimationController.reverse();
    _backdropController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAnimatedAppBar(),
      drawer: const CustomAppDrawer(),
      onDrawerChanged: (isOpened) {
        setState(() {
          _isDrawerOpen = isOpened;
        });
        if (isOpened) {
          _drawerAnimationController.forward();
          _backdropController.forward();
        } else {
          _drawerAnimationController.reverse();
          _backdropController.reverse();
        }
      },
      body: Stack(
        children: [
          // Main content
          _buildMainContent(),

          // Animated backdrop when drawer is open
          if (_isDrawerOpen) _buildAnimatedBackdrop(),

          // Floating Action Button with animation
          _buildAnimatedFAB(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAnimatedAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AnimatedBuilder(
        animation: _appBarAnimation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, -50 * (1 - _appBarAnimation.value)),
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: AppColors.redGradient,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.btnLightRed.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: AppBar(
                scrolledUnderElevation: 0,
                titleSpacing: 0,
                centerTitle: false,
                backgroundColor: AppColors.appBarColor,
                elevation: 0,
                title: AnimatedScale(
                  scale: _appBarAnimation.value.clamp(0.0, 1.0),
                  duration: const Duration(milliseconds: 400),
                  child: Image.asset(
                    'assets/images/IMG_0742.PNG',
                    height: 170,
                  ).marginOnly(left: 5),
                ),
                leading: AnimatedBuilder(
                  animation: _drawerAnimation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _drawerAnimation.value * 0.5,
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: _toggleDrawer,
                            borderRadius: BorderRadius.circular(12),
                            splashColor: Colors.white.withOpacity(0.2),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: Icon(
                                _isDrawerOpen ? Icons.close : Icons.menu,
                                key: ValueKey(_isDrawerOpen),
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                actions: [
                  // Animated Cart Icon with Badge
                  _buildAnimatedCartIcon(),

                  // Animated Notification Icon
                  _buildAnimatedNotificationIcon(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimatedCartIcon() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value.clamp(0.0, 1.0),
          child: Obx(() {
            final itemCount = cartController.cartCount;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => CartScreen(cartController: cartController));
                        },
                        borderRadius: BorderRadius.circular(12),
                        splashColor: Colors.white.withOpacity(0.2),
                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  if (itemCount > 0)
                    Positioned(
                      right: 4,
                      top: 4,
                      child: TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 300),
                        tween: Tween(begin: 0.0, end: 1.0),
                        builder: (context, badgeValue, child) {
                          return Transform.scale(
                            scale: badgeValue.clamp(0.0, 1.0),
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.orange.withOpacity(0.4),
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 18,
                                minHeight: 18,
                              ),
                              child: Text(
                                '$itemCount',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildAnimatedNotificationIcon() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 800),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => const NotificationPage());
                      },
                      borderRadius: BorderRadius.circular(12),
                      splashColor: Colors.white.withOpacity(0.2),
                      child: const Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                // Notification badge (if needed)
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMainContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Guest User Banner
          _buildGuestUserBanner(),

          // Animated TabBar
          TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 600),
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, 30 * (1 - value)),
                child: Opacity(
                  opacity: value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(text: 'Buy'),
                        Tab(text: 'Sell'),
                        Tab(text: 'Rent'),
                        Tab(text: 'Lease'),
                      ],
                      labelColor: AppColors.appBarColor,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: AppColors.appBarColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // Content based on selected tab
          propertyType == 'Sell'
              ? TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 800),
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, 50 * (1 - value)),
                child: Opacity(
                  opacity: value.clamp(0.0, 1.0),
                  child: SellPropertyForm(),
                ),
              );
            },
          )
              : _buildPropertyContent(),
        ],
      ),
    );
  }

  Widget _buildPropertyContent() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 800),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Animated Search Box
                TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 1000),
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (context, searchValue, child) {
                    return Transform.scale(
                      scale: 0.8 + (0.2 * searchValue),
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
                  },
                ),

                // Property List Section
                if (propertyController.hasData) ...[
                  TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 1200),
                    tween: Tween(begin: 0.0, end: 1.0),
                    builder: (context, titleValue, child) {
                      return Transform.translate(
                        offset: Offset(-50 * (1 - titleValue), 0),
                        child: Opacity(
                          opacity: titleValue,
                          child: ViewAllSectionTitle(
                            title: "View All Property",
                            onTap: () {
                              Get.to(() => AllPropertyListScreen(
                                propertyType: propertyType,
                              ));
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  _buildRealStatePropertyList(),
                ],

                // Services Header
                TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 1400),
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (context, headerValue, child) {
                    return Transform.translate(
                      offset: Offset(0, 30 * (1 - headerValue)),
                      child: Opacity(
                        opacity: headerValue,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: AppColors.redGradient,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    child: Text(
                                      'Everything You Need at Your Fingertips',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Text(
                                    'In-House Services',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.appBarColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                // In-house services carousel
                _buildInHouseServicesCarousel(),
                const SizedBox(height: 15),

                // Animated Home Service Categories
                _buildHomeServiceCategories(),

                // Home interior carousel
                if (carouselController.home_InteriorUrls.isNotEmpty)
                  _buildHomeInteriorCarousel(),

                const SizedBox(height: 100),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedBackdrop() {
    return AnimatedBuilder(
      animation: _backdropAnimation,
      builder: (context, child) {
        return GestureDetector(
          onTap: _closeDrawer,
          child: Container(
            color: Colors.black.withOpacity(_backdropAnimation.value),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedFAB() {
    return Positioned(
      bottom: 20,
      right: 20,
      child: SlideTransition(
        position: _fabSlideAnimation,
        child: ScaleTransition(
          scale: _fabScaleAnimation,
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: AppColors.redGradient,
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: AppColors.btnLightRed.withOpacity(0.4),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: FloatingActionButton(
              onPressed: () {
                // Add your FAB action here
                Get.to(() => SearchScreen());
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(
                Icons.search,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Guest User Banner Widget
  Widget _buildGuestUserBanner() {
    return Obx(() {
      if (!controller.isGuestUser.value) {
        return const SizedBox.shrink();
      }

      return TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 800),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(0, -30 * (1 - value)),
            child: Opacity(
              opacity: value,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue[50]!, Colors.blue[100]!],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.person_outline, color: Colors.blue[600], size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Browsing as Guest',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.blue[800],
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Create an account to save favorites and get personalized recommendations',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.blue[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => controller.convertGuestToRegularUser(context),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Widget _buildHomeCarousel() {
    return Obx(() {
      if (carouselController.isLoading.value && carouselController.homeUrls.isEmpty) {
        return CarouselSliderView(
          bannerList: const [],
          isLoading: true,
          title: "Featured Properties",
        );
      }

      if (carouselController.homeUrls.isEmpty) {
        return const SizedBox.shrink();
      }

      return CarouselSliderView(
        bannerList: carouselController.homeUrls,
        onPressedCallbacks: navigationCallbacks,
        isLoading: carouselController.isLoading.value,
        title: "Featured Properties",
        onRetry: () => carouselController.retryFetchCarouselData(),
      );
    });
  }

  Widget _buildInHouseServicesCarousel() {
    return Obx(() {
      if (carouselController.isLoading.value && carouselController.in_houseUrls.isEmpty) {
        return CarouselSliderView(
          bannerList: const [],
          isLoading: true,
          title: "In-House Services",
        );
      }

      if (carouselController.in_houseUrls.isEmpty) {
        return const SizedBox.shrink();
      }

      return TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 1600),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(100 * (1 - value), 0),
            child: Opacity(
              opacity: value.clamp(0.0, 1.0),
              child: CarouselSliderView(
                bannerList: carouselController.in_houseUrls,
                onPressedCallbacks: homeServiceBannerListNavigationCallbacks,
                isLoading: carouselController.isLoading.value,
                title: "In-House Services",
                onRetry: () => carouselController.retryFetchCarouselData(),
              ),
            ),
          );
        },
      );
    });
  }

  Widget _buildHomeInteriorCarousel() {
    return Obx(() {
      if (carouselController.isLoading.value && carouselController.home_InteriorUrls.isEmpty) {
        return CarouselSliderView(
          bannerList: const [],
          isLoading: true,
          title: "Home Interior Services",
        );
      }

      if (carouselController.home_InteriorUrls.isEmpty) {
        return const SizedBox.shrink();
      }

      return TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 2000),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(-100 * (1 - value), 0),
            child: Opacity(
              opacity: value.clamp(0.0, 1.0),
              child: CarouselSliderView(
                bannerList: carouselController.home_InteriorUrls,
                onPressedCallbacks: homeInteriorBannerListNavigationCallbacks,
                isLoading: carouselController.isLoading.value,
                title: "Home Interior Services",
                onRetry: () => carouselController.retryFetchCarouselData(),
              ),
            ),
          );
        },
      );
    });
  }

  Widget _buildRealStatePropertyList() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1400),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.scale(
          scale: 0.9 + (0.1 * value),
          child: Opacity(
            opacity: value.clamp(0.0, 1.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() {
                if (propertyController.isLoading.value) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return GharkasathiShimmerLoader().buildPropertyListingShimmer(context);
                    },
                  );
                }

                if (propertyController.hasData) {
                  var filteredProperties = getFilteredProperties();

                  return Column(
                    children: [
                      if (propertyController.isUsingStaticData.value)
                        Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blue[200]!),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.info_outline, color: Colors.blue[600], size: 20),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  propertyController.dataSourceInfo,
                                  style: TextStyle(
                                    color: Colors.blue[800],
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              if (!propertyController.isLoading.value)
                                TextButton(
                                  onPressed: () => propertyController.refreshData(),
                                  child: Text(
                                    'Refresh',
                                    style: TextStyle(
                                      color: Colors.blue[700],
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),

                      if (filteredProperties.isEmpty)
                        Center(
                          child: Column(
                            children: [
                              Icon(Icons.home_outlined, size: 48, color: Colors.grey[400]),
                              const SizedBox(height: 8),
                              Text(
                                'No properties match the selected criteria',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        )
                      else
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                          itemCount: filteredProperties.length < 2 ? filteredProperties.length : 2,
                          itemBuilder: (context, index) {
                            final property = filteredProperties[index];
                            return TweenAnimationBuilder<double>(
                              duration: Duration(milliseconds: 800 + (index * 200)),
                              tween: Tween(begin: 0.0, end: 1.0),
                              builder: (context, cardValue, child) {
                                return Transform.translate(
                                  offset: Offset(0, 50 * (1 - cardValue)),
                                  child: Opacity(
                                    opacity: cardValue.clamp(0.0, 1.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Add your onTap logic here
                                      },
                                      child: PropertyCard(
                                        title: property.name,
                                        details: property.detail,
                                        price: property.price.toString(),
                                        location: property.location,
                                        images: property.images,
                                        type: property.type,
                                        typeColor: propertyTypeColor,
                                        allPropertyList: property,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                    ],
                  );
                }

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, size: 48, color: Colors.red[400]),
                      const SizedBox(height: 16),
                      Text(
                        propertyController.errorMsg.value.isNotEmpty
                            ? propertyController.errorMsg.value
                            : 'Unable to load properties',
                        style: TextStyle(color: Colors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => propertyController.loadStaticDataForTesting(),
                        icon: const Icon(Icons.refresh),
                        label: const Text('Load Sample Data'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.btnDarkRed,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHomeServiceCategories() {
    final categories = [
      {
        'icon': 'assets/gks/carpentry.PNG',
        'label': 'Carpenter',
        'onTap': () {
          Get.to(() => CarpenterDetailsScreen(serviceType: 'Carpenter'));
        },
      },
      {
        'icon': 'assets/gks/construction_services/construction.png',
        'label': 'Construction',
        'onTap': () {
          Get.to(() => ConstructionDetailPage(serviceType: 'Home Renovation'));
        },
      },
      {
        'icon': 'assets/gks/electrician (2).PNG',
        'label': 'Electrician',
        'onTap': () {
          Get.to(() => ElectricianDetailsScreen(serviceType: 'Electrician'));
        },
      },
      {
        'icon': 'assets/gks/plumbing.PNG',
        'label': 'Plumber',
        'onTap': () {
          Get.to(() => PlumbingDetailsScreen(serviceType: 'Plumbing'));
        },
      },
      {
        'icon': 'assets/gks/painting.PNG',
        'label': 'Painting',
        'onTap': () {
          Get.to(() => PaintingDetailsScreen(serviceType: 'Painting'));
        },
      },
      {
        'icon': 'assets/gks/cleaning.PNG',
        'label': 'Cleaning',
        'onTap': () {
          Get.to(() => CleaningDetailsScreen(serviceType: 'Cleaning'));
        },
      },
      {
        'icon': 'assets/gks/home_interior.PNG',
        'label': 'Interior',
        'onTap': () {
          Get.to(() => HomeInterior(serviceType: 'Home Interior'));
        },
      },
      {
        'icon': 'assets/gks/electronic_appliances.PNG',
        'label': 'Electronic\nAppliances',
        'onTap': () {
          Get.to(() => ElectronicAppliances(serviceType: 'Electronic Appliances'));
        },
      },
      {
        'icon': 'assets/gks/movers_packers.PNG',
        'label': 'Packers &\nMovers',
        'onTap': () {
          Get.to(() => PackersAndMovers(serviceType: 'Home Renovation'));
        },
      },
      {
        'icon': 'assets/gks/pestControl.PNG',
        'label': 'Pest Control\n& Disinfect',
        'onTap': () {
          Get.to(() => PestControlAndDisinfect(serviceType: 'Home Renovation'));
        },
      },
      {
        'icon': 'assets/gks/home_renovation.PNG',
        'label': 'Home\nRenovation',
        'onTap': () {
          Get.to(() => HomeRenovation(serviceType: 'Home Renovation'));
        },
      },
      {
        'icon': 'assets/images/Gardening-Service.png',
        'label': 'Gardening',
        'onTap': () {
          Get.to(() => GardeningService(serviceType: 'Gardening Service'));
        },
      },
      {
        'icon': 'assets/images/Compass-2.jpg',
        'label': 'Vastu \nConsultancy',
        'onTap': () {
          Get.to(() => VastuConsultationDetailsScreen());
        },
      },
      {
        'icon': 'assets/images/Compass-2.jpg',
        'label': 'Subscription',
        'onTap': () {
          Get.to(() => SubscriptionPage());
        },
      },
    ];

    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1800),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(
            opacity: value.clamp(0.0, 1.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: 200 + (index * 50)),
                  tween: Tween(begin: 0.0, end: 1.0),
                  builder: (context, itemValue, child) {
                    return Transform.scale(
                      scale: 0.8 + (0.2 * itemValue),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: categories[index]['onTap'] as VoidCallback,
                          borderRadius: BorderRadius.circular(12),
                          splashColor: AppColors.btnLightRed.withOpacity(0.1),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  categories[index]['icon'] as String,
                                  width: 60,
                                  height: 40,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  categories[index]['label'] as String,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
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
              },
            ),
          ),
        );
      },
    );
  }
}