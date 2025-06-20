import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ghar_ka_sathi/component/property_details_components/real_eastate_propery_components/schedule_a_tour_components.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'dart:math' as math;

// Import your existing components
import 'package:ghar_ka_sathi/component/property_details_components/real_eastate_propery_components/property_information_card.dart';
import 'package:ghar_ka_sathi/component/property_details_components/real_eastate_propery_components/aminities_components.dart';
import 'package:ghar_ka_sathi/component/property_details_components/real_eastate_propery_components/convenience_component.dart';
import 'package:ghar_ka_sathi/controller/enquiry_controller.dart';
import 'package:ghar_ka_sathi/controller/favorite_controller.dart';
import 'package:ghar_ka_sathi/model/rent_property_model.dart';
import 'package:ghar_ka_sathi/utils/constant.dart';
import 'package:itq_utils/itq_utils.dart';


class PropertyDetailPage extends StatefulWidget {
  final PropertyRentResource? property;

  const PropertyDetailPage({Key? key, required this.property}) : super(key: key);

  @override
  _PropertyDetailPageState createState() => _PropertyDetailPageState();
}

class _PropertyDetailPageState extends State<PropertyDetailPage> with TickerProviderStateMixin {
  // Controllers
  final FavoriteController favoriteController = Get.find<FavoriteController>();
  late ScrollController _scrollController;
  late TabController _tabController;
  late WebViewController _mapController;

  // Tab navigation variables
  static const double _tabShowOffset = 180.0;
  bool _showTabs = false;
  int _selectedTabIndex = 0;

  // Section keys for scrolling
  final GlobalKey _overviewKey = GlobalKey();
  final GlobalKey _propertyInfoKey = GlobalKey();
  final GlobalKey _amenitiesKey = GlobalKey();
  final GlobalKey _convenienceKey = GlobalKey();
  final GlobalKey _specificationKey = GlobalKey();
  final GlobalKey _locationKey = GlobalKey();
  final GlobalKey _mediaKey = GlobalKey();
  final GlobalKey _scheduleTourKey = GlobalKey();

  // Media variables
  String? videoId;
  bool isMapLoading = true;
  bool _isImageExpanded = false;

  // Animation controllers
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  // Property data
  final propertyInfo = PropertyInfo(
    listingType: 'Sale',
    buildingType: 'Residential',
    locality: 'Tatibandh',
    propertyType: 'Apartment',
    city: 'Raipur',
    price: '₹ 46 Lac',
    ageOfProperty: '2-4',
    coveredParking: '1',
    flooring: 'Others',
    towerBlock: 'A',
    possessionStatus: 'Ready To Move',
    furnishingStatus: 'Semi-Furnished',
  );

  final amenities = [
    AmenityModel(title: 'Power Backup', icon: Icons.power),
    AmenityModel(title: '24 x 7 Security', icon: Icons.security),
    AmenityModel(title: 'Balcony', icon: Icons.balcony),
    AmenityModel(title: 'Pre-School', icon: Icons.school),
    AmenityModel(title: 'View of Landmark', icon: Icons.landscape),
    AmenityModel(title: 'Security Staff', icon: Icons.person),
    AmenityModel(title: 'Swimming Pool', icon: Icons.pool),
    AmenityModel(title: 'Gym', icon: Icons.fitness_center),
    AmenityModel(title: 'Garden', icon: Icons.park),
  ];

  final convenience = [
    ConvenienceModel(title: 'Power Backup', icon: Icons.power),
    ConvenienceModel(title: '24 x 7 Security', icon: Icons.security),
    ConvenienceModel(title: 'Balcony', icon: Icons.balcony),
    ConvenienceModel(title: 'Pre-School', icon: Icons.school),
    ConvenienceModel(title: 'View of Landmark', icon: Icons.landscape),
    ConvenienceModel(title: 'Security Staff', icon: Icons.person),
    ConvenienceModel(title: 'ATM Nearby', icon: Icons.attach_money),
    ConvenienceModel(title: 'Hospital Nearby', icon: Icons.local_hospital),
    ConvenienceModel(title: 'Shopping Mall', icon: Icons.shopping_bag),
  ];

  // Tab items with their corresponding keys
  late List<Map<String, dynamic>> _tabItems;
// Add this as a class member
  late ScrollManager _scrollManager;

  @override
  void initState() {
    super.initState();

    // Initialize tab items
    _initializeTabItems();

    // Initialize controllers
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _tabController = TabController(length: 7, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });

// Set up scroll listener
    _scrollController.addListener(() {
      _scrollListener();
      // Call the scroll manager's update method
      _scrollManager.updateActiveTabBasedOnScroll();
    });


