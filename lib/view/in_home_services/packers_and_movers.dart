import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:ghar_ka_sathi/view/in_home_services/base_service_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/service_bottom_sheet_components.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:itq_utils/itq_utils.dart';

import 'cleaning_details_screen.dart';



/// Data for carpentry services
final List<Map<String, dynamic>> services = [
  {
    'category': "Local Relocation",
    'id': 1,
    'imagePath': "assets/images/Small-Truck.jpeg",
    'data': [
      {
        'title': "1 BHK Local Shifting Service",
        'rating': 4.5,
        'reviews': 1566,
        'price': 5720,
        'description': "Our 1 BHK Local Moving Service is ideal for smaller households relocating within the same city. We provide an affordable, hassle-free moving experience, ensuring your belongings are packed, transported, and delivered safely.",
        'imagePath': "assets/images/1BHK-Moving.jpeg",
        'serviceDetail': [
          {
            'header': 'Included Services:',
            'data': [
              'Packing, loading, and unloading',
              'Safe transportation within city limits',
              'Disassembly & reassembly of basic furniture',
            ],
          },
          {
            'header': 'Included Items:',
            'data': [
              '1 Double Bed + Mattress',
              '1 Wardrobe',
              '1 Refrigerator',
              '1 Washing Machine',
              '1 Sofa Set (3-Seater)',
              '10 Boxes of Personal Belongings',
              'Up to 5 Miscellaneous Items (e.g., bucket, cleaning items)',
            ],
          },
          {
            'header': 'Additional Charges for Extra Items:',
            'data': [
              '₹100 per extra box',
              '₹500 per extra item (e.g., additional bed, table)',
            ],
          },
        ],
      },
      {
        'title': "2 BHK Local Shifting Service",
        'rating': 4.5,
        'reviews': 1618,
        'price': 7150,
        'description': "Our 2 BHK Local Moving Service is designed for families relocating within the same city. We manage everything from packing to unpacking, ensuring a smooth and stress-free move.",
        'imagePath': "assets/images/2BHK-Moving.jpeg",
        'serviceDetail': [
          {
            'header': 'Included Services:',
            'data': [
              'Full packing, loading, and unpacking',
              'Safe transportation within city limits',
              'Disassembly & reassembly of standard furniture',
            ],
          },
          {
            'header': 'Included Items:',
            'data': [
              '2 Double Beds + Mattresses',
              '2 Wardrobes',
              '1 Sofa Set (5-Seater)',
              '1 Dining Table',
              '1 Refrigerator',
              '1 Washing Machine',
              '15 Boxes of Personal Belongings',
              'Up to 7 Miscellaneous Items (e.g., bucket, cleaning items)',
            ],
          },
          {
            'header': 'Additional Charges for Extra Items:',
            'data': [
              '₹100 per extra box',
              '₹500 per extra item (e.g., additional bed, table)',
            ],
          },
        ],
      },
      {
        'title': "3 BHK Local Shifting Service",
        'rating': 4.5,
        'reviews': 1618,
        'price': 9790,
        'description': "Our 3 BHK Local Moving Service is designed for families with larger homes relocating within the same city. We provide a full-service package, ensuring a smooth and efficient move with professional packing, transportation, and unpacking.",
        'imagePath': "assets/images/3BHK-Moving.jpeg",
        'serviceDetail': [
          {
            'header': 'Included Services:',
            'data': [
              'Professional packing and transportation',
              'Disassembly & reassembly of large furniture',
              'Safe packing of fragile items',
            ],
          },
          {
            'header': 'Included Items:',
            'data': [
              '3 Double Beds + Mattresses',
              '3 Wardrobes',
              '1 Sofa Set (5-Seater)',
              '1 Dining Table',
              '1 Refrigerator',
              '1 Washing Machine',
              '1 TV Unit',
              '20 Boxes of Personal Belongings',
              'Up to 10 Miscellaneous Items (e.g., bucket, cleaning items)',
            ],
          },
          {
            'header': 'Additional Charges for Extra Items:',
            'data': [
              '₹100 per extra box',
              '₹500 per extra item (e.g., additional bed, table)',
            ],
          },
        ],
      },
      {
        'title': "4 BHK Local Shifting Service",
        'rating': 4.5,
        'reviews': 1618,
        'price': 14520,
        'description': "Our 4 BHK Local Moving Service is designed for larger families relocating within the city. We provide a comprehensive moving package, handling everything from packing to transportation and setup at your new home.",
        'imagePath': "assets/images/4BHK-Moving.jpeg",
        'serviceDetail': [
          {
            'header': 'Included Services:',
            'data': [
              'Full packing, loading, and unloading',
              'Disassembly & reassembly of large furniture',
              'Complete setup at the destination',
            ],
          },
          {
            'header': 'Included Items:',
            'data': [
              '4 Double Beds + Mattresses',
              '4 Wardrobes',
              '2 Sofa Sets',
              '1 Dining Table',
              '1 Refrigerator',
              '1 Washing Machine',
              '1 TV Unit',
              '30 Boxes of Personal Belongings',
              'Up to 15 Miscellaneous Items (e.g., bucket, cleaning items)',
            ],
          },
          {
            'header': 'Additional Charges for Extra Items:',
            'data': [
              '₹100 per extra box',
              '₹500 per extra item (e.g., additional bed, table)',
            ],
          },
        ],
      },
    ],
  },
  {
    'category': "City-to-City Moving",
    'id': 2,
    'imagePath': "assets/images/Cargo-Truck.jpeg",
    'data': [
      {
        'title': "1 BHK Long-Distance Relocation (Up to 500 km)",
        'rating': 4.5,
        'reviews': 1566,
        'price': 16830,
        'description': "Our 1 BHK Inter-City Moving Service is ideal for those relocating small households across city or state lines. We provide professional packing, safe transportation, and complete handling of your belongings for a smooth and stress-free move.",
        'imagePath': "assets/images/1BHK-Moving.jpeg",
        'serviceDetail': [
          {
            'header': 'Included Services:',
            'data': [
              'Packing and unpacking services',
              'Transportation up to 500 km',
              'Disassembly & reassembly of furniture',
              'Safe moving of kitchen appliances and essential items',
            ],
          },
          {
            'header': 'Included Items:',
            'data': [
              '1 Double Bed',
              '1 Wardrobe',
              '1 Refrigerator',
              '1 Washing Machine',
              '8 Boxes of Personal Belongings',
            ],
          },
          {
            'header': 'Lift Charges:',
            'data': [
              '₹100 per floor (if lift available)',
              '₹250 per floor (manual labor required)',
            ],
          },
          {
            'header': 'Additional Charges:',
            'data': [
              'Extra Items: ₹250 per extra box | ₹500 per large item (e.g., additional bed, large appliance)',
            ],
          },
          {
            'header': 'Additional Kilometers:',
            'data': [
              '₹20 per km (up to 200 additional km)',
              '₹18 per km (for 201-500 additional km)',
            ],
          },
        ],
      },
      {
        'title': "2 BHK Long-Distance Relocation (Up to 500 km)",
        'rating': 4.5,
        'reviews': 1566,
        'price': 23430,
        'description': "Moving a 2 BHK home across cities or states? Our 2 BHK Long-Distance Relocation Service ensures a smooth and stress-free move with expert packing, secure transportation, and end-to-end handling of your belongings.",
        'imagePath': "assets/images/2BHK-Moving.jpeg",
        'serviceDetail': [
          {
            'header': 'Included Services:',
            'data': [
              'Professional packing, loading, and unloading',
              'Safe transportation up to 500 km',
              'Disassembly & reassembly of furniture',
              'Secure handling of appliances and personal items',
            ],
          },
          {
            'header': 'Included Items:',
            'data': [
              '2 Double Beds',
              '2 Wardrobes',
              '1 Sofa Set (5-Seater)',
              '1 Refrigerator',
              '1 Washing Machine',
              '10 Boxes of Personal Belongings',
            ],
          },
          {
            'header': 'Lift Charges:',
            'data': [
              '₹100 per floor (if lift available)',
              '₹250 per floor (manual labor required)',
            ],
          },
          {
            'header': 'Additional Charges:',
            'data': [
              'Extra Items: ₹250 per extra box | ₹500 per large item (e.g., additional bed, large appliance)',
            ],
          },
          {
            'header': 'Additional Kilometers:',
            'data': [
              '₹20 per km (up to 200 additional km)',
              '₹18 per km (for 201-500 additional km)',
            ],
          },
        ],
      },
      {
        'title': "3 BHK Long-Distance Relocation (Up to 500 km)",
        'rating': 4.5,
        'reviews': 32780,
        'price': 200,
        'description': "Relocating a 3 BHK home across cities or states? Our 3 BHK Long-Distance Relocation Service offers a hassle-free moving experience, ensuring secure packing, efficient transportation, and careful handling of all your belongings, including fragile and electronic items.",
        'imagePath': "assets/images/3BHK-Moving.jpeg",
        'serviceDetail': [
          {
            'header': 'Included Services:',
            'data': [
              'Professional packing, loading, and unloading',
              'Safe transportation up to 500 km',
              'Disassembly & reassembly of furniture',
              'Secure handling of appliances and personal items',
            ],
          },
          {
            'header': 'Included Items:',
            'data': [
              '3 Double Beds',
              '3 Wardrobes',
              '1 Sofa Set (5-Seater)',
              '1 Dining Table',
              '1 Refrigerator',
              '1 Washing Machine',
              '1 TV Unit',
              '12 Boxes of Personal Belongings',
            ],
          },
          {
            'header': 'Lift Charges:',
            'data': [
              '₹100 per floor (if lift available)',
              '₹250 per floor (manual labor required)',
            ],
          },
          {
            'header': 'Additional Charges:',
            'data': [
              'Extra Items: ₹250 per extra box | ₹500 per large item (e.g., additional bed, large appliance)',
            ],
          },
          {
            'header': 'Additional Kilometers:',
            'data': [
              '₹20 per km (up to 200 additional km)',
              '₹18 per km (for 201-500 additional km)',
            ],
          },
        ],
      },
      {
        'title': "4 BHK Long-Distance Relocation (Up to 500 km)",
        'rating': 4.5,
        'reviews': 1566,
        'price': 46750,
        'description': "Moving a 4 BHK home across cities or states? Our 4 BHK Long-Distance Relocation Service ensures a seamless moving experience, providing expert packing, safe transportation, and full unpacking at your new home.",
        'imagePath': "assets/images/4BHK-Moving.jpeg",
        'serviceDetail': [
          {
            'header': 'Included Services:',
            'data': [
              'Professional packing, loading, and unloading',
              'Safe transportation up to 500 km',
              'Disassembly & reassembly of furniture',
              'Full packing and unpacking at the destination',
            ],
          },
          {
            'header': 'Included Items:',
            'data': [
              '4 Double Beds',
              '4 Wardrobes',
              '2 Sofa Sets',
              '1 Dining Table',
              '1 Refrigerator',
              '1 Washing Machine',
              '1 TV Unit',
              '15 Boxes of Personal Belongings',
            ],
          },
          {
            'header': 'Lift Charges:',
            'data': [
              '₹100 per floor (if lift available)',
              '₹250 per floor (manual labor required)',
            ],
          },
          {
            'header': 'Additional Charges:',
            'data': [
              'Extra Items: ₹250 per extra box | ₹500 per large item (e.g., additional bed, large appliance)',
            ],
          },
          {
            'header': 'Additional Kilometers:',
            'data': [
              '₹20 per km (up to 200 additional km)',
              '₹18 per km (for 201-500 additional km)',
            ],
          },
        ],
      },
    ],
  },
];

