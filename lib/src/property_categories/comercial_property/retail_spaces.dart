import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/src/property_categories/property_list_components.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class RetailSpaces extends StatefulWidget {
  const RetailSpaces({super.key});

  @override
  State<RetailSpaces> createState() => _RetailSpacesState();
}

class _RetailSpacesState extends State<RetailSpaces> {
  final List<Map<String, String>> propertyList = [
    {
      "price": "₹1.38 Crs - ₹3.19 Crs",
      "details": "3, 4 BHK",
      "title": "Codename Devanah...",
      "location": "Devanahalli",
      "image": 'assets/gks/1_How-to-Make-a-House-a-Home.jpg',
    },
    {
      "price": "₹71 L - ₹1.07 Crs",
      "details": "2, 3 BHK",
      "title": "Codename Super D...",
      "location": "Devanahalli",
      "image": 'assets/gks/3a719c93ea8b2605f079a23282822805.jpg',
    },
    {
      "price": "₹1.38 Crs - ₹3.19 Crs",
      "details": "3, 4 BHK",
      "title": "Codename Devanah...",
      "location": "Devanahalli",
      "image": 'assets/gks/a42ab5f352be2d40e9a58c6c788b7a8e.jpg',
    },
    {
      "price": "₹71 L - ₹1.07 Crs",
      "details": "2, 3 BHK",
      "title": "Codename Super D...",
      "location": "Devanahalli",
      "image": 'assets/gks/254f8cfc8590394523141b821ec4a73f.jpg',
    },
    {
      "price": "₹1.38 Crs - ₹3.19 Crs",
      "details": "3, 4 BHK",
      "title": "Codename Devanah...",
      "location": "Devanahalli",
      "image": 'assets/gks/bfdceebd26b070761efede79ca829d8c.jpg',
    },
    {
      "price": "₹71 L - ₹1.07 Crs",
      "details": "2, 3 BHK",
      "title": "Codename Super D...",
      "location": "Devanahalli",
      "image": 'assets/gks/ea4db100a4b82e83a56a147740276b51.jpg',
    },
  ];

  final List<String> staticBannerList = [
    'assets/gks/pixlr-image-generator-43b95ecc-a913-4418-9df0-75a6a9b9a1c3.png',
    'assets/gks/wrapped-house-with-keys-money-background.jpg',
    'assets/gks/analog-landscape-city-with-buildings.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Retail Spaces",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.appBarColor,
        ),
        body: PropertyListComponents(bannerList: staticBannerList,propertyList: propertyList,));
  }
}