    // Create scroll manager
    _scrollManager = ScrollManager(
      scrollController: _scrollController,
      tabController: _tabController,
      tabItems: _tabItems,
      context: context,
      onTabChanged: (index) {
        setState(() {
          _selectedTabIndex = index;
        });
      },
    );
    // Initialize fade animation
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_fadeController);
    _fadeController.forward();

    // Initialize media
    videoId = _getYoutubeVideoId(widget.property!.video);
    _initializeWebView();

    // Set system UI overlay style
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
  }


  void _handleTabTap(int index) {
    setState(() {
      _selectedTabIndex = index;
    });

    // Use the scroll manager for reliable scrolling
    _scrollManager.scrollToSectionByIndex(index);
  }

  void _initializeTabItems() {
    _tabItems = [
      {"title": "Overview", "key": _overviewKey, "icon": Icons.home},
      {"title": "Property Info", "key": _propertyInfoKey, "icon": Icons.info},
      {"title": "Amenities", "key": _amenitiesKey, "icon": Icons.spa},
      {"title": "Convenience", "key": _convenienceKey, "icon": Icons.location_city},
      {"title": "Tech Specs", "key": _specificationKey, "icon": Icons.build},
      {"title": "Location", "key": _locationKey, "icon": Icons.location_on},
      {"title": "Media", "key": _mediaKey, "icon": Icons.photo_library},
      {"title": "Schedule Tour", "key": _scheduleTourKey, "icon": Icons.event_available},
    ];

    // Make sure the tab controller length matches the number of tabs
    _tabController = TabController(length: _tabItems.length, vsync: this);
  }

  /// Specific method to scroll to schedule tour section
  void _scrollToScheduleTour() {
    final lastIndex = _tabItems.length - 1;
    setState(() {
      _selectedTabIndex = lastIndex;
      _tabController.animateTo(lastIndex);
    });

    // Add a slight delay to ensure the state update happens before scrolling
    Future.delayed(const Duration(milliseconds: 50), () {
      _scrollToSection(_scheduleTourKey);
    });
  }
  void _scrollListener() {
    if (_scrollController.offset > _tabShowOffset && !_showTabs) {
      setState(() {
        _showTabs = true;
      });
    } else if (_scrollController.offset <= _tabShowOffset && _showTabs) {
      setState(() {
        _showTabs = false;
      });
    }

    _updateActiveTabBasedOnScroll();
  }

  /// Improved section tracking while scrolling
  /// Improved section tracking while scrolling
  void _updateActiveTabBasedOnScroll() {
    if (!mounted) return;

    final scrollPosition = _scrollController.offset;
    final viewportHeight = MediaQuery.of(context).size.height;

    // Create a map to store the positions of each section
    Map<int, double> sectionPositions = {};

    // Collect the positions of all sections
    for (int i = 0; i < _tabItems.length; i++) {
      final context = _tabItems[i]["key"].currentContext;
      if (context != null) {
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero).dy;
        // Adjust the threshold based on section position
        double threshold = 100.0; // Default threshold

        // Make the threshold smaller for the last sections to improve detection
        if (i >= _tabItems.length - 2) {
          threshold = 200.0;
        }

        sectionPositions[i] = position - threshold;
      }
    }

    // Log positions for debugging
    print('Scroll position: $scrollPosition');
    print('Section positions: $sectionPositions');

    // Find the visible section
    int newIndex = 0; // Default to first tab
    for (var entry in sectionPositions.entries) {
      if (scrollPosition >= entry.value) {
        newIndex = entry.key;
      }
    }

    // Special handling for schedule tour section
    // This checks if we're near the bottom of the scroll
    if (_scrollController.position.pixels > _scrollController.position.maxScrollExtent - 300) {
      // Force select the last tab (Schedule Tour)
      newIndex = _tabItems.length - 1;
    }

    // Update the selected tab if it has changed
    if (_selectedTabIndex != newIndex && mounted) {
      print('Updating tab from $_selectedTabIndex to $newIndex');
      setState(() {
        _selectedTabIndex = newIndex;
        // Update the tab controller to match
        if (_tabController.index != newIndex) {
          _tabController.animateTo(newIndex);
        }
      });
    }
  }

  /// Generic reusable bottom sheet for all "View All" buttons
  void _showViewAllBottomSheet(BuildContext context, String title, List<Widget> content) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7, // Start at 70% of screen height
          maxChildSize: 0.95,    // Can expand up to 95% of screen height
          minChildSize: 0.5,     // Minimum 50% of screen height
          expand: false,
          builder: (_, controller) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.btnDarkRed.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Drag handle
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.btnLightRed.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  // Title with animation
                  TweenAnimationBuilder(
                    duration: const Duration(milliseconds: 300),
                    tween: Tween<double>(begin: 0.8, end: 1.0),
                    builder: (context, double value, child) {
                      return Transform.scale(
                        scale: value,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            title,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.headerColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  // Content
                  Expanded(
                    child: ListView(
                      controller: controller,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: content,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  /// Property Information bottom sheet
  void _showPropertyInfoBottomSheet(BuildContext context) {
    // Sample property information
    final List<Map<String, String>> infoItems = [
      {'label': 'Listing Type', 'value': propertyInfo.listingType},
      {'label': 'Building Type', 'value': propertyInfo.buildingType},
      {'label': 'Locality', 'value': propertyInfo.locality},
      {'label': 'Property Type', 'value': propertyInfo.propertyType},
      {'label': 'City', 'value': propertyInfo.city},
      {'label': 'Price', 'value': propertyInfo.price},
      {'label': 'Age of Property', 'value': '${propertyInfo.ageOfProperty} years'},
      {'label': 'Covered Parking', 'value': propertyInfo.coveredParking},
      {'label': 'Flooring', 'value': propertyInfo.flooring},
      {'label': 'Tower/Block', 'value': propertyInfo.towerBlock},
      {'label': 'Possession Status', 'value': propertyInfo.possessionStatus},
      {'label': 'Furnishing Status', 'value': propertyInfo.furnishingStatus},
      {'label': 'Total Area', 'value': '1935 sq. ft.'},
      {'label': 'Built-up Area', 'value': '1800 sq. ft.'},
      {'label': 'Carpet Area', 'value': '1500 sq. ft.'},
      {'label': 'Balcony Area', 'value': '120 sq. ft.'},
      {'label': 'Construction Year', 'value': '2020'},
      {'label': 'Maintenance Charges', 'value': '₹ 3,500 per month'},
      {'label': 'Property Tax', 'value': '₹ 20,000 per year'},
      {'label': 'Registration Charges', 'value': '5% of property value'},
      {'label': 'Stamp Duty', 'value': '7% of property value'},
    ];

    final List<Widget> contentWidgets = infoItems.asMap().entries.map((entry) {
      final int index = entry.key;
      final item = entry.value;

      // Animated item with staggered delay based on position
      return TweenAnimationBuilder(
        duration: Duration(milliseconds: 300 + (index * 30)), // Staggered animation
        tween: Tween<double>(begin: 0.0, end: 1.0),
        builder: (context, double value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, 20 * (1 - value)),
              child: _buildInfoDetailRow(item['label']!, item['value']!),
            ),
          );
        },
      );
    }).toList();

    _showViewAllBottomSheet(context, 'Property Information', contentWidgets);
  }

  /// Widget for property information row
  Widget _buildInfoDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.btnLightRed,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Amenities bottom sheet
  void _showAmenitiesBottomSheet(BuildContext context) {
    // Extended amenities list
    final allAmenities = [
      ...amenities,
      AmenityModel(title: 'Club House', icon: Icons.sports_tennis),
      AmenityModel(title: 'Indoor Games', icon: Icons.sports_esports),
      AmenityModel(title: 'WiFi Connectivity', icon: Icons.wifi),
      AmenityModel(title: 'Jogging Track', icon: Icons.directions_run),
      AmenityModel(title: 'Children\'s Play Area', icon: Icons.child_care),
      AmenityModel(title: 'Meditation Center', icon: Icons.spa),
      AmenityModel(title: 'Library', icon: Icons.menu_book),
      AmenityModel(title: 'Multipurpose Hall', icon: Icons.event_seat),
      AmenityModel(title: 'Grocery Shop', icon: Icons.shopping_cart),
    ];

    final List<Widget> contentWidgets = [];

    // Group amenities into rows of 2 for better presentation
    for (int i = 0; i < allAmenities.length; i += 2) {
      final List<Widget> rowItems = [];

      // Add the first item
      rowItems.add(
        TweenAnimationBuilder(
          duration: Duration(milliseconds: 300 + (i * 50)),
          tween: Tween<double>(begin: 0.0, end: 1.0),
          builder: (context, double value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(20 * (1 - value), 0),
                child: _buildAmenityDetailItem(allAmenities[i]),
              ),
            );
          },
        ),
      );

      // Add second item if available
      if (i + 1 < allAmenities.length) {
        rowItems.add(
          TweenAnimationBuilder(
            duration: Duration(milliseconds: 300 + ((i+1) * 50)),
            tween: Tween<double>(begin: 0.0, end: 1.0),
            builder: (context, double value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(-20 * (1 - value), 0),
                  child: _buildAmenityDetailItem(allAmenities[i+1]),
                ),
              );
            },
          ),
        );
      } else {
        // Add an empty space for odd number of items
        rowItems.add(SizedBox(width: (MediaQuery.of(context).size.width - 60) / 2));
      }

      contentWidgets.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: rowItems,
          ),
        ),
      );
    }

    _showViewAllBottomSheet(context, 'All Amenities', contentWidgets);
  }

  /// Widget for amenity item
  Widget _buildAmenityDetailItem(AmenityModel amenity) {
    return Container(
      width: (MediaQuery.of(context).size.width - 60) / 2,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryBtnLigRed.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: AppColors.secondaryBtnLigRed.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.secondaryBtnLigRed.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              amenity.icon,
              color: AppColors.btnLightRed,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              amenity.title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  /// Convenience bottom sheet
  void _showConvenienceBottomSheet(BuildContext context) {
    // Extended convenience list
    final allConvenience = [
      ...convenience,
      ConvenienceModel(title: 'Pharmacy', icon: Icons.local_pharmacy),
      ConvenienceModel(title: 'Petrol Pump', icon: Icons.local_gas_station),
      ConvenienceModel(title: 'Bus Stop', icon: Icons.directions_bus),
      ConvenienceModel(title: 'Railway Station', icon: Icons.train),
      ConvenienceModel(title: 'Airport', icon: Icons.airplanemode_active),
      ConvenienceModel(title: 'Bank', icon: Icons.account_balance),
      ConvenienceModel(title: 'Park', icon: Icons.park),
    ];

    final List<Widget> contentWidgets = allConvenience.asMap().entries.map((entry) {
      final int index = entry.key;
      final item = entry.value;

      return TweenAnimationBuilder(
        duration: Duration(milliseconds: 300 + (index * 50)),
        tween: Tween<double>(begin: 0.0, end: 1.0),
        builder: (context, double value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, 20 * (1 - value)),
              child: _buildConvenienceDetailItem(item),
            ),
          );
        },
      );
    }).toList();

    _showViewAllBottomSheet(context, 'All Conveniences', contentWidgets);
  }

  /// Widget for convenience item
  Widget _buildConvenienceDetailItem(ConvenienceModel item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.bgColors.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.secondaryBtnLigRed.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              item.icon,
              color: AppColors.btnLightRed,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              item.title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
            ),
          ),
          Icon(
            Icons.check_circle,
            color: AppColors.btnDarkRed,
            size: 20,
          ),
        ],
      ),
    );
  }

  /// Technical Specifications bottom sheet
  void _showSpecificationsBottomSheet(BuildContext context) {
    // Example specifications data
    final List<Map<String, String>> specs = [
      {'label': 'Master Bedroom - walls', 'value': 'Oil Bound Distemper'},
      {'label': 'Master Bedroom - Flooring', 'value': 'Vitrified Tiles'},
      {'label': 'Other Bedroom - flooring', 'value': 'Vitrified Tiles'},
      {'label': 'Kitchen - flooring', 'value': 'Ceramic Tiles'},
      {'label': 'Bathroom - flooring', 'value': 'Anti-skid Ceramic Tiles'},
      {'label': 'Balcony - flooring', 'value': 'Anti-skid Ceramic Tiles'},
      {'label': 'Kitchen - walls', 'value': 'Ceramic Tiles up to 2 ft. height above platform'},
      {'label': 'Kitchen - countertop', 'value': 'Granite'},
      {'label': 'Doors', 'value': 'Flush Doors'},
      {'label': 'Windows', 'value': 'Aluminum sliding windows with mosquito mesh'},
      {'label': 'Electrical', 'value': 'Concealed copper wiring with modular switches'},
      {'label': 'Water Supply', 'value': '24x7 municipal and borewell water'},
      {'label': 'Structure', 'value': 'RCC framed structure with earthquake resistance'},
      {'label': 'External Finish', 'value': 'Weather-proof exterior paint'},
      {'label': 'Internal Finish', 'value': 'Emulsion paint'},
      {'label': 'Plumbing', 'value': 'CPVC pipes for water supply, UPVC pipes for drainage'},
    ];

    final List<Widget> contentWidgets = specs.asMap().entries.map((entry) {
      final int index = entry.key;
      final spec = entry.value;

      return TweenAnimationBuilder(
        duration: Duration(milliseconds: 300 + (index * 30)),
        tween: Tween<double>(begin: 0.0, end: 1.0),
        builder: (context, double value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, 15 * (1 - value)),
              child: _buildSpecDetailRow(spec['label']!, spec['value']!),
            ),
          );
        },
      );
    }).toList();

    _showViewAllBottomSheet(context, 'Technical Specifications', contentWidgets);
  }

  /// Widget for specification row
  Widget _buildSpecDetailRow(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.bgColors.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: AppColors.secondaryBtnLigRed,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.home_repair_service,
              color: Colors.white,
              size: 20,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.btnDarkRed,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Nearby Places bottom sheet
  void _showNearbyPlacesBottomSheet(BuildContext context) {
    // Example data for nearby places by category
    final Map<String, List<Map<String, String>>> categories = {
      'Schools': [
        {'name': 'Delhi Public School', 'distance': '1.2 km', 'type': 'School'},
        {'name': 'St. Xavier\'s School', 'distance': '2.0 km', 'type': 'School'},
        {'name': 'Kendriya Vidyalaya', 'distance': '3.5 km', 'type': 'School'},
      ],
      'Hospitals': [
        {'name': 'City Hospital', 'distance': '2.5 km', 'type': 'Hospital'},
        {'name': 'Apollo Hospital', 'distance': '4.0 km', 'type': 'Hospital'},
        {'name': 'Max Healthcare', 'distance': '5.2 km', 'type': 'Hospital'},
      ],
      'Shopping': [
        {'name': 'Central Mall', 'distance': '3.8 km', 'type': 'Shopping'},
        {'name': 'City Center Mall', 'distance': '5.0 km', 'type': 'Shopping'},
        {'name': 'Metro Bazaar', 'distance': '2.8 km', 'type': 'Shopping'},
      ],
      'Restaurants': [
        {'name': 'Food Paradise', 'distance': '1.0 km', 'type': 'Restaurant'},
        {'name': 'Spice Garden', 'distance': '1.5 km', 'type': 'Restaurant'},
        {'name': 'Royal Cuisine', 'distance': '2.2 km', 'type': 'Restaurant'},
      ],
      'Transportation': [
        {'name': 'Metro Station', 'distance': '1.5 km', 'type': 'Transportation'},
        {'name': 'Bus Terminal', 'distance': '2.0 km', 'type': 'Transportation'},
        {'name': 'Railway Station', 'distance': '5.5 km', 'type': 'Transportation'},
      ],
    };

    // Create content with staggered animations
    final List<Widget> contentWidgets = [];
    int indexOffset = 0;

    categories.forEach((category, places) {
      // Add category title
      contentWidgets.add(
        TweenAnimationBuilder(
          duration: Duration(milliseconds: 300 + (indexOffset * 50)),
          tween: Tween<double>(begin: 0.0, end: 1.0),
          builder: (context, double value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 20 * (1 - value)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    category,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.btnDarkRed,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );

      indexOffset++;

      // Add places for this category
      places.asMap().forEach((placeIndex, place) {
        contentWidgets.add(
          TweenAnimationBuilder(
            duration: Duration(milliseconds: 300 + ((indexOffset + placeIndex) * 50)),
            tween: Tween<double>(begin: 0.0, end: 1.0),
            builder: (context, double value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.bgColors.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                place['name']!,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.btnDarkRed,
                                ),
                              ),
                              Text(
                                place['type']!,
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
                            color: AppColors.secondaryBtnLigRed.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            place['distance']!,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.btnDarkRed,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      });

      indexOffset += places.length;
    });

    _showViewAllBottomSheet(context, 'Nearby Places', contentWidgets);
  }

  Widget _buildScheduleTourButton() {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Positioned(
          bottom: 24 * value,
          right: 24,
          child: Transform.scale(
            scale: value,
            child: FloatingActionButton.extended(
              onPressed: _scrollToScheduleTour,
              backgroundColor: AppColors.btnDarkRed,
              elevation: 4,
              icon: const Icon(Icons.event_available),
              label: Text(
                'Schedule Tour',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _scrollToSection(GlobalKey key) {
    int index = -1;
    for (int i = 0; i < _tabItems.length; i++) {
      if (_tabItems[i]["key"] == key) {
        index = i;
        break;
      }
    }

    if (index >= 0) {
      _scrollManager.scrollToSectionByIndex(index);
    }
  }

  String? _getYoutubeVideoId(String? url) {
    if (url == null || url.isEmpty) return null;
    if (url.contains('youtube.com') || url.contains('youtu.be')) {
      return YoutubePlayer.convertUrlToId(url);
    }
    return null;
  }

  void _initializeWebView() {
    try {
      String? mapContent = widget.property!.map;
      if (mapContent != null && mapContent.isNotEmpty) {
        String iframeHtml = _getMapHtml(mapContent);

        final String htmlContent = '''
          <!DOCTYPE html>
          <html>
            <head>
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
              <style>
                body { 
                  margin: 0; 
                  padding: 0; 
                  display: flex;
                  justify-content: center;
                  align-items: center;
                  height: 100vh;
                }
                iframe { 
                  width: 100%; 
                  height: 100%; 
                  border: 0;
                  max-width: 100%;
                  max-height: 100%;
                  border-radius: 12px;
                }
              </style>
            </head>
            <body>
              $iframeHtml
            </body>
          </html>
        ''';

        _mapController = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onPageFinished: (String url) {
                if (mounted) {
                  setState(() {
                    isMapLoading = false;
                  });
                }
              },
              onWebResourceError: (WebResourceError error) {
                debugPrint('WebView error: ${error.description}');
                if (mounted) {
                  setState(() {
                    isMapLoading = false;
                  });
                }
              },
            ),
          )
          ..loadHtmlString(htmlContent);
      }
    } catch (e) {
      debugPrint('Error initializing WebView: $e');
      if (mounted) {
        setState(() {
          isMapLoading = false;
        });
      }
    }
  }

  String _getMapHtml(String? mapContent) {
    if (mapContent == null || mapContent.isEmpty) return '';

    // If it's already an iframe, use it directly
    if (mapContent.trim().startsWith('<iframe')) {
      return mapContent;
    }

    // If it's a URL, create an iframe for it
    if (mapContent.startsWith('http')) {
      return '''
        <iframe 
          src="$mapContent" 
          width="600" 
          height="450" 
          style="border:0; border-radius: 12px;" 
          allowfullscreen="" 
          loading="lazy" 
          referrerpolicy="no-referrer-when-downgrade">
        </iframe>
      ''';
    }

    return mapContent;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _tabController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Apply background color from AppColors
      // backgroundColor: AppColors.bgColor,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: child,
                );
              },
              child: CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // App Bar with Property Image Carousel
                  _buildSliverAppBar(),

                  // Main Content
                  SliverList(
                    delegate: SliverChildListDelegate([
                      // Overview Section
                      _buildPropertyHeader(),
                      _buildOverviewSection(),

                      // Property Information Section
                      Container(
                        key: _propertyInfoKey,
                        margin: const EdgeInsets.only(top: 16),
                        child: PropertyInformationCard(
                          propertyInfo: propertyInfo,
                          onViewAll: () {
                            _showPropertyInfoBottomSheet(context);
                          },
                        ),
                      ),

                      // Amenities Section
                      Container(
                        key: _amenitiesKey,
                        child: _buildAmenitiesSection(),
                      ),

                      // Convenience Section
                      Container(
                        key: _convenienceKey,
                        child: _buildConvenienceSection(),
                      ),

                      // Technical Specifications Section
                      Container(
                        key: _specificationKey,
                        child: _buildSpecificationsSection(),
                      ),

                      // Location & Landmark Section
                      Container(
                        key: _locationKey,
                        child: _buildLocationSection(),
                      ),

                      // Media Section
                      Container(
                        key: _mediaKey,
                        child: _buildMediaSection(),
                      ),

                      _buildScheduleTourSection(),
                      // Enquiry Button
                      _buildEnquiryButton(),

                      const SizedBox(height: 100),
                    ]),
                  ),
                ],
              ),
            ),

            // Back Button
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              left: 16,
              child: Container(
                decoration: BoxDecoration(
                  color:Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),

            // Favorite Button
            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              right: 16,
              child: Obx(() {
                final bool isFavorite = favoriteController.isPropertyFavorite(widget.property!.id);
                return TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.8, end: 1.0),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.elasticOut,
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: isFavorite ? value : 1.0,
                      child: GestureDetector(
                        onTap: () {
                          if (getStringAsync(emailMobile).isEmpty) {
                            _showLoginDialog();
                            return;
                          }
                          HapticFeedback.mediumImpact();
                          favoriteController.toggleFavorite(context, widget.property!.id);
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: AppColors.btnDarkRed,
                            size: 24,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),

            // Sticky tabs
            if (_showTabs)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      indicatorColor: AppColors.headerColor,
                      indicatorWeight: 3,
                      labelColor: AppColors.headerColor,
                      unselectedLabelColor: Colors.grey,
                      tabs: _tabItems.map((item) {
                        return Tab(
                          text: item["title"],
                          icon: Icon(item["icon"]),
                        );
                      }).toList(),
                      onTap: (index) {
                        print('Tab tapped: $index');
                        setState(() {
                          _selectedTabIndex = index;
                        });

                        // For "Schedule Tour" tab, use the specific method
                        if (index == _tabItems.length - 1) {
                          _scrollToScheduleTour();
                        } else {
                          _scrollToSection(_tabItems[index]["key"]);
                        }
                      },
                    ),
                  ),
                ),
              ),
            // Schedule Tour Floating Button
            // _buildScheduleTourButton(),
          ],
        ),
      ),
    );
  }

  // Add this helper method to make sure the section is visible
  void _ensureSectionVisible(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOutQuint,
        alignment: 0.1, // Aligns the section at 10% from the top
      );
      HapticFeedback.mediumImpact();
    }
  }

  Widget _buildScheduleTourSection() {
    return Container(
      key: _scheduleTourKey, // Add the key here for scrolling reference
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.btnDarkRed.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Tour scheduling form
          ScheduleTourSection(
            propertyName: widget.property!.name,
            onSubmit: (date, time, tourType, name, phone, email, message) {
              // Handle submission logic
              // You can connect to your backend API here

              // Show success message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Tour request submitted successfully!',
                    style: GoogleFonts.poppins(),
                  ),
                  backgroundColor: AppColors.btnDarkRed,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 16),

        ],
      ),
    );
  }

  // Add a floating button to scroll to the tour section

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 250.0,
      floating: false,
      pinned: true,
      // backgroundColor: AppColors.appBarColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: _buildCarouselWithIndicator(),
    );
  }

  Widget _buildCarouselWithIndicator() {
    final List<String> images = widget.property!.images;
    final CarouselController carouselController = CarouselController();
    final RxInt currentIndex = 0.obs;

    return Stack(
      children: [
        FlexibleSpaceBar(
          background: GestureDetector(
            onTap: () {
              setState(() {
                _isImageExpanded = !_isImageExpanded;
              });
              if (_isImageExpanded) {
                _showFullScreenGallery(context, images);
              }
            },
            child: CarouselSlider(
              // Using only the options parameter, not both controllers
              options: CarouselOptions(
                height: 300,
                viewportFraction: 1.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                aspectRatio: 16 / 9,
                onPageChanged: (index, reason) {
                  currentIndex.value = index;
                },
              ),
              items: images.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                      ),
                      child: Hero(
                        tag: 'property-image-${images.indexOf(url)}',
                        child: CachedNetworkImage(
                          imageUrl: url,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                          errorWidget: (context, url, error) => const Center(
                            child: Icon(Icons.error, color: Colors.red),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ),

        // Carousel Indicators
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                // Simplified indicator without controller interactions
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex.value == entry.key
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                );
              }).toList(),
            );
          }),
        ),

        // Image Count Indicator
        Positioned(
          bottom: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.btnDarkRed.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Obx(() {
              return Text(
                '${currentIndex.value + 1}/${images.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
          ),
        ),

        // Gradient Overlay
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showFullScreenGallery(BuildContext context, List<String> images) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenGallery(images: images),
      ),
    );
  }

  Widget _buildPropertyHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.btnLightRed.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        key: _overviewKey,
        children: [
          Text(
            widget.property!.name,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              // color: AppColors.btnDarkRed,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: AppColors.btnLightRed),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  widget.property!.location,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹ ${widget.property!.price}',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.headerColor,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBtnLigRed.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.btnLightRed,
                    width: 1,
                  ),
                ),
                child: Text(
                  widget.property!.category,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.btnDarkRed,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildOverviewSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.btnLightRed.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Property Overview',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.headerColor,
            ),
          ),
          const SizedBox(height: 16),
          _buildPremiumInfoRow(
            'Configurations',
            '3 BedRoom + Study Room',
            Icons.bed,
            AppColors.secondaryBtnLigRed,
            AppColors.btnLightRed,
          ),
          const SizedBox(height: 12),
          _buildPremiumInfoRow(
            'Unit Sizes',
            '1935 - 3510 Sq. Ft.(Saleable)',
            Icons.straighten,
            AppColors.secondaryBtnLigRed,
            AppColors.btnLightRed,
          ),
          const SizedBox(height: 12),
          _buildPremiumInfoRow(
            'Builder',
            'Balaji Group',
            Icons.business,
            AppColors.secondaryBtnLigRed,
            AppColors.btnLightRed,
          ),
          const SizedBox(height: 12),
          _buildPremiumInfoRow(
            'Total Units',
            '150',
            Icons.apartment,
            AppColors.secondaryBtnLigRed,
            AppColors.btnLightRed,
          ),
          const SizedBox(height: 12),
          _buildPremiumInfoRow(
            'Project Status',
            'Under Construction',
            Icons.construction,
            AppColors.secondaryBtnLigRed,
            AppColors.btnLightRed,
          ),
          const SizedBox(height: 16),
          _buildViewAllButton(() {
            _showProjectDetailsBottomSheet(context);
          }),
        ],
      ),
    );
  }

  Widget _buildPremiumInfoRow(
      String label,
      String value,
      IconData icon,
      Color bgColor,
      Color iconColor,
      ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.bgColors.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    // color: AppColors.btnDarkRed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmenitiesSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.btnLightRed.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Amenities',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.headerColor,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.1,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: math.min(amenities.length, 6), // Show up to 6 amenities
            itemBuilder: (context, index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300 + (index * 100)),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.btnLightRed.withOpacity(0.15),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  border: Border.all(
                    color: AppColors.secondaryBtnLigRed,
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBtnLigRed.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        amenities[index].icon,
                        color: AppColors.btnLightRed,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      amenities[index].title,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildViewAllButton(() {_showAmenitiesBottomSheet(context);
          }),
        ],
      ),
    );
  }

  Widget _buildConvenienceSection() {
    // Show a maximum of 6 items initially
    final displayedItems = convenience.take(6).toList();

    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.btnLightRed.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Convenience',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.headerColor,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: displayedItems.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;

              return AnimatedContainer(
                duration: Duration(milliseconds: 300 + (index * 100)),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.bgColors.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBtnLigRed.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          item.icon,
                          color: AppColors.btnLightRed,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          item.title,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                      Icon(
                        Icons.check_circle,
                        color: AppColors.btnDarkRed,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          _buildViewAllButton(() {
            _showConvenienceBottomSheet(context);
          }),
        ],
      ),
    );
  }

  Widget _buildSpecificationsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.btnLightRed.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Technical Specifications',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.headerColor,
            ),
          ),
          const SizedBox(height: 16),
          _buildSpecRow(
            'Master Bedroom - walls',
            'Oil Bound Distemper',
            AppColors.secondaryBtnLigRed,
            Icons.now_wallpaper_outlined,
          ),
          const SizedBox(height: 12),
          _buildSpecRow(
            'Master Bedroom - Flooring',
            'Vitrified Tiles',
            AppColors.secondaryBtnLigRed,
            Icons.grid_4x4,
          ),
          const SizedBox(height: 12),
          _buildSpecRow(
            'Other Bedroom - flooring',
            'Vitrified Tiles',
            AppColors.secondaryBtnLigRed,
            Icons.grid_on,
          ),
          const SizedBox(height: 16),
          _buildViewAllButton(() {
            // Handle view all specs action
            _showSpecificationsBottomSheet(context);
          }),
        ],
      ),
    );
  }

  Widget _buildSpecRow(
      String label,
      String value,
      Color bgColor,
      IconData icon,
      ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.bgColors.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.btnLightRed),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    // color: AppColors.btnDarkRed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.btnLightRed.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location & Landmark',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.headerColor,
            ),
          ),
          const SizedBox(height: 16),

          // Map Section
          if (widget.property!.map != null && widget.property!.map!.isNotEmpty)
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 300,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.btnDarkRed.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    WebViewWidget(controller: _mapController),
                    if (isMapLoading)
                      Container(
                        color: AppColors.bgColor,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.btnDarkRed,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

          // Nearby Places Categories
          _buildNearbyCategories(),

          // Nearby Places List
          _buildNearbyPlacesList(),

          const SizedBox(height: 16),
          _buildViewAllButton(() {
            // Handle view all locations action
            _showNearbyPlacesBottomSheet(context);
          }),
        ],
      ),
    );
  }

  Widget _buildNearbyCategories() {
    final categories = ['School', 'Hospital', 'Shopping', 'Restaurant', 'Metro'];
    final icons = [
      Icons.school,
      Icons.local_hospital,
      Icons.shopping_bag,
      Icons.restaurant,
      Icons.train,
    ];

    final RxString selectedCategory = 'School'.obs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            'Nearby Places',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.btnDarkRed,
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Obx(() {
                final isSelected = selectedCategory.value == categories[index];
                return GestureDetector(
                  onTap: () {
                    selectedCategory.value = categories[index];
                    HapticFeedback.lightImpact();
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 16),
                    padding: const EdgeInsets.all(8),
                    width: 80,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.secondaryBtnLigRed
                          : AppColors.bgColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.btnLightRed
                            : Colors.grey[300]!,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icons[index],
                          color: isSelected ? AppColors.btnDarkRed : Colors.grey,
                          size: 28,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          categories[index],
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: isSelected ? AppColors.btnDarkRed : Colors.grey[700],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNearbyPlacesList() {
    // Example data for nearby places
    final places = [
      {
        'name': 'Delhi Public School',
        'distance': '1.2 km',
        'type': 'School',
      },
      {
        'name': 'City Hospital',
        'distance': '2.5 km',
        'type': 'Hospital',
      },
      {
        'name': 'Central Mall',
        'distance': '3.8 km',
        'type': 'Shopping',
      },
    ];

    return Column(
      children: places.map((place) {
        return Container(
          margin: const EdgeInsets.only(top: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.bgColors.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place['name']!,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.btnDarkRed,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      place['type']!,
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
                  color: AppColors.secondaryBtnLigRed.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  place['distance']!,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.btnDarkRed,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMediaSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.btnLightRed.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Property Images & Video',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.headerColor,
            ),
          ),
          const SizedBox(height: 16),

          // Improved Image Gallery
          _buildImageGallery(),

          // YouTube Video if available
          if (videoId != null)
            Container(
              margin: const EdgeInsets.only(top: 24),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.btnDarkRed.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      'Property Video',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.btnDarkRed,
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: videoId!,
                        flags: const YoutubePlayerFlags(
                          autoPlay: false,
                          mute: false,
                          hideControls: false,
                          hideThumbnail: false,
                          disableDragSeek: false,
                          enableCaption: true,
                        ),
                      ),
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: AppColors.btnDarkRed,
                      progressColors: ProgressBarColors(
                        playedColor: AppColors.btnDarkRed,
                        handleColor: AppColors.btnLightRed,
                      ),
                      thumbnail: Image.network(
                        'https://img.youtube.com/vi/$videoId/0.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildImageGallery() {
    final List<String> images = widget.property!.images;

    if (images.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First image taking full width
        if (images.isNotEmpty)
          GestureDetector(
            onTap: () => _showFullScreenGallery(context, images),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.btnDarkRed.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Hero(
                tag: 'property-image-0',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: images[0],
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ),

        const SizedBox(height: 12),

        // Remaining images in grid
        if (images.length > 1)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemCount: math.min(images.length - 1, 5), // Show up to 5 more images
            itemBuilder: (context, index) {
              final imageIndex = index + 1; // Skip the first image

              // Special handling for the last visible item when there are more images
              final bool isLastVisible = index == 4 && images.length > 6;

              return GestureDetector(
                onTap: () => _showFullScreenGallery(context, images),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.btnLightRed.withOpacity(0.15),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Hero(
                          tag: 'property-image-$imageIndex',
                          child: CachedNetworkImage(
                            imageUrl: images[imageIndex],
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          ),
                        ),

                        // Show "+X more" overlay on the last visible item if there are more images
                        if (isLastVisible)
                          Container(
                            color: AppColors.btnDarkRed.withOpacity(0.7),
                            child: Center(
                              child: Text(
                                '+${images.length - 6} more',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }

  Widget _buildEnquiryButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ElevatedButton(
        onPressed: () {
          HapticFeedback.mediumImpact();
          _showEnquiryForm();
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.btnDarkRed,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              'ENQUIRE NOW',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            Positioned(
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewAllButton(VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondaryBtnLigRed),
          borderRadius: BorderRadius.circular(8),
          color: AppColors.bgColors.withOpacity(0.3),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'View All',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.btnDarkRed,
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.arrow_forward,
              size: 16,
              color: AppColors.btnDarkRed,
            ),
          ],
        ),
      ),
    );
  }

  void _showEnquiryForm() {
    // Check if user is logged in
    if (getStringAsync(emailMobile).isEmpty) {
      _showLoginDialog();
      return;
    }

    // Get user details from local storage
    final String name = getStringAsync(userName);
    final String id = getStringAsync(userId);
    final String mobile = getStringAsync(emailMobile);
    final String email = getStringAsync(emailMobile);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Submit Enquiry',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.headerColor,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Property: ${widget.property!.name}',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: TextEditingController(text: name),
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(color: AppColors.btnLightRed),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.secondaryBtnLigRed),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.secondaryBtnLigRed),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.btnLightRed),
                        ),
                        filled: true,
                        fillColor: AppColors.bgColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: TextEditingController(text: mobile),
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Mobile',
                        labelStyle: TextStyle(color: AppColors.btnLightRed),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.secondaryBtnLigRed),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.secondaryBtnLigRed),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.btnLightRed),
                        ),
                        filled: true,
                        fillColor: AppColors.bgColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: TextEditingController(text: email),
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: AppColors.btnLightRed),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.secondaryBtnLigRed),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.secondaryBtnLigRed),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.btnLightRed),
                        ),
                        filled: true,
                        fillColor: AppColors.bgColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Show loading dialog
                          Get.dialog(
                            Dialog(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.btnDarkRed,
                                ),
                              ),
                            ),
                            barrierDismissible: false,
                          );

                          // Submit enquiry
                          Get.find<EnquiryController>().userEnquiry(
                            context,
                            name,
                            id,
                            mobile,
                            email,
                            widget.property!.id,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: AppColors.btnDarkRed,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Submit Enquiry',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showLoginDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Login Required',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: AppColors.headerColor,
            ),
          ),
          content: Text(
            'Please login to continue with this action.',
            style: GoogleFonts.poppins(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  color: Colors.grey[700],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Navigate to login screen
                // Replace with your actual login navigation
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Navigating to login page')),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppColors.btnDarkRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Login',
                style: GoogleFonts.poppins(),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showProjectDetailsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          maxChildSize: 0.95,
          minChildSize: 0.5,
          builder: (_, controller) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.btnDarkRed.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Drag handle
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.btnLightRed.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView(
                        controller: controller,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Text(
                            'Project Overview',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.headerColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildProjectDetailRow('Project Status', 'Mid Stage'),
                          _buildProjectDetailRow('Configurations', '2,3 BHK'),
                          _buildProjectDetailRow('Unit Sizes', '915 – 1450 Sq. Ft. (Saleable)'),
                          _buildProjectDetailRow('Builder', 'Balaji Group Vizag'),
                          _buildProjectDetailRow('Total Units', '150'),
                          _buildProjectDetailRow('Project Size', '1.44 Acres'),
                          _buildProjectDetailRow('Launch Date', 'Ask for Details'),
                          _buildProjectDetailRow('Completion Date', 'Ask for Details'),
                          _buildProjectDetailRow('Locality', 'Sujatha Nagar'),
                          _buildProjectDetailRow('Micro Market', 'Vizag North'),

                          const SizedBox(height: 16),
                          Divider(color: AppColors.secondaryBtnLigRed),
                          const SizedBox(height: 16),

                          Text(
                            'Project Description',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.btnDarkRed,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Balaji Paradise Apartments Vizag in Seethammadhara, Visakhapatnam, by Balaji Construction Company, is a residential ready-to-move project. The project is strategically located around all important hubs in proximity. It offers different types like Studio Apartment / 2 BHK / 3 BHK / 4 BHK Multistorey Apartment with all basic amenities and is approved by major banks like SBI, HDFC, Axis Bank, ICICI, Yes Bank, and more.',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              height: 1.5,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildProjectDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.btnLightRed,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Full Screen Gallery Page
class FullScreenGallery extends StatefulWidget {
  final List<String> images;

  const FullScreenGallery({Key? key, required this.images}) : super(key: key);

  @override
  _FullScreenGalleryState createState() => _FullScreenGalleryState();
}

class _FullScreenGalleryState extends State<FullScreenGallery> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Images
          GestureDetector(
            onTap: () {
              // Toggle controls visibility
            },
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: CachedNetworkImageProvider(widget.images[index]),
                  initialScale: PhotoViewComputedScale.contained,
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  maxScale: PhotoViewComputedScale.covered * 2,
                  heroAttributes: PhotoViewHeroAttributes(
                    tag: 'property-image-$index',
                  ),
                );
              },
              itemCount: widget.images.length,
              loadingBuilder: (context, event) => Center(
                child: CircularProgressIndicator(
                  value: event == null
                      ? 0
                      : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                  color: AppColors.btnLightRed,
                ),
              ),
              pageController: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),

          // App Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: AppColors.btnDarkRed.withOpacity(0.7),
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                'Image ${_currentIndex + 1} of ${widget.images.length}',
                style: GoogleFonts.poppins(),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {
                    // Share functionality
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sharing image...')),
                    );
                  },
                ),
              ],
            ),
          ),

          // Bottom controls
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Thumbnails
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.images.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _currentIndex == index
                                  ? AppColors.btnLightRed
                                  : Colors.transparent,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: CachedNetworkImage(
                              imageUrl: widget.images[index],
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                color: Colors.grey[800],
                              ),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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

