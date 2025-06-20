import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/component/property_card_component.dart';
import 'package:ghar_ka_sathi/controller/property_controller.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/shimmer_loading_widget.dart';

class AllPropertyListScreen extends StatefulWidget {
  final String? propertyType;
  const AllPropertyListScreen({super.key, this.propertyType});

  @override
  State<AllPropertyListScreen> createState() => _AllPropertyListScreenState();
}

class _AllPropertyListScreenState extends State<AllPropertyListScreen> {
  final propertyController = Get.put(PropertyController());
  Color propertyTypeColor = Colors.green;

  List<dynamic> getFilteredProperties() {
    if (!propertyController.hasData) {
      return [];
    }

    return propertyController.allPropertyList.first.data
        .where((property) => property.type == widget.propertyType)
        .toList();
  }

  @override
  void initState() {
    super.initState();
    // Ensure we have data when this screen loads
    if (!propertyController.hasData) {
      propertyController.getAllProperties();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        titleSpacing: 0,
        centerTitle: false,
        title: Row(
          children: [
            Image.asset(
              'assets/images/IMG_0742.PNG',
              height: 170,
            ).marginOnly(left: 5),
            const Spacer(),
            // Property type indicator
            if (widget.propertyType != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  widget.propertyType!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
        backgroundColor: AppColors.appBarColor,
        actions: [
          // Add refresh button
          Obx(() => IconButton(
            icon: Icon(
              Icons.refresh,
              color: propertyController.isUsingStaticData.value
                  ? Colors.orange
                  : Colors.white,
            ),
            onPressed: () => propertyController.refreshData(),
            tooltip: propertyController.isUsingStaticData.value
                ? 'Try to load live data'
                : 'Refresh data',
          )),
        ],
      ),
      body: Column(
        children: [
          // Property count and status bar
          Obx(() {
            if (propertyController.hasData && !propertyController.isLoading.value) {
              final model = propertyController.allPropertyList.first;
              final filteredCount = getFilteredProperties().length;

              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$filteredCount ${widget.propertyType} Properties',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.btnDarkRed,
                            ),
                          ),
                          Text(
                            'Total: ${model.totalProperties} properties available',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (propertyController.isUsingStaticData.value)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Sample Data',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.blue[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }
            return Container();
          }),

          // Main content
          Expanded(child: _buildPropertyList()),
        ],
      ),
    );
  }

  Widget _buildPropertyList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        // Show loading state
        if (propertyController.isLoading.value) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemCount: 6, // Show 6 shimmer items
            itemBuilder: (context, index) {
              return ShimmerLoadingWidget().buildShimmerBannerSlider(
                MediaQuery.of(context).size.width * 0.45,
                250.0,
              );
            },
          );
        }

        // Check if we have data
        if (propertyController.hasData) {
          var filteredProperties = getFilteredProperties();

          return Column(
            children: [
              // Show static data info banner if using static data
              if (propertyController.isUsingStaticData.value) ...[
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
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
                      Icon(Icons.offline_bolt, color: Colors.blue[600], size: 24),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Offline Mode',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.blue[800],
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Showing sample properties. Tap refresh to try loading live data.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blue[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () => propertyController.refreshData(),
                        icon: const Icon(Icons.refresh, size: 16),
                        label: const Text('Refresh'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[600],
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          textStyle: const TextStyle(fontSize: 12),
                          minimumSize: Size.zero,
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              // Property grid or empty state
              Expanded(
                child: filteredProperties.isEmpty
                    ? _buildEmptyState()
                    : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  itemCount: filteredProperties.length,
                  itemBuilder: (context, index) {
                    final property = filteredProperties[index];
                    return PropertyCard(
                      price: property.price.toString(),
                      details: property.detail,
                      title: property.name,
                      location: property.location,
                      images: property.images,
                      type: property.type,
                      typeColor: propertyTypeColor,
                      allPropertyList: property,
                    );
                  },
                ),
              ),
            ],
          );
        }

        // Show error state with option to load static data
        return _buildErrorState();
      }),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.home_work_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'No ${widget.propertyType} Properties Found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'There are currently no properties available for ${widget.propertyType?.toLowerCase()}. Try selecting a different property type or check back later.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => propertyController.refreshData(),
            icon: const Icon(Icons.refresh),
            label: const Text('Refresh'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.btnDarkRed,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.red[50],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.cloud_off_outlined,
                size: 64,
                color: Colors.red[400],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Unable to Load Properties',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                propertyController.errorMsg.value.isNotEmpty
                    ? propertyController.errorMsg.value
                    : 'There was an error loading the property data. Please check your internet connection and try again.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[500],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => propertyController.refreshData(),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Try Again'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.btnDarkRed,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                OutlinedButton.icon(
                  onPressed: () => propertyController.loadStaticDataForTesting(),
                  icon: const Icon(Icons.view_list),
                  label: const Text('Sample Data'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.btnDarkRed,
                    side: BorderSide(color: AppColors.btnDarkRed),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Go Back',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}