import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/component/property_card_component.dart';
import 'package:ghar_ka_sathi/controller/carousel_controller.dart'; // Import the new controller
import 'package:ghar_ka_sathi/controller/property_controller.dart';
import 'package:ghar_ka_sathi/src/carousel_slider/carousel_slider_view.dart';
import 'package:ghar_ka_sathi/src/property_categories/lands/agricultural_land.dart';
import 'package:ghar_ka_sathi/view/real_eastate/Builder_project_detail_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/commercial_land_details_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/property_by_category_detail_page.dart';
import 'package:ghar_ka_sathi/view/real_eastate/real_eastate_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/shimmer_loading_widget.dart';
import 'package:itq_utils/itq_utils.dart';

class ResidentialLandDetailsScreen extends StatefulWidget {
  const ResidentialLandDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ResidentialLandDetailsScreen> createState() =>
      _ResidentialLandDetailsScreenState();
}

class _ResidentialLandDetailsScreenState
    extends State<ResidentialLandDetailsScreen> {
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
    propertyController.getPropertiesByCategories(context, 'Residential Land');
  }


  final List<String> staticBannerList = [
    'assets/gks/aerial-shot-mesmerizing-scenery-waikanae-township-new-zealand.jpg',
    'assets/gks/aerial-view-rural-landscape-crops-field.jpg',
    'assets/gks/aerial-view-rural-landscape-crops-field.jpg',
  ];

  final List<VoidCallback> navigationCallbacks = [
        () => Get.to(() => BuilderProjectDetailScreen()),
        () => Get.to(() => AgriculturalLand()),
        () => Get.to(() => CommercialLandDetailsScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text(
          "Residential Land",
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.appBarColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                // Updated to use API data
                Obx(() {
                  final carouselController = Get.find<CarouselsController>();
                  return CarouselSliderView(
                    bannerList: carouselController.residentialUrls.isEmpty
                        ? staticBannerList // Fallback to static list if API fails
                        : carouselController.residentialUrls,
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
  @override
  void dispose() {
    // TODO: implement dispose

    Get.delete<PropertyController>();
    super.dispose();
  }
}