// Agent info widget
class AgentInfoWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onChat;
  final VoidCallback onWhatsApp;
  final VoidCallback onCall;

  const AgentInfoWidget({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.onChat,
    required this.onWhatsApp,
    required this.onCall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: AppColors.secondaryBtnLigRed.withOpacity(0.3),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: AppColors.secondaryBtnLigRed.withOpacity(0.3),
                    child: Icon(Icons.person, color: AppColors.btnLightRed),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.btnDarkRed,
                      ),
                    ),
                    Text(
                      'Property Agent',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onChat,
                  icon: const Icon(Icons.chat_bubble_outline, size: 18),
                  label: const Text('Chat'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.btnDarkRed,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onWhatsApp,
                  icon: const Icon(Icons.phone, size: 18),
                  label: const Text('WhatsApp'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.btnLightRed,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.btnDarkRed.withOpacity(0.1),
                ),
                child: IconButton(
                  onPressed: onCall,
                  icon: Icon(Icons.call, color: AppColors.btnDarkRed),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class ScrollManager {
  final ScrollController scrollController;
  final TabController tabController;
  final List<Map<String, dynamic>> tabItems;
  final BuildContext context;
  final Function(int) onTabChanged;

  ScrollManager({
    required this.scrollController,
    required this.tabController,
    required this.tabItems,
    required this.context,
    required this.onTabChanged,
  });

  /// Scroll to section with reliable positioning
  void scrollToSection(GlobalKey key, int tabIndex) {
    print("Scrolling to section: $tabIndex");

    // First update the tab selection
    if (tabController.index != tabIndex) {
      tabController.animateTo(tabIndex);
      onTabChanged(tabIndex);
    }

    // Then ensure the section is visible
    final targetContext = key.currentContext;
    if (targetContext != null) {
      // Use Scrollable.ensureVisible for maximum reliability
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOutQuint,
        alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
      ).then((_) {
        // Provide haptic feedback after scrolling is complete
        HapticFeedback.mediumImpact();
        print("Scroll completed to section: $tabIndex");
      });
    } else {
      print("Error: Context is null for section: $tabIndex");
    }
  }

  /// Scroll to a specific section by index
  void scrollToSectionByIndex(int index) {
    if (index >= 0 && index < tabItems.length) {
      scrollToSection(tabItems[index]["key"], index);
    }
  }

  /// Scroll to the schedule tour section specifically
  void scrollToScheduleTour() {
    final lastIndex = tabItems.length - 1;
    scrollToSectionByIndex(lastIndex);
  }

  /// Update active tab based on current scroll position
  void updateActiveTabBasedOnScroll() {
    // Skip if widget is no longer mounted
    if (!scrollController.hasClients) return;

    // Get all visible keys and their positions
    Map<int, double> visibilityScores = {};

    for (int i = 0; i < tabItems.length; i++) {
      final key = tabItems[i]["key"];
      final sectionContext = key.currentContext;

      if (sectionContext != null) {
        final RenderBox box = sectionContext.findRenderObject() as RenderBox;
        final position = box.localToGlobal(Offset.zero).dy;

        // Calculate how visible this section is in the viewport
        final mediaQuery = MediaQuery.of(context);
        final screenHeight = mediaQuery.size.height;
        final topPadding = mediaQuery.padding.top;

        // Calculate visibility score (higher = more visible)
        double visibilityScore = 0;

        if (position < topPadding) {
          // Section is above the viewport, score based on how close it is
          visibilityScore = position / topPadding;
        } else if (position < screenHeight / 2) {
          // Section is in the top half of screen, highest score
          visibilityScore = 1.0;
        } else if (position < screenHeight) {
          // Section is in the bottom half, score decreases
          visibilityScore = 1.0 - ((position - screenHeight / 2) / (screenHeight / 2));
        } else {
          // Section is below viewport
          visibilityScore = 0;
        }

        // Special case for last section (Schedule Tour)
        if (i == tabItems.length - 1) {
          // If near bottom of scroll, prioritize last section
          if (scrollController.offset > scrollController.position.maxScrollExtent - 300) {
            visibilityScore = 1.0; // Maximum priority
          }
        }

        visibilityScores[i] = visibilityScore;
      }
    }

    // Find the most visible section
    int mostVisibleIndex = 0;
    double highestScore = -1;

    visibilityScores.forEach((index, score) {
      if (score > highestScore) {
        highestScore = score;
        mostVisibleIndex = index;
      }
    });

    // Update tab if needed
    if (tabController.index != mostVisibleIndex) {
      tabController.animateTo(mostVisibleIndex);
      onTabChanged(mostVisibleIndex);
      print("Auto-updated tab to: $mostVisibleIndex (score: $highestScore)");
    }
  }
}
