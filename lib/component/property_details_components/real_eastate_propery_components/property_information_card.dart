import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

// Model to hold property information
class PropertyInfo {
  final String listingType;
  final String buildingType;
  final String locality;
  final String propertyType;
  final String city;
  final String price;
  final String ageOfProperty;
  final String coveredParking;
  final String flooring;
  final String towerBlock;
  final String possessionStatus;
  final String furnishingStatus;

  PropertyInfo({
    required this.listingType,
    required this.buildingType,
    required this.locality,
    required this.propertyType,
    required this.city,
    required this.price,
    required this.ageOfProperty,
    required this.coveredParking,
    required this.flooring,
    required this.towerBlock,
    required this.possessionStatus,
    required this.furnishingStatus,
  });
}

// Reusable info row widget
class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style:  TextStyle(
              fontSize: 16,
              color:Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// Main property information widget
class PropertyInformationCard extends StatelessWidget {
  final PropertyInfo propertyInfo;
  final VoidCallback? onViewAll;

  const PropertyInformationCard({
    Key? key,
    required this.propertyInfo,
    this.onViewAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 2,
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Property Information',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.appBarColor
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildInfoColumn(constraints),
                      _buildInfoColumn2(constraints),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: onViewAll,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(BoxConstraints constraints) {
    // final width = constraints.maxWidth > 600
    //     ? (constraints.maxWidth - 16) / 2
    //     : constraints.maxWidth;

    return SizedBox(
      // width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoRow(label: 'Listing Type', value: propertyInfo.listingType),
          InfoRow(label: 'Locality', value: propertyInfo.locality),
          InfoRow(label: 'City', value: propertyInfo.city),
          InfoRow(
              label: 'Age of Property (In Years)',
              value: propertyInfo.ageOfProperty),
          InfoRow(label: 'Flooring', value: propertyInfo.flooring),
          InfoRow(
              label: 'Possession Status', value: propertyInfo.possessionStatus),
        ],
      ),
    );
  }

  Widget _buildInfoColumn2(BoxConstraints constraints) {
    // final width = constraints.maxWidth > 600
    //     ? (constraints.maxWidth - 16) / 2
    //     : constraints.maxWidth;

    return SizedBox(
      // width: width,
      child: Column(
        children: [
          InfoRow(label: 'Building Type', value: propertyInfo.buildingType),
          InfoRow(label: 'Property Type', value: propertyInfo.propertyType),
          InfoRow(label: 'Price', value: propertyInfo.price),
          InfoRow(label: 'Covered Parking', value: propertyInfo.coveredParking),
          InfoRow(label: 'Tower/Block', value: propertyInfo.towerBlock),
          InfoRow(
              label: 'Furnishing Status', value: propertyInfo.furnishingStatus),
        ],
      ),
    );
  }
}