class PackersAndMovers extends StatefulWidget {
  static String tag = '/PackersMovers';
  final String? serviceType;
  PackersAndMovers({super.key,this.serviceType});

  @override
  State<PackersAndMovers> createState() => _PackersAndMoversState();
}

class _PackersAndMoversState extends State<PackersAndMovers> {
  @override
  Widget build(BuildContext context) {
    return BaseServiceScreen(
      title: "Packers & Movers Services",
      serviceType: widget.serviceType,
      services: services, // Use the predefined services list
      serviceTypeList: ['Local Moving', 'Interstate Moving'],
    );
  }
  // final ScrollController _scrollController = ScrollController();
  //
  // void _scrollToIndex(int index) {
  //   // Calculate the position to scroll to
  //   final targetPosition = index * 450.0; // Adjust based on list item height
  //   _scrollController.animateTo(
  //     targetPosition,
  //     duration: const Duration(milliseconds: 100),
  //     curve: Curves.easeInOut,
  //   );
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     extendBody: true,
  //     backgroundColor: AppColors.grey,
  //     appBar: AppBar(
  //       title: const Text(
  //         "Packers & Movers Services",
  //         style: TextStyle(color: AppColors.white, fontSize: 18),
  //       ),
  //       backgroundColor: AppColors.appBarColor,
  //       centerTitle: true,
  //       automaticallyImplyLeading: false,
  //       leading: IconButton(
  //         icon: Icon(Icons.arrow_back),
  //         color: AppColors.white,
  //         onPressed: () {
  //           Get.back();
  //         },
  //       ),
  //     ),
  //     body: ListView(
  //       controller: _scrollController,
  //       children: [
  //         GridViewSection(
  //           services: services,
  //           onServiceTap: (index) {
  //             // Handle scroll or other actions
  //             _scrollToIndex(index);
  //           },
  //         ),
  //         const SizedBox(height: 1),
  //         ServiceListSection(
  //           services: services,
  //           serviceType: widget.serviceType ?? '',
  //           serviceTypeList: ['Local Moving', 'Interstate Moving'],
  //           serviceSubTypeList: ['1 BHK', '2 BHK', '3 BHK', '4 BHK', '5 BHK'],
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

// class ServiceListSection extends StatelessWidget {
//   // Parameters for the legacy implementation
//   final String? category;
//   final int? categoryId;
//   final String? imagePath;
//   final bool? isSelected;
//
//   // Parameters for the newer implementation
//   final List<Map<String, dynamic>> services;
//   final String? serviceType;
//   final List<String>? serviceTypeList;
//   final List<String>? serviceSubTypeList;
//   final VoidCallback? onTap;
//
//   const ServiceListSection({
//     Key? key,
//     this.category,
//     required this.services,
//     this.categoryId,
//     this.imagePath,
//     this.isSelected,
//     this.serviceType,
//     this.serviceTypeList,
//     this.serviceSubTypeList,
//     this.onTap,
//   }) : super(key: key);
//
//   void _showAddModal(BuildContext context, String serviceSubCategory, String serviceCategory) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) => ServiceBottomSheetComponents(
//         serviceSubCategory: serviceSubCategory,
//         serviceType: category ?? serviceType ?? '',
//         serviceCategory: serviceCategory,
//         serviceTypeList: serviceTypeList ?? ['Basic Full Home Cleaning', 'Deep Full Home Cleaning'],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Check which mode we're in based on parameters
//     if (category != null && imagePath != null && categoryId != null) {
//       // Legacy implementation - single category with its services
//       final isSelectedValue = isSelected ?? false;
//
//       return Container(
//         margin: const EdgeInsets.only(bottom: 16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           border: isSelectedValue
//               ? Border.all(color: AppColors.appBarColor, width: 2)
//               : Border.all(color: Colors.grey.shade200),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 8,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Category header
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: isSelectedValue ? AppColors.appBarColor.withOpacity(0.1) : Colors.white,
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(12),
//                   topRight: Radius.circular(12),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.asset(
//                       imagePath!,
//                       width: 50,
//                       height: 50,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: Text(
//                       category!,
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: isSelectedValue ? FontWeight.bold : FontWeight.w500,
//                         color: isSelectedValue ? AppColors.appBarColor : Colors.black87,
//                       ),
//                     ),
//                   ),
//                   if (isSelectedValue)
//                     const Icon(
//                       Icons.check_circle,
//                       color: AppColors.appBarColor,
//                     ),
//                 ],
//               ),
//             ),
//
//             const Divider(height: 1),
//
//             // Services list
//             ListView.separated(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: services.length,
//               separatorBuilder: (context, index) => const Divider(height: 1),
//               itemBuilder: (context, index) {
//                 final service = services[index];
//                 return ServiceCard(
//                   context: context,
//                   serviceType: category!,
//                   serviceTypeList: serviceTypeList ?? ['Basic Full Home Cleaning', 'Deep Full Home Cleaning'],
//                   projectSizeList: null,
//                   title: service['title'],
//                   price: service['price'].toString(),
//                   description: service['description'],
//                   imagePath: service['imagePath'],
//                   serviceDetail: service['serviceDetail'],
//                   onTap: () => _showAddModal(context, service['title'], category!),
//                 );
//               },
//             ),
//           ],
//         ),
//       );
//     } else {
//       // Newer implementation - list of categories
//       return ListView.builder(
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: services.length,
//         itemBuilder: (context, index) {
//           final categoryData = services[index];
//           final bool isSelected = categoryData['category'] == serviceType;
//
//           return Container(
//             margin: const EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               border: isSelected
//                   ? Border.all(color: AppColors.appBarColor, width: 2)
//                   : Border.all(color: Colors.grey.shade200),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.05),
//                   blurRadius: 8,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Category header
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: isSelected ? AppColors.appBarColor.withOpacity(0.1) : Colors.white,
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(12),
//                       topRight: Radius.circular(12),
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: Image.asset(
//                           categoryData['imagePath'],
//                           width: 50,
//                           height: 50,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: Text(
//                           categoryData['category'],
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
//                             color: isSelected ? AppColors.appBarColor : Colors.black87,
//                           ),
//                         ),
//                       ),
//                       if (isSelected)
//                         const Icon(
//                           Icons.check_circle,
//                           color: AppColors.appBarColor,
//                         ),
//                     ],
//                   ),
//                 ),
//
//                 const Divider(height: 1),
//
//                 // Services list
//                 ListView.separated(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: categoryData['data'].length,
//                   separatorBuilder: (context, index) => const Divider(height: 1),
//                   itemBuilder: (context, serviceIndex) {
//                     final service = categoryData['data'][serviceIndex];
//                     return ServiceCard(
//                       context: context,
//                       serviceType: categoryData['category'],
//                       serviceTypeList: serviceTypeList ?? ['Basic Full Home Cleaning', 'Deep Full Home Cleaning'],
//                       projectSizeList: null,
//                       title: service['title'],
//                       price: service['price'].toString(),
//                       description: service['description'],
//                       imagePath: service['imagePath'],
//                       serviceDetail: service['serviceDetail'],
//                       onTap: () => _showAddModal(context, service['title'], categoryData['category']),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     }
//   }
// }

