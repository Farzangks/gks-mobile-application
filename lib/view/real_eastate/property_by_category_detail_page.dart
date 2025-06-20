import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:ghar_ka_sathi/component/builder_project_components/broucher_widget.dart';
import 'package:ghar_ka_sathi/component/builder_project_components/floor_plan_widget.dart';
import 'package:ghar_ka_sathi/component/property_details_components/real_eastate_propery_components/aminities_components.dart';
import 'package:ghar_ka_sathi/component/property_details_components/real_eastate_propery_components/convenience_component.dart';
import 'package:ghar_ka_sathi/component/property_details_components/real_eastate_propery_components/image_gallery_widget.dart';
import 'package:ghar_ka_sathi/controller/enquiry_controller.dart';
import 'package:ghar_ka_sathi/controller/favorite_controller.dart';
import 'package:ghar_ka_sathi/model/property_by_categories_model.dart';
import 'package:ghar_ka_sathi/view/real_eastate/property_detail_page.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/constant.dart';
import 'package:intl/intl.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PropertyByCategoryDetailPage extends StatefulWidget {
  const PropertyByCategoryDetailPage({super.key, this.allPropertyList});

  final PropertyByCategoriesModel? allPropertyList;

  @override
  State<PropertyByCategoryDetailPage> createState() => _PropertyByCategoryDetailPageState();
}

class _PropertyByCategoryDetailPageState extends State<PropertyByCategoryDetailPage> {
  final FavoriteController favoriteController = Get.find<FavoriteController>();
  late WebViewController _mapController;
  String? videoId;
  bool isMapLoading = true;
  int _selectedTabIndex = 0;
  bool _showTabs = false;
  String currentDateTime = '';
  String currentUser = '';

  // Scroll controller for main content
  late ScrollController _scrollController;

  // Section keys for scrolling
  final GlobalKey _overviewKey = GlobalKey();
  final GlobalKey _floorPlansKey = GlobalKey();
  final GlobalKey _reraInfoKey = GlobalKey();
  final GlobalKey _amenitiesKey = GlobalKey();
  final GlobalKey _convenienceKey = GlobalKey();
  final GlobalKey _specificationKey = GlobalKey();
  final GlobalKey _locationKey = GlobalKey();
  final GlobalKey _brochureKey = GlobalKey();
  final GlobalKey _mediaKey = GlobalKey();

  String selectedType = '2 BHK';
  final types = ['2 BHK', '3 BHK'];

  String selectedCat = 'School';
  final category = ['School', 'Hospital', 'Hotel', 'Business Hub', 'Shopping Center'];

  // List of tab items and their corresponding keys
  late List<Map<String, dynamic>> _tabItems;

  @override
  void initState() {
    super.initState();
    _initializeDateTime();
    videoId = _getYoutubeVideoId(widget.allPropertyList!.video);
    _initializeWebView();

    // Initialize scroll controller
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    // Initialize tab items
    _initializeTabItems();
  }

  void _initializeDateTime() {
    // Format the current date and time
    currentDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now().toUtc());
    currentUser = 'aniket-050'; // This would typically come from your auth system
  }

  void _initializeTabItems() {
    _tabItems = [
      {"title": "Overview", "key": _overviewKey},
      {"title": "Floor Plans", "key": _floorPlansKey},
      {"title": "RERA Info", "key": _reraInfoKey},
      {"title": "Amenities", "key": _amenitiesKey},
      {"title": "Convenience", "key": _convenienceKey},
      {"title": "Technical Specifications", "key": _specificationKey},
      {"title": "Location & Landmark", "key": _locationKey},
      {"title": "Brochure", "key": _brochureKey},
      {"title": "Property Image & Video", "key": _mediaKey},
    ];
  }

  void _updateActiveTabBasedOnScroll() {
    if (!mounted) return;

    final scrollPosition = _scrollController.offset;
    final viewportHeight = MediaQuery.of(context).size.height;

    // Get all section positions
    Map<int, double> sectionPositions = {};
    for (int i = 0; i < _tabItems.length; i++) {
      final context = _tabItems[i]["key"].currentContext;
      if (context != null) {
        final renderBox = context.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero).dy;
        sectionPositions[i] = position - viewportHeight * 0.2; // Add some offset for better UX
      }
    }

    // Find the current section
    // int newIndex = 0;
    // for (var entry in sectionPositions.entries) {
    //   if (scrollPosition >= entry.value) {
    //     newIndex = entry.key;
    //   }
    // }

    // if (_selectedTabIndex != newIndex) {
    //   setState(() {
    //     _selectedTabIndex = newIndex;
    //   });
    // }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset > 300 && !_showTabs) {
      setState(() {
        _showTabs = true;
      });
    } else if (_scrollController.offset <= 300 && _showTabs) {
      setState(() {
        _showTabs = false;
      });
    }
    _updateActiveTabBasedOnScroll();
  }

  // Sample data - in real app, this would come from an API
  final floorPlans = [
    FloorPlan(
      type: '2 BHK',
      area: 915,
      beds: 2,
      price: 38.43,
      imageUrl: 'assets/2bhk_plan.png',
    ),
  ];

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  String? _getYoutubeVideoId(String? url) {
    if (url == null || url.isEmpty) return null;
    if (url.contains('youtube.com') || url.contains('youtu.be')) {
      return YoutubePlayer.convertUrlToId(url);
    }
    return null;
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
          style="border:0;" 
          allowfullscreen="" 
          loading="lazy" 
          referrerpolicy="no-referrer-when-downgrade">
        </iframe>
      ''';
    }

    return mapContent;
  }

  void _initializeWebView() {
    try {
      String? mapContent = widget.allPropertyList!.map;
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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // Drag handle
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      controller: controller,
                      padding: const EdgeInsets.all(20),
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Text(
                          'Project Overview',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
                      ],
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
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _handleVirtualTour() {
    // Implement virtual tour functionality
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Virtual Tour'),
        content: const Text('Virtual tour functionality will be implemented here.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _handleContact() {
    // Implement contact functionality
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Contact'),
        content: const Text('Contact functionality will be implemented here.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  final amenities = [
    AmenityModel(title: 'Power Backup', icon: Icons.power),
    AmenityModel(title: '24 x 7 Security', icon: Icons.security),
    AmenityModel(title: 'Balcony', icon: Icons.balcony),
    AmenityModel(title: 'Pre-School', icon: Icons.school),
    AmenityModel(title: 'View of Landmark', icon: Icons.landscape),
    AmenityModel(title: 'Security Staff', icon: Icons.person),
  ];
  final convenience = [
    ConvenienceModel(title: 'Power Backup', icon: Icons.power),
    ConvenienceModel(title: '24 x 7 Security', icon: Icons.security),
    ConvenienceModel(title: 'Balcony', icon: Icons.balcony),
    ConvenienceModel(title: 'Pre-School', icon: Icons.school),
    ConvenienceModel(title: 'View of Landmark', icon: Icons.landscape),
    ConvenienceModel(title: 'Security Staff', icon: Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Main scrollable content
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Section
                  Stack(
                    children: [
                      PropertyCarouselSliderView(
                          bannerList: widget.allPropertyList!.images),
                    ],
                  ),
      
                  // Overview Section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      key: _overviewKey,
                      children: [
                        Text(
                          widget.allPropertyList!.name,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.allPropertyList!.location,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '₹ ${widget.allPropertyList!.price}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.grey),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                widget.allPropertyList!.category,
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            )),
                      ],
                    ),
                  ),
      
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Property Overview',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildInfoRow(
                      'Project Status', 'New Launch', Icons.home_work_outlined),
                  _buildInfoRow(
                      'Configuration', '3,4 BHK',
                      Icons.home_repair_service_outlined),
                  _buildInfoRow('Unit Sizes', '1935 -3510 Sq. Ft.(Saleable)',
                      Icons.photo_size_select_small_outlined),
                  _buildInfoRow('Builder', 'Demo', Icons.construction),
                  _buildInfoRow('Total Units', '1234', Icons.equalizer),
      
                  16.height,
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.95, // 90% width
                    child: OutlinedButton(
                      onPressed: () => _showProjectDetailsBottomSheet(context),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side:
                        BorderSide(color: Colors.black, width: 3), // Black border
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // No radius
                        ),
                      ),
                      child: Text(
                        'View All',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ).center(),
      
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      color: Colors.white, // White background color
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Heading
                          Text(
                            'About Balaji Paradise Apartments',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, // Black text color
                            ),
                          ),
                          SizedBox(height: 8),
                          // Tabs
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedTabIndex =
                                      0; // Select Project Overview tab
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    decoration: BoxDecoration(
                                      color: _selectedTabIndex == 0
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: _selectedTabIndex == 0 ? Colors
                                            .black : Colors.grey,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Project Overview',
                                        style: TextStyle(
                                          color: _selectedTabIndex == 0 ? Colors
                                              .white : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedTabIndex =
                                      1; // Select Why Invest tab
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    decoration: BoxDecoration(
                                      color: _selectedTabIndex == 1
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: _selectedTabIndex == 1 ? Colors
                                            .black : Colors.grey,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Why Invest',
                                        style: TextStyle(
                                          color: _selectedTabIndex == 1 ? Colors
                                              .white : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
      
                          // Description
                          Text(
                            'Balaji Paradise Apartments Vizag in Seethammadhara, Visakhapatnam, by Balaji Construction Company, is a residential ready-to-move project. The project is strategically located around all important hubs in proximity.',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 16),
      
                          // See More Button
                          TextButton(
                            onPressed: () {
                              // Handle "See More" action
                            },
                            child: Text(
                              'See More',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
      
                  // Floor Plans Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Floor Plans & Price',
                      key: _floorPlansKey,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloorPlanTypeSelector(
                      types: types,
                      selectedType: selectedType,
                      onTypeSelected: (type) {
                        setState(() {
                          selectedType = type;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...floorPlans
                      .where((plan) => plan.type == selectedType)
                      .map((plan) =>
                      FloorPlanCard(
                        plan: plan,
                        onVirtualTour: _handleVirtualTour,
                        onContact: _handleContact,
                      )),
      
                  // RERA Section
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      key: _reraInfoKey,
                      children: [
                        Text(
                          'RERA',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('RERA Reg.'),
                        Text(
                          'PRM/KA/RERA/1251/310/AG/171114/000400',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 8),
                        Text('Project RERA Reg.'),
                        Text(
                          'PRM/KA/RERA/1251/308/PR/140222/004708',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  // Amenities Section
                  Container(
                    key: _amenitiesKey,
                    child: AmenitiesSection(
                      amenities: amenities,
                      onViewAllPressed: () {
                        // Handle view all button press
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('View All pressed')),
                        );
                      },
                    ),
                  ),
      
                  // Convenience Section
                  Container(
                    key: _convenienceKey,
                    child: ConvenienceSection(
                      amenities: convenience,
                      onViewAllPressed: () {
                        // Handle view all button press
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('View All pressed')),
                        );
                      },
                    ),
                  ),
      
                  // Technical Specs Section
                  Container(
                    key: _specificationKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Technical Specifications',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight
                                .bold),
                          ),
                        ),
                        16.height,
                        _buildSpecificationRow(
                            'Master Bedroom - walls', 'Oil Bound Distemper',
                            Icons.home_work_outlined),
                        _buildSpecificationRow(
                            'Master Bedroom - Flooring', 'Vitrified Tiles',
                            Icons.home_repair_service_outlined),
                        _buildSpecificationRow(
                            'Other Bedroom - flooring', 'Vitrified Tiles',
                            Icons.photo_size_select_small_outlined),
      
                        ViewAllButton(
                          onPressed: () {},
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.95,
                        ).center(),
                        10.height,
                      ],
                    ),
                  ),
      
                  // Location Section
                  Container(
                    key: _locationKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Location & Landmark',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight
                                .bold),
                          ),
                        ),
                        // Google Maps View
                        if (widget.allPropertyList!.map != null &&
                            widget.allPropertyList!.map!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 300,
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Stack(
                                children: [
                                  WebViewWidget(controller: _mapController),
                                  if (isMapLoading)
                                    const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                ],
                              ),
                            ),
                          ),
      
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FloorPlanTypeSelector(
                            types: category,
                            selectedType: selectedCat,
                            onTypeSelected: (type) {
                              setState(() {
                                selectedCat = type;
                              });
                            },
                          ),
                        ),
                        16.height,
                        _buildLandmarkRow(
                            'Master Bedroom - walls', 'Oil Bound Distemper',
                            '2 km'),
                        _buildLandmarkRow(
                            'Master Bedroom - Flooring', 'Vitrified Tiles',
                            '5 km'),
                        _buildLandmarkRow(
                            'Other Bedroom - flooring', 'Vitrified Tiles',
                            '1 km'),
      
                        ViewAllButton(
                          onPressed: () {},
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.95,
                        ).center(),
                        10.height,
                      ],
                    ),
                  ),
      
                  // Brochure Section
                  Container(
                    key: _brochureKey,
                    child: BrochureWidget(
                      imageUrl: "https://your-image-url.com",
                      // Replace with actual image URL
                      onShare: () {
                        // Add share functionality here
                        print("Share button pressed");
                      },
                      onDownload: () {
                        // Add download functionality here
                        print("Download button pressed");
                      },
                    ),
                  ),
      
                  // Media Section
                  Container(
                    key: _mediaKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Property Image & Video',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight
                                .bold),
                          ),
                        ),
                        ImageGalleryWidget(
                          images: widget.allPropertyList!.images,
                        ),
                        // YouTube Video Player
                        if (videoId != null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 250,
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: YoutubePlayer(
                                controller: YoutubePlayerController(
                                  initialVideoId: videoId!,
                                  flags: const YoutubePlayerFlags(
                                    autoPlay: false,
                                    mute: false,
                                  ),
                                ),
                                showVideoProgressIndicator: true,
                                progressIndicatorColor: Colors.red,
                                progressColors: const ProgressBarColors(
                                  playedColor: Colors.red,
                                  handleColor: Colors.redAccent,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
      
      
                  const Divider(),
                  Center(
                    child: AppButton(
                      width: context.screenWidth(),
                      color: Colors.blue,
                      child: const Text(
                        'ENQUIRE NOW',
                        style: TextStyle(color: AppColors.white),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              AlertDialog(
                                  title: EnquiryDialogComponent(
                                    allPropertyList: widget.allPropertyList,
                                  )),
                        );
                      },
                    ).cornerRadiusWithClipRRect(30).paddingOnly(
                        left: context.screenWidth() * 0.1,
                        right: context.screenWidth() * 0.1),
                  ),
                  100.height
                ],
              ),
            ),

            Positioned(
              top: 16,
              right: 16,
              child: Obx(() {
                final bool isFavorite = favoriteController.isPropertyFavorite(widget.allPropertyList!.id);
                return GestureDetector(
                  onTap: () {
                    if (getStringAsync(emailMobile).isEmpty) {
                      toast('Please login to add to favorites');
                      return;
                    }
                    favoriteController.toggleFavorite(context, widget.allPropertyList!.id);
                  },
                  child: Container(
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
                      color: Colors.red,
                      size: 24,
                    ),
                  ),
                );
              }),
            ),
      
            // Sticky tabs
            if (_showTabs)
              Container(
                height: 50,
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _tabItems.length,
                  itemBuilder: (context, index) {
                    final bool isSelected = index == _selectedTabIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                        _scrollToSection(_tabItems[index]["key"]);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: isSelected ? Colors.orange : Colors
                                  .transparent,
                              width: 3,
                            ),
                          ),
                          color: isSelected
                              ? Colors.orange.withOpacity(0.1)
                              : Colors.transparent,
                        ),
                        child: Text(
                          _tabItems[index]["title"],
                          style: TextStyle(
                            color: isSelected ? Colors.orange : Colors.black54,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight
                                .normal,
                            fontSize: 14,
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
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Icon(icon),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: TextStyle(fontSize: 16)),
                  Text(value,
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpecificationRow(String label, String value, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: TextStyle(fontSize: 16)),
                  Text(value,
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLandmarkRow(String label, String value, String distance) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  Text(value,
                      style:
                      TextStyle(fontSize: 16, )),
                ],
              ),Text(distance,
                  style:
                  TextStyle(fontSize: 16, )),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectDetailsBottomSheet {
}

class PropertyCarouselSliderView extends StatefulWidget {
  final List<String> bannerList;
  const PropertyCarouselSliderView({super.key, required this.bannerList});

  @override
  State<PropertyCarouselSliderView> createState() =>
      _PropertyCarouselSliderViewState();
}

class _PropertyCarouselSliderViewState
    extends State<PropertyCarouselSliderView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      child: Column(
        children: [
          CarouselSlider(
            items: widget.bannerList.map((imageUrl) {
              // Each BannerCard now contains its own button
              return Stack(
                children: [
                  PropertyBannerCard(imageUrl: imageUrl), // Your image card
                ],
              );
            }).toList(),
            options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 20 / 14,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                }),
          ),
        ],
      ),
    );
  }
}

class PropertyBannerCard extends StatelessWidget {
  // final String imageUrl;
  final String imageUrl;
  const PropertyBannerCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      // margin: const EdgeInsets.all(10),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.network(
            height: 200,
            imageUrl,
            width: double.infinity,
            fit: BoxFit.cover,
            // This section simulates the loading shimmer effect
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              return Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      color: Colors.grey,
                      child: frame != null
                          ? child
                          : const SizedBox(), // Replace shimmer with the image when loaded
                    ),
                  ),
                ),
              );
            },
          )
          ),
    );
  }
}

class EnquiryDialogComponent extends StatefulWidget {
  final PropertyByCategoriesModel? allPropertyList;
  const EnquiryDialogComponent({super.key, this.allPropertyList});

  @override
  State<EnquiryDialogComponent> createState() => _EnquiryDialogComponentState();
}

class _EnquiryDialogComponentState extends State<EnquiryDialogComponent> {
  final email = TextEditingController();

  final mobile = TextEditingController();
  final name = TextEditingController();

  final controller = Get.put(EnquiryController());
  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Optional padding
        child: Column(
          mainAxisSize: MainAxisSize.min, // Let the column adjust to content
          children: [
            Text(
              "Enquire about ${widget.allPropertyList!.name}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.appBarColor,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.text,
              controller: name,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.phone,
              controller: mobile,
              decoration: InputDecoration(
                labelText: "Mobile Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.text,
              controller: email,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (name.text.isEmpty) {
                  toast('Name can"t be empty');
                } else if (email.text.isEmpty) {
                  toast('Mobile no. can"t be empty');
                } else if (mobile.text.isEmpty) {
                  toast('Email can"t be empty');
                } else {
                  // Perform your enquiry action
                  controller.userEnquiry(
                      context,
                      name.text,
                      getStringAsync(userId),
                      mobile.text,
                      email.text,
                      widget.allPropertyList!.id);

                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Submit Enquiry",
                style: TextStyle(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
