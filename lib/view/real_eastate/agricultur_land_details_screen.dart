import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/component/property_card_component.dart';
import 'package:ghar_ka_sathi/controller/carousel_controller.dart'; // Import the new controller
import 'package:ghar_ka_sathi/controller/property_controller.dart';
import 'package:ghar_ka_sathi/src/carousel_slider/carousel_slider_view.dart';
import 'package:ghar_ka_sathi/view/real_eastate/Builder_project_detail_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/commercial_land_details_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/property_by_category_detail_page.dart';
import 'package:ghar_ka_sathi/view/real_eastate/real_eastate_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/residential_land_details_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/shimmer_loading_widget.dart';

class AgriculturLandDetailsScreen extends StatefulWidget {
  AgriculturLandDetailsScreen({super.key});

  @override
  State<AgriculturLandDetailsScreen> createState() =>
      _AgriculturLandDetailsScreenState();
}

class _AgriculturLandDetailsScreenState
    extends State<AgriculturLandDetailsScreen> {
  final propertyController = Get.put(PropertyController());

  // Initialize carousel controller helper function
  void initializeCarouselController() {
    if (!Get.isRegistered<CarouselController>()) {
      Get.put(CarouselController());
    }
  }

  @override
  void initState() {
    super.initState();
    initializeCarouselController();
    propertyController.getPropertiesByCategories(context, '⁠Agriculture Land');
  }

  // Sample data for the builder project services
  final List<Map<String, dynamic>> services = [
    {
      'title': "Demo1",
      'rating': 4.5,
      'reviews': 1566,
      'price': 200,
      'description':
      "Comprehensive repair services for leaks, wall mixers, and general plumbing issues to restore smooth and efficient operations in bathrooms and kitchens.",
      'imagePath': "assets/gks/agriculture_land.png",
    },
    {
      'title': "TestDemo",
      'rating': 4.5,
      'reviews': 1618,
      'price': 200,
      'description':
      "Clearing blockages, repairing, and replacing waste pipes to ensure proper drainage and leak-free performance in residential and commercial spaces.",
      'imagePath': "assets/gks/agriculture_land.png",
    },
    {
      'title': "Demo",
      'rating': 4.5,
      'reviews': 1618,
      'price': 200,
      'description':
      "Clearing blockages, repairing, and replacing waste pipes to ensure proper drainage and leak-free performance in residential and commercial spaces.",
      'imagePath': "assets/gks/agriculture_land.png",
    },
    // Add more items here as required
  ];

  final List<Map<String, String>> properties = [
    {
      "price": "₹1.38 Crs - ₹3.19 Crs",
      "details": "3, 4 BHK",
      "title": "Codename Devanah...",
      "location": "Devanahalli",
      "image": 'assets/gks/premium_photo-1661900547591-80ee79e20d1c.jpeg',
    },
    {
      "price": "₹71 L - ₹1.07 Crs",
      "details": "2, 3 BHK",
      "title": "Codename Super D...",
      "location": "Devanahalli",
      "image": 'assets/gks/premium_photo-1661962692059-55d5a4319814.jpeg',
    },
  ];

  final List<String> staticBannerList = [
    'assets/gks/agriculture-field-during-the-day-free-photo.jpg',
    'assets/gks/pngtree-potato-fields-in-the-countryside-agriculture-land-produce-photo-image_6114418.jpg',
    'assets/gks/pngtree-aerial-photograph-of-green-agricultural-plots-with-vacant-land-waiting-to-image_15688971.jpg',
  ];
  final List<VoidCallback> navigationCallbacks = [
        () => Get.to(() => BuilderProjectDetailScreen()),
        () => Get.to(() => ResidentialLandDetailsScreen()),
        () => Get.to(() => CommercialLandDetailsScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: const Text(
            "Agricultural land",
            style: TextStyle(color: AppColors.white),
          ),
          backgroundColor: AppColors.appBarColor,
        ),
        body: Column(
          children: [
            // Main Content
            Expanded(
              child: ListView(
                // padding: const EdgeInsets.all(16),
                children: [
                  // Updated to use API data
                  Obx(() {
                    final carouselController = Get.find<CarouselsController>();
                    return CarouselSliderView(
                      bannerList: carouselController.agriculturalUrls.isEmpty
                          ? staticBannerList // Fallback to static list if API fails
                          : carouselController.agriculturalUrls,
                      onPressedCallbacks: navigationCallbacks,
                      isLoading: carouselController.isLoading.value,
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() => propertyController.isLoading.value
                        ? Stack(
                      children: [
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return ShimmerLoadingWidget()
                                  .buildShimmerBannerSlider(
                                  MediaQuery.of(context).size.width *
                                      0.9,
                                  50.0);
                            }),
                      ],
                    )
                        : propertyController.errorMsg.value != ''
                        ? Column(
                      children: [
                        Center(
                          child:
                          Text(propertyController.errorMsg.value),
                        ),
                      ],
                    )
                        : GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        childAspectRatio:
                        0.6, // Adjusted aspect ratio
                        mainAxisSpacing:
                        16, // Increased space between rows
                        crossAxisSpacing:
                        16, // Increased space between columns
                      ),
                      itemCount:
                      propertyController.propertyByCatList.length,
                      itemBuilder: (context, index) {
                        final property = propertyController
                            .propertyByCatList[index];
                        return GestureDetector(
                          onTap: () {
                            // Add your onTap logic here
                          },
                          child: PropertyCard(
                              price: property.price.toString(),
                              details: property.detail,
                              title: property.name,
                              location: property.location,
                              images: property.images,
                              type: property.type,
                              typeColor: Colors.green,
                              onTap: () {
                                Get.to(PropertyByCategoryDetailPage(
                                  allPropertyList: property,
                                ));
                              }),
                        );
                      },
                    )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}