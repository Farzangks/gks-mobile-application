import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/controller/login_controller.dart';
import 'package:ghar_ka_sathi/view/in_home_services/my_services.dart';
import 'package:ghar_ka_sathi/src/my_portfolio_page.dart';
import 'package:ghar_ka_sathi/src/profile/account_screen.dart';
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
import 'package:ghar_ka_sathi/view/real_eastate/project_managment_details_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/constant.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:url_launcher/url_launcher.dart';

// Class for sub-menu items
class SubMenuItem {
  final String title;
  final VoidCallback onTap;
  final IconData? icon;

  SubMenuItem({required this.title, required this.onTap, this.icon});
}

class CustomAppDrawer extends StatefulWidget {
  const CustomAppDrawer({Key? key}) : super(key: key);

  static final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  @override
  State<CustomAppDrawer> createState() => _CustomAppDrawerState();
}

class _CustomAppDrawerState extends State<CustomAppDrawer> with TickerProviderStateMixin {
  final controller = Get.put(LoginController());
  bool _isLoading = false;

  // Multiple animation controllers for sophisticated animations
  late AnimationController _slideController;
  late AnimationController _fadeController;
  late AnimationController _staggerController;
  late AnimationController _scaleController;
  late AnimationController _rippleController;

  // Animation objects
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _backdropAnimation;
  late Animation<double> _headerAnimation;
  late Animation<double> _menuItemAnimation;

  // State management
  int? _openSubcategoryIndex;
  bool _isCategoryExpanded = false;
  bool _isToolsExpanded = false;
  int? _openMainTileIndex;
  String _selectedMenuItem = 'Home';
  bool _isDrawerFullyOpen = false;

