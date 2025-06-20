// amenity_model.dart
import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/component/property_details_components/real_eastate_propery_components/aminities_components.dart';

class ConvenienceModel {
  final String title;
  final IconData icon;

  ConvenienceModel({required this.title, required this.icon});
}


class ConvenienceItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final double? iconSize;
  final double? fontSize;

  const ConvenienceItem({
    Key? key,
    required this.title,
    required this.icon,
    this.iconSize = 24,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: iconSize,
            color: Colors.black54,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: fontSize,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// view_all_button.dart

// class ViewAllButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final double? width;
//
//   const ViewAllButton({
//     Key? key,
//     required this.onPressed,
//     this.width,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width ?? double.infinity,
//       margin: const EdgeInsets.symmetric(vertical: 16.0),
//       child: OutlinedButton(
//         onPressed: onPressed,
//         style: OutlinedButton.styleFrom(
//           padding: const EdgeInsets.symmetric(vertical: 16.0),
//           side: const BorderSide(color: Colors.black87),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(4.0),
//           ),
//         ),
//         child: const Text(
//           'View All',
//           style: TextStyle(
//             color: Colors.black87,
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//     );
//   }
// }

// amenities_section.dart

class ConvenienceSection extends StatelessWidget {
  final List<ConvenienceModel> amenities;
  final int initialDisplayCount;
  final Function() onViewAllPressed;

  const ConvenienceSection({
    Key? key,
    required this.amenities,
    this.initialDisplayCount = 6,
    required this.onViewAllPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet = constraints.maxWidth >= 600;
        final isMobile = constraints.maxWidth < 600;

        return Padding(
          padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Convenience',
                style: TextStyle(
                  fontSize: isTablet ? 32.0 : 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 24),
              ...amenities
                  .take(initialDisplayCount)
                  .map((amenity) => ConvenienceItem(
                title: amenity.title,
                icon: amenity.icon,
                iconSize: isTablet ? 28.0 : 24.0,
                fontSize: isTablet ? 18.0 : 16.0,
              )),
              ViewAllButton(
                onPressed: onViewAllPressed,
                width: isTablet ? constraints.maxWidth * 0.7 : null,
              ),
            ],
          ),
        );
      },
    );
  }
}
