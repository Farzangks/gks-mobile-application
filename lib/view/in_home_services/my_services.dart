import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/controller/carousel_controller.dart'; // Import the new controller
import 'package:ghar_ka_sathi/src/carousel_slider/carousel_slider_view.dart';
import 'package:ghar_ka_sathi/view/in_home_services/construction_detail_page.dart';
import 'package:ghar_ka_sathi/view/in_home_services/carpenter_details_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/cleaning_details_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/electrician_details_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/electronic_appliances.dart';
import 'package:ghar_ka_sathi/view/in_home_services/home_interior.dart';
import 'package:ghar_ka_sathi/view/in_home_services/home_renovation.dart';
import 'package:ghar_ka_sathi/view/in_home_services/packers_and_movers.dart';
import 'package:ghar_ka_sathi/view/in_home_services/painting_details_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/pest_control_and_disinfect.dart';
import 'package:ghar_ka_sathi/view/in_home_services/plumbing_details_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class MyServices extends StatefulWidget {
  static String tag = '/MyService';
  const MyServices({super.key});

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  // Initialize carousel controller
  final carouselController = Get.put(CarouselsController());

  final List<String> homeServiceBannerList = [
    'assets/gks/5059a72676ca8097d0d29636d7a3800c.jpg',
    'assets/gks/2454c72a85624918bd0370f56e185a97.jpg',
    'assets/gks/bfdceebd26b070761efede79ca829d8c.jpg',
  ];
  final List<VoidCallback> homeServiceBannerListNavigationCallbacks = [
        () => Get.to(() => CleaningDetailsScreen()),
        () => Get.to(() => PlumbingDetailsScreen()),
        () => Get.to(() => PlumbingDetailsScreen()),
  ];

  @override
  void initState() {
    super.initState();
    // If the controller is not already initialized elsewhere, initialize it
    if (!Get.isRegistered<CarouselController>()) {
      Get.put(CarouselController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text(
          "My Services",
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.appBarColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.btnDarkRed),
                  child: const Center(
                      child: Text(
                        'Everything you need, at your fingertips',
                        style: TextStyle(color: AppColors.white, fontSize: 15),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                      child: Text(
                        'In-House services',
                        style: TextStyle( fontSize: 12),
                      )),
                ),
              ),
              // Updated to use API data
              Obx(() => CarouselSliderView(
                bannerList: carouselController.in_houseUrls.isEmpty
                    ? homeServiceBannerList // Fallback to static list if API fails
                    : carouselController.in_houseUrls,
                onPressedCallbacks: homeServiceBannerListNavigationCallbacks,
                isLoading: carouselController.isLoading.value,
              )),

              _buildHomeServiceCategories(),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeServiceCategories() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final categories = [
      {
        'icon': 'assets/gks/carpentry.PNG',
        'label': 'Carpenter',
        'onTap': () {
          print('Tapped on Vastu Consultation');
          Get.to(() => CarpenterDetailsScreen(serviceType: 'Carpenter',));
        },
      },
      {
        'icon': 'assets/gks/construction_services/construction.png',
        'label': 'Construction',
        'onTap': () {
          print('Tapped on Vastu Consultation');
          Get.to(() => ConstructionDetailPage(serviceType: 'Home Renovation',));
        },
      },
      {
        'icon': 'assets/gks/electrician (2).PNG',
        'label': 'Electrician',
        'onTap': () {
          print('Tapped on Vastu Consultation');
          Get.to(() => ElectricianDetailsScreen(serviceType: 'Electrician',));
        },
      },
      {
        'icon': 'assets/gks/plumbing.PNG',
        'label': 'Plumber',
        'onTap': () {
          print('Tapped on Vastu Consultation');
          Get.to(() => PlumbingDetailsScreen(serviceType: 'Plumbing',));
        },
      },
      {
        'icon': 'assets/gks/painting.PNG',
        'label': 'Painting',
        'onTap': () {
          print('Tapped on Vastu Consultation');
          Get.to(() => PaintingDetailsScreen(serviceType: 'Painting',));
        },
      },
      {
        'icon': 'assets/gks/cleaning.PNG',
        'label': 'Cleaning',
        'onTap': () {
          print('Tapped on Cleaning');
          Get.to(() => CleaningDetailsScreen());
        },
      },
      {
        'icon': 'assets/gks/home_interior.PNG',
        'label': 'Interior',
        'onTap': () {
          print('Tapped on Vastu Consultation');
          Get.to(() => HomeInterior(serviceType: 'Home Interior',));
        },
      },
      {
        'icon': 'assets/gks/electronic_appliances.PNG',
        'label': 'Electronic\nAppliances',
        'onTap': () {
          print('Tapped on Vastu Consultation');
          Get.to(() => ElectronicAppliances(serviceType: 'Electronic Appliances',));
        },
      },
      {
        'icon': 'assets/gks/movers_packers.PNG',
        'label': 'Packers &\nMovers',
        'onTap': () {
          print('Tapped on Vastu Consultation');
          Get.to(() => PackersAndMovers(serviceType: 'Home Renovation',));
        },
      },
      {
        'icon': 'assets/gks/pestControl.PNG',
        'label': 'Pest Control\n& Disinfect',
        'onTap': () {
          print('Tapped on Vastu Consultation');
          Get.to(() => PestControlAndDisinfect(serviceType: 'Home Renovation',));
        },
      },
      {
        'icon': 'assets/gks/home_renovation.PNG',
        'label': 'Home\nRenovation',
        'onTap': () {
          print('Tapped on Vastu Consultation');
          Get.to(() => HomeRenovation(serviceType: 'Home Renovation',));
        },
      },
    ];

    return SizedBox(
      height: screenHeight * .7, // Adjusted height for a better fit
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns in the grid
          childAspectRatio: 1, // Adjust aspect ratio as needed
          mainAxisSpacing: 12, // Space between rows
          crossAxisSpacing: 12, // Space between columns
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: categories[index]['onTap'] as VoidCallback,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    categories[index]['icon'] as String,
                    width: 50, // Adjust the width as needed
                    height: 30, // Adjust the height as needed
                  ),
                  const SizedBox(height: 2),
                  Text(
                    categories[index]['label'] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 10), // Adjust font size as needed
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}