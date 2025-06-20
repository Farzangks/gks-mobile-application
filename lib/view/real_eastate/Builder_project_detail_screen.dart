import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:ghar_ka_sathi/component/property_card_component.dart';
import 'package:ghar_ka_sathi/controller/carousel_controller.dart'; // Import the new controller
import 'package:ghar_ka_sathi/controller/property_controller.dart';
import 'package:ghar_ka_sathi/src/carousel_slider/carousel_slider_view.dart';
import 'package:ghar_ka_sathi/src/property_categories/lands/agricultural_land.dart';
import 'package:ghar_ka_sathi/view/real_eastate/commercial_land_details_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/property_by_category_detail_page.dart';
import 'package:ghar_ka_sathi/view/real_eastate/real_eastate_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/residential_land_details_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/shimmer_loading_widget.dart';
import 'package:itq_utils/itq_utils.dart';

class BuilderProjectDetailScreen extends StatefulWidget {
  BuilderProjectDetailScreen({super.key});

  @override
  State<BuilderProjectDetailScreen> createState() =>
      _BuilderProjectDetailScreenState();
}

class _BuilderProjectDetailScreenState
    extends State<BuilderProjectDetailScreen> {
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
    propertyController.getPropertiesByCategories(context,"⁠Builders project");
  }


  final List<String> staticBannerList = [
    'assets/gks/pixlr-image-generator-43b95ecc-a913-4418-9df0-75a6a9b9a1c3.png',
    'assets/gks/wrapped-house-with-keys-money-background.jpg',
    'assets/gks/analog-landscape-city-with-buildings.jpg',
  ];
  final List<VoidCallback> navigationCallbacks = [
        () => Get.to(() => AgriculturalLand()),
        () => Get.to(() => ResidentialLandDetailsScreen()),
        () => Get.to(() => CommercialLandDetailsScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Builder Projects",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.appBarColor,
      ),
      body:Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // Updated to use API data
                Obx(() {
                  final carouselController = Get.find<CarouselsController>();
                  return CarouselSliderView(
                    bannerList: carouselController.builderUrls.isEmpty
                        ? staticBannerList // Fallback to static list if API fails
                        : carouselController.builderUrls,
                    onPressedCallbacks: navigationCallbacks,
                    isLoading: carouselController.isLoading.value,
                  );
                }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(() {
                    if (propertyController.isLoading.value) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return ShimmerLoadingWidget()
                              .buildShimmerBannerSlider(
                            MediaQuery.of(context).size.width * 0.9,
                            50.0,
                          );
                        },
                      );
                    } else if (propertyController.errorMsg.value.isNotEmpty) {
                      return Center(
                        child: Text(propertyController.errorMsg.value),
                      );
                    } else {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        itemCount: propertyController.propertyByCatList.length,
                        itemBuilder: (context, index) {
                          final property =
                          propertyController.propertyByCatList[index];
                          return GestureDetector(
                            onTap: () {},
                            child: PropertyCard(
                              price: property.price.toString(),
                              details: property.detail,
                              title: property.name,
                              location: property.location,
                              images: property.images,
                              type: property.type,
                              typeColor: Colors.green,
                              onTap: () {
                                Get.to(
                                  PropertyByCategoryDetailPage(
                                    allPropertyList: property,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    }
                  }),
                ),
                100.height,
              ],
            ),
          ),
        ],
      ),
    );
  }
}