  @override
  void initState() {
    super.initState();

    // Initialize multiple animation controllers with different durations
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _staggerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _rippleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    // Setup animations with professional easing curves
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.2, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInOut,
    ));

    _backdropAnimation = Tween<double>(
      begin: 0.0,
      end: 0.7,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _headerAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _staggerController,
      curve: Curves.easeInOut,
    ));

    _menuItemAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _staggerController,
      curve: Curves.easeInOut,
    ));

    // Start the opening animations sequence
    _startOpeningSequence();
  }

  void _startOpeningSequence() async {
    // Start slide and fade simultaneously
    _slideController.forward();
    _fadeController.forward();

    // Delay the scale animation slightly for a staggered effect
    await Future.delayed(const Duration(milliseconds: 100));
    _scaleController.forward();

    // Start the stagger animations for content
    await Future.delayed(const Duration(milliseconds: 200));
    _staggerController.forward();

    // Mark drawer as fully open
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() {
      _isDrawerFullyOpen = true;
    });
  }

  Future<void> launchUrlWithLoader(String url) async {
    setState(() {
      _isLoading = true;
    });

    // Add a subtle loading animation
    _rippleController.repeat();

    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        Get.snackbar(
          'Error',
          'Could not launch $url',
          backgroundColor: AppColors.btnDarkRed,
          colorText: Colors.white,
          icon: const Icon(Icons.error, color: Colors.white),
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred while opening the link',
        backgroundColor: AppColors.btnDarkRed,
        colorText: Colors.white,
        icon: const Icon(Icons.error, color: Colors.white),
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
      _rippleController.stop();
      _rippleController.reset();
    }
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fadeController.dispose();
    _staggerController.dispose();
    _scaleController.dispose();
    _rippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _slideAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: _slideAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Drawer(
              backgroundColor: AppColors.bgColor,
              elevation: 20,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.bgColor,
                      AppColors.bgColors.withOpacity(0.2),
                      Colors.white,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 30,
                      spreadRadius: 5,
                      offset: const Offset(5, 0),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Animated background pattern
                    _buildAnimatedBackground(),

                    // Main content
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          // Enhanced User Header with animation
                          _buildAnimatedUserHeader(),

                          const SizedBox(height: 8),

                          // Menu Items Container with staggered animations
                          _buildAnimatedMenuContainer(),
                        ],
                      ),
                    ),

                    // Premium Loading Overlay
                    if (_isLoading) _buildPremiumLoadingOverlay(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedBackground() {
    return AnimatedBuilder(
      animation: _rippleController,
      builder: (context, child) {
        return Stack(
          children: [
            // Animated circles
            Positioned(
              right: -50 + (_rippleController.value * 10),
              top: 100 + (_rippleController.value * 20),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.secondaryBtnLigRed.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: -30 + (_rippleController.value * 15),
              bottom: 200 + (_rippleController.value * 10),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.btnLightRed.withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAnimatedUserHeader() {
    return AnimatedBuilder(
      animation: _headerAnimation,
      builder: (context, child) {
        final safeOpacity = (_headerAnimation.value).clamp(0.0, 1.0);
        final safeTranslate = (50 * (1 - _headerAnimation.value)).clamp(-50.0, 50.0);

        return Transform.translate(
          offset: Offset(0, safeTranslate),
          child: Opacity(
            opacity: safeOpacity,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: AppColors.redGradient,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.btnLightRed.withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile Section with hover effect
                      _buildAnimatedProfileSection(),

                      const SizedBox(height: 16),

                      // Quick Stats with individual animations
                      _buildAnimatedQuickStats(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedProfileSection() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 800),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        final safeScale = (0.8 + (0.2 * value)).clamp(0.8, 1.0);

        return Transform.scale(
          scale: safeScale,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Add tap animation
                  _scaleController.reverse().then((_) {
                    _scaleController.forward();
                  });
                  Get.to(const AccountScreen());
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: const AssetImage('assets/images/profile.png'),
                    radius: 28,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getStringAsync(userName),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      getStringAsync(emailMobile),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Premium Member',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAnimatedQuickStats() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1000),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Row(
          children: [
            Expanded(child: _buildAnimatedQuickStat('Properties', '12', 0)),
            Expanded(child: _buildAnimatedQuickStat('Favorites', '8', 200)),
            Expanded(child: _buildAnimatedQuickStat('Views', '156', 400)),
          ],
        );
      },
    );
  }

  Widget _buildAnimatedQuickStat(String label, String value, int delay) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 600 + delay),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeInOut,
      builder: (context, animationValue, child) {
        final safeOpacity = animationValue.clamp(0.0, 1.0);
        final safeTranslate = (20 * (1 - animationValue)).clamp(-20.0, 20.0);

        return Transform.translate(
          offset: Offset(0, safeTranslate),
          child: Opacity(
            opacity: safeOpacity,
            child: Column(
              children: [
                TweenAnimationBuilder<int>(
                  duration: Duration(milliseconds: 800 + delay),
                  tween: IntTween(begin: 0, end: int.parse(value)),
                  builder: (context, animatedValue, child) {
                    return Text(
                      '$animatedValue',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedMenuContainer() {
    return AnimatedBuilder(
      animation: _menuItemAnimation,
      builder: (context, child) {
        final safeOpacity = (_menuItemAnimation.value).clamp(0.0, 1.0);
        final safeTranslate = (30 * (1 - _menuItemAnimation.value)).clamp(-30.0, 30.0);

        return Transform.translate(
          offset: Offset(0, safeTranslate),
          child: Opacity(
            opacity: safeOpacity,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  // Home Menu Item with delay
                  _buildDelayedMenuItem(
                    child: _buildPremiumMenuTile(
                      icon: Icons.home_outlined,
                      iconSelected: Icons.home,
                      title: 'Home',
                      isSelected: _selectedMenuItem == 'Home',
                      onTap: () {
                        _animateMenuSelection('Home');
                        Navigator.pop(context);
                      },
                    ),
                    delay: 0,
                  ),

                  const SizedBox(height: 8),

                  // Property Categories Section with delay
                  _buildDelayedMenuItem(
                    child: _buildPremiumExpansionTile(
                      index: 0,
                      icon: Icons.category_outlined,
                      iconSelected: Icons.category,
                      title: 'Property Categories',
                      subtitle: 'Browse properties by type',
                      isExpanded: _isCategoryExpanded,
                      onExpansionChanged: (expanded) {
                        _animateExpansion(() {
                          _isCategoryExpanded = expanded;
                          if (expanded) {
                            _isToolsExpanded = false;
                            _openMainTileIndex = 0;
                          } else {
                            _openSubcategoryIndex = null;
                          }
                        });
                      },
                      children: _buildPropertyCategories(),
                    ),
                    delay: 100,
                  ),

                  const SizedBox(height: 8),
                  // Other Menu Items with delays
                  _buildDelayedMenuItem(
                    child: _buildPremiumMenuTile(
                      icon: Icons.manage_accounts_outlined,
                      iconSelected: Icons.manage_accounts,
                      title: 'Property Management',
                      isSelected: _selectedMenuItem == 'Property Management',
                      onTap: () {
                        _animateMenuSelection('Property Management');
                        Get.to(const ProjectManagmentDetailsScreen());
                      },
                    ),
                    delay: 300,
                  ),

                  const SizedBox(height: 4),

                  _buildDelayedMenuItem(
                    child: _buildPremiumMenuTile(
                      icon: Icons.account_balance_wallet_outlined,
                      iconSelected: Icons.account_balance_wallet,
                      title: 'My Portfolio',
                      isSelected: _selectedMenuItem == 'My Portfolio',
                      onTap: () {
                        _animateMenuSelection('My Portfolio');
                        Get.to(const MyPortfolioPage());
                      },
                    ),
                    delay: 400,
                  ),

                  const SizedBox(height: 4),

                  _buildDelayedMenuItem(
                    child: _buildPremiumMenuTile(
                      icon: Icons.room_service_outlined,
                      iconSelected: Icons.room_service,
                      title: 'Our Services',
                      isSelected: _selectedMenuItem == 'Our Services',
                      onTap: () {
                        _animateMenuSelection('Our Services');
                        Get.to(const MyServices());
                      },
                    ),
                    delay: 500,
                  ),

                  const SizedBox(height: 24),

                  // Enhanced Social Links with delay
                  _buildDelayedMenuItem(
                    child: _buildEnhancedSocialLinks(),
                    delay: 600,
                  ),

                  const SizedBox(height: 20),

                  // App Version with delay
                  _buildDelayedMenuItem(
                    child: _buildAppVersion(),
                    delay: 700,
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDelayedMenuItem({required Widget child, required int delay}) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 400 + delay),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeInOut,
      builder: (context, value, _) {
        final safeOpacity = value.clamp(0.0, 1.0);
        final safeTranslate = (50 * (1 - value)).clamp(-50.0, 50.0);

        return Transform.translate(
          offset: Offset(safeTranslate, 0),
          child: Opacity(
            opacity: safeOpacity,
            child: child,
          ),
        );
      },
    );
  }

  void _animateMenuSelection(String menuName) {
    setState(() {
      _selectedMenuItem = menuName;
    });

    // Add a subtle bounce animation
    _scaleController.reverse().then((_) {
      _scaleController.forward();
    });
  }

  void _animateExpansion(VoidCallback updateState) {
    // Add smooth expansion animation
    setState(updateState);
  }

  Widget _buildPremiumMenuTile({
    required IconData icon,
    required IconData iconSelected,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 200),
      tween: Tween(begin: 0.0, end: isSelected ? 1.0 : 0.0),
      builder: (context, value, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            gradient: isSelected
                ? LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                AppColors.secondaryBtnLigRed.withOpacity(0.4),
                AppColors.btnLightRed.withOpacity(0.2),
              ],
            )
                : null,
            borderRadius: BorderRadius.circular(12),
            border: isSelected
                ? Border.all(
              color: AppColors.appBarColor.withOpacity(0.4),
              width: 1,
            )
                : null,
            boxShadow: isSelected
                ? [
              BoxShadow(
                color: AppColors.btnLightRed.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ]
                : null,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(12),
              splashColor: AppColors.btnLightRed.withOpacity(0.2),
              highlightColor: AppColors.secondaryBtnLigRed.withOpacity(0.1),
              child: ListTile(
                leading: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.appBarColor.withOpacity(0.15)
                        : Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      isSelected ? iconSelected : icon,
                      key: ValueKey(isSelected),
                      color: isSelected ? AppColors.appBarColor : Colors.grey.shade700,
                      size: 20,
                    ),
                  ),
                ),
                title: Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? AppColors.appBarColor : Colors.black87,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                trailing: isSelected
                    ? Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: AppColors.appBarColor.withOpacity(0.6),
                )
                    : null,
                dense: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPremiumExpansionTile({
    required int index,
    required IconData icon,
    required IconData iconSelected,
    required String title,
    required String subtitle,
    required bool isExpanded,
    required ValueChanged<bool> onExpansionChanged,
    required List<Widget> children,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isExpanded
                ? AppColors.btnLightRed.withOpacity(0.15)
                : AppColors.btnLightRed.withOpacity(0.08),
            blurRadius: isExpanded ? 12 : 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                onExpansionChanged(!isExpanded);
              },
              borderRadius: BorderRadius.circular(12),
              splashColor: AppColors.btnLightRed.withOpacity(0.1),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: isExpanded
                      ? LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppColors.secondaryBtnLigRed.withOpacity(0.1),
                      AppColors.btnLightRed.withOpacity(0.05),
                    ],
                  )
                      : null,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: isExpanded
                            ? const LinearGradient(colors: AppColors.redGradient)
                            : null,
                        color: isExpanded ? null : AppColors.bgColors.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: isExpanded
                            ? [
                          BoxShadow(
                            color: AppColors.btnLightRed.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                            : null,
                      ),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          isExpanded ? iconSelected : icon,
                          key: ValueKey(isExpanded),
                          color: isExpanded ? Colors.white : AppColors.appBarColor,
                          size: 22,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: isExpanded ? AppColors.appBarColor : Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: isExpanded
                              ? AppColors.appBarColor.withOpacity(0.1)
                              : Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.expand_more,
                          color: isExpanded ? AppColors.appBarColor : Colors.grey.shade600,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOutCubic,
            child: isExpanded
                ? Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(children: children),
            )
                : const SizedBox(height: 0),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildPropertyCategories() {
    return [
      _buildSubcategory(
        index: 0,
        title: "Residential",
        icon: Icons.home,
        description: "Apartments & Houses",
        subItems: [
          SubMenuItem(
            title: 'Apartments',
            icon: Icons.apartment,
            onTap: () => Get.to(ApartmentListScreen()),
          ),
          SubMenuItem(
            title: 'Houses (Villas, Townhouses)',
            icon: Icons.house,
            onTap: () => Get.to(HousesListScreen()),
          ),
        ],
      ),
      _buildSubcategory(
        index: 1,
        title: "Commercial",
        icon: Icons.business,
        description: "Office & Retail Spaces",
        subItems: [
          SubMenuItem(
            title: 'Office Spaces',
            icon: Icons.business_center,
            onTap: () => Get.to(OfficeSpaces()),
          ),
          SubMenuItem(
            title: 'Retail Spaces',
            icon: Icons.storefront,
            onTap: () => Get.to(RetailSpaces()),
          ),
          SubMenuItem(
            title: 'Warehouses & Storage',
            icon: Icons.warehouse,
            onTap: () => Get.to(WarehousesAndStorage()),
          ),
          SubMenuItem(
            title: 'Industrial Units',
            icon: Icons.factory,
            onTap: () => Get.to(IndustrialUnits()),
          ),
          SubMenuItem(
            title: 'Co-working Spaces',
            icon: Icons.groups,
            onTap: () => Get.to(CoWorkingSpaces()),
          ),
        ],
      ),
      _buildSubcategory(
        index: 2,
        title: "Land",
        icon: Icons.landscape,
        description: "Plots & Agricultural Land",
        subItems: [
          SubMenuItem(
            title: 'Residential Plots',
            icon: Icons.terrain,
            onTap: () => Get.to(ResidentialLands()),
          ),
          SubMenuItem(
            title: 'Agricultural Land',
            icon: Icons.agriculture,
            onTap: () => Get.to(AgriculturalLand()),
          ),
          SubMenuItem(
            title: 'Commercial Plots',
            icon: Icons.location_city,
            onTap: () => Get.to(CommercialLand()),
          ),
          SubMenuItem(
            title: 'Industrial Land',
            icon: Icons.precision_manufacturing,
            onTap: () => Get.to(IndustrialLand()),
          ),
          SubMenuItem(
            title: 'Recreational Land',
            icon: Icons.nature_people,
            onTap: () => Get.to(RecreationalLands()),
          ),
        ],
      ),
      _buildSubcategory(
        index: 3,
        title: "Lavish Estates",
        icon: Icons.villa,
        description: "Premium Properties",
        subItems: [
          SubMenuItem(
            title: 'Premium Villas',
            icon: Icons.villa,
            onTap: () => Get.to(PremiumVillas()),
          ),
          SubMenuItem(
            title: 'Penthouses',
            icon: Icons.apartment,
            onTap: () => Get.to(PentHouses()),
          ),
          SubMenuItem(
            title: 'High-End Apartments',
            icon: Icons.business_center,
            onTap: () => Get.to(HighEndApartments()),
          ),
        ],
      ),
    ];
  }


  Widget _buildSubcategory({
    required int index,
    required String title,
    required IconData icon,
    required String description,
    required List<SubMenuItem> subItems,
  }) {
    final bool isExpanded = _openSubcategoryIndex == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isExpanded ? AppColors.bgColors.withOpacity(0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  _openSubcategoryIndex = isExpanded ? null : index;
                });
              },
              borderRadius: BorderRadius.circular(10),
              splashColor: AppColors.btnLightRed.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: isExpanded
                            ? AppColors.appBarColor.withOpacity(0.1)
                            : Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(
                        icon,
                        size: 18,
                        color: isExpanded ? AppColors.appBarColor : Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: isExpanded ? AppColors.appBarColor : Colors.black87,
                            ),
                          ),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedRotation(
                      turns: isExpanded ? 0.25 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.chevron_right,
                        size: 18,
                        color: isExpanded ? AppColors.appBarColor : Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOutCubic,
            child: isExpanded
                ? Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                children: subItems.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  return TweenAnimationBuilder<double>(
                    duration: Duration(milliseconds: 200 + (index * 50)),
                    tween: Tween(begin: 0.0, end: 1.0),
                    curve: Curves.easeInOut,
                    builder: (context, value, child) {
                      final safeOpacity = value.clamp(0.0, 1.0);
                      final safeTranslate = (20 * (1 - value)).clamp(-20.0, 20.0);

                      return Transform.translate(
                        offset: Offset(safeTranslate, 0),
                        child: Opacity(
                          opacity: safeOpacity,
                          child: _buildSubMenuItem(item),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            )
                : const SizedBox(height: 0),
          ),
        ],
      ),
    );
  }

  Widget _buildSubMenuItem(SubMenuItem item) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: item.onTap,
        borderRadius: BorderRadius.circular(8),
        splashColor: AppColors.btnLightRed.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              if (item.icon != null) ...[
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.bgColors.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    item.icon,
                    size: 14,
                    color: AppColors.appBarColor,
                  ),
                ),
                const SizedBox(width: 12),
              ] else ...[
                Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.appBarColor.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 16),
              ],
              Expanded(
                child: Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 10,
                color: Colors.grey.shade500,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToolMenuItem({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          splashColor: AppColors.btnLightRed.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.bgColors.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    size: 18,
                    color: AppColors.appBarColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey.shade500,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEnhancedSocialLinks() {
    final socialLinks = [
      {
        'asset': 'assets/gks/fb.PNG',
        'height': 20.0,
        'url': 'https://facebook.com/gharkasathi',
        'name': 'Facebook',
        'color': const Color(0xFF1877F2),
      },
      {
        'asset': 'assets/gks/X-Logo.png',
        'height': 15.0,
        'url': 'https://twitter.com/gharkasathi',
        'name': 'Twitter',
        'color': const Color(0xFF1DA1F2),
      },
      {
        'asset': 'assets/gks/whatsapp-icon-3953.png',
        'height': 20.0,
        'url': 'https://wa.me/917770999122',
        'name': 'WhatsApp',
        'color': const Color(0xFF25D366),
      },
      {
        'asset': 'assets/gks/insta.PNG',
        'height': 20.0,
        'url': 'https://www.instagram.com/gharkasathi',
        'name': 'Instagram',
        'color': const Color(0xFFE4405F),
      },
      {
        'asset': 'assets/gks/yt.PNG',
        'height': 20.0,
        'url': 'https://youtube.com/@gharkasathi',
        'name': 'YouTube',
        'color': const Color(0xFFFF0000),
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.btnLightRed.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.bgColors.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.share_outlined,
                  size: 18,
                  color: AppColors.appBarColor,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Connect With Us',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.appBarColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: socialLinks.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return TweenAnimationBuilder<double>(
                duration: Duration(milliseconds: 300 + (index * 100)),
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Tooltip(
                      message: item['name'] as String,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            launchUrlWithLoader(item['url'] as String);
                          },
                          borderRadius: BorderRadius.circular(12),
                          splashColor: (item['color'] as Color).withOpacity(0.2),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: 44,
                            height: 44,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.bgColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.secondaryBtnLigRed.withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Image.asset(
                              item['asset'] as String,
                              height: item['height'] as double,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildAppVersion() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        final safeScale = value.clamp(0.0, 1.0);

        return Transform.scale(
          scale: safeScale,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.bgColors.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.secondaryBtnLigRed.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.info_outline,
                  size: 14,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 6),
                Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPremiumLoadingOverlay() {
    return AnimatedBuilder(
      animation: _rippleController,
      builder: (context, child) {
        return Container(
          color: AppColors.bgColor.withOpacity(0.95),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.btnLightRed.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: AppColors.redGradient),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: AnimatedBuilder(
                        animation: _rippleController,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _rippleController.value * 2 * 3.14159,
                            child: const Icon(
                              Icons.sync,
                              color: Colors.white,
                              size: 24,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Opening link...',
                    style: TextStyle(
                      color: AppColors.appBarColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Please wait while we redirect you',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}