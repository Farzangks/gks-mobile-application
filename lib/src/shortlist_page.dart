import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/component/property_card_component.dart';
import 'package:ghar_ka_sathi/controller/favorite_controller.dart';
import 'package:ghar_ka_sathi/model/favorite_model.dart';
import 'package:ghar_ka_sathi/model/rent_property_model.dart';
import 'package:ghar_ka_sathi/view/real_eastate/property_detail_page.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:lottie/lottie.dart';

class ShortlistPage extends StatefulWidget {
  const ShortlistPage({
    super.key,
  });

  @override
  State<ShortlistPage> createState() => _ShortlistPageState();
}

class _ShortlistPageState extends State<ShortlistPage> {
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  void initState() {
    super.initState();
    favoriteController.getAllFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Favorites'),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              favoriteController.getAllFavorites();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (favoriteController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (favoriteController.errorMsg.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.warning, size: 60, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  favoriteController.errorMsg.value,
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        if (favoriteController.favorites.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/animations/empty_wishlist.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                  repeat: true,
                  frameRate: FrameRate.max,
                ) ?? Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'No properties in your favorites yet',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Tap the heart icon on properties to add them to your favorites',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.appBarColor,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text('Browse Properties', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 100.00),
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: favoriteController.favorites.length,
            itemBuilder: (context, index) {
              final property = favoriteController.favorites[index];
              return FavoritePropertyCard(
                property: property,
                onRemove: () {
                  favoriteController.removeFromFavorites(context, property.id);
                },
                onTap: () {
                  // Convert FavoriteProperty to PropertyRentResource for navigation
                  final rentProperty = PropertyRentResource(
                    id: property.id,
                    name: property.name,
                    detail: property.detail,
                    price: property.price,
                    category: property.category,
                    location: property.location,
                    type: property.type,
                    map: property.map,
                    video: property.video,
                    images: property.images,
                    ownerMobile: property.ownerMobile,
                    v: property.v,
                    deleteUrls: [],
                    createdAt: property.createdAt,
                    updatedAt: property.updatedAt,
                    createdBy: '',
                  );

                  Get.to(() => PropertyDetailPage(property: rentProperty));
                },
              );
            },
          ),
        );
      }),
    );
  }
}

class FavoritePropertyCard extends StatelessWidget {
  final FavoriteProperty property;
  final VoidCallback onRemove;
  final VoidCallback onTap;

  const FavoritePropertyCard({
    Key? key,
    required this.property,
    required this.onRemove,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract features from property details
    List<String> features = [];
    if (property.detail.contains('BHK')) {
      // Try to extract BHK info
      final regex = RegExp(r'(\d+(\.\d+)?)\s*BHK');
      final match = regex.firstMatch(property.detail);
      if (match != null) {
        features.add('${match.group(1)} BHK');
      }
    }

    // Extract area if available
    if (property.detail.contains('sq. ft.') || property.detail.contains('sqft')) {
      final regex = RegExp(r'(\d+(\,\d+)?(\.\d+)?)\s*sq');
      final match = regex.firstMatch(property.detail);
      if (match != null) {
        features.add('${match.group(1)} sqft');
      }
    }

    // If we couldn't extract features, add default ones based on property category
    if (features.isEmpty) {
      if (property.category.contains('Land')) {
        features.add('Land');
      } else if (property.category.contains('House')) {
        features.add('House');
      } else if (property.category.contains('Apartment')) {
        features.add('Apartment');
      }
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                  child: property.images.isNotEmpty
                      ? Image.network(
                    property.images[0],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: Colors.grey[300],
                        child: Center(
                          child: Icon(Icons.image_not_supported, color: Colors.grey[500], size: 40),
                        ),
                      );
                    },
                  )
                      : Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: Center(
                      child: Icon(Icons.image_not_supported, color: Colors.grey[500], size: 40),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: _getTypeColor(property.type),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      property.type,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: onRemove,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "₹${_formatPrice(property.price)}",
                  style: const TextStyle(
                    color: AppColors.appBarColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  property.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4.0),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    const SizedBox(width: 4.0),
                    Expanded(
                      child: Text(
                        property.location,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: features.map((feature) => InfoChip(label: feature)).toList(),
                ),
                const SizedBox(height: 12.0),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: onTap, // Use the same onTap callback here
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.appBarColor,
                      side: BorderSide(color: AppColors.appBarColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'View Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
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

  Color _getTypeColor(String type) {
    switch (type) {
      case 'Buy':
        return Colors.green;
      case 'Sell':
        return AppColors.appBarColor;
      case 'Rent':
        return Colors.black;
      case 'Lease':
        return Colors.blue;
      default:
        return Colors.green;
    }
  }

  String _formatPrice(int price) {
    if (price >= 10000000) {
      return '${(price / 10000000).toStringAsFixed(price % 10000000 == 0 ? 0 : 2)} Cr';
    } else if (price >= 100000) {
      return '${(price / 100000).toStringAsFixed(price % 100000 == 0 ? 0 : 2)} Lac';
    } else if (price >= 1000) {
      return '${(price / 1000).toStringAsFixed(price % 1000 == 0 ? 0 : 2)}K';
    }
    return price.toString();
  }
}

class InfoChip extends StatelessWidget {
  final String label;

  const InfoChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}