import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:ghar_ka_sathi/controller/property_service_controller.dart';
import 'package:ghar_ka_sathi/view/in_home_services/base_service_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/cleaning_details_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/constant.dart';
import 'package:lottie/lottie.dart';
import 'package:itq_utils/itq_utils.dart';

/// Data for carpentry services
final List<Map<String, dynamic>> services = [
  {
    'category': "Complete Home Interiors",
    'id': 1,
    'imagePath': "assets/images/RED-Room.jpeg",
    'data': [
      {
        'title': "Essential Interior Makeover",
        'rating': 4.8,
        'reviews': 5,
        'price': 500000,
        'description':
        "A well-curated interior solution designed for homeowners seeking sophistication on a budget. This package ensures optimal space utilization, aesthetic enhancement, and a seamless execution process without unnecessary expenses.",
        'imagePath': "assets/images/Essential-Makeover.jpeg",
        'serviceDetail':[
          {
            'header': 'Key Inclusions:',
            'data':[
              'Space Planning & 2D Layout – Smart furniture placement for maximum functionality',
              'Material Selection – Standard laminates, high-quality flooring, and premium paint',
              'Lighting & Electrical Design – Strategically planned for ambiance and efficiency',
              'Modular Furniture Design – Standard configurations for a cohesive, modern look',
              'Project Coordination – Professional oversight for seamless execution',
              'Completion Timeline – 4 to 6 weeks',
            ]
          },
          {
            'header': 'Estimated Budget:',
            'data':[
              '₹5,00,000 - ₹8,00,000'
            ]
          },
          {
            'header': 'Ideal For:',
            'data':[
              '1 & 2 BHK apartments',
              'Homeowners looking for cost-effective yet elegant interiors',
              'Quick transformation with essential design upgrades',
            ]
          },
        ],
      },
      {
        'title': "Premium Interior Elegance",
        'rating': 4.8,
        'reviews': 5,
        'price': 1200000,
        'description':
        "A meticulously crafted interior design package that blends luxury with functionality. Offering personalized solutions, premium materials, and expert craftsmanship, this package ensures a sophisticated and refined living space tailored to your style.",
        'imagePath': "assets/images/Standard-Makeover.jpeg",
        'serviceDetail':[
          {
            'header': 'Key Inclusions:',
            'data':[
              '2D & 3D Design Renderings – Realistic visuals for precise planning',
              'Custom Furniture & Modular Kitchen – Tailored designs for enhanced utility',
              'Premium Material Selection – High-gloss finishes, designer flooring, and statement tiles',
              'Decorative Lighting & Accent Pieces – Thoughtfully curated for elegance',
              'End-to-End Project Management – Professional execution with regular progress updates',
              'Smart Home Integration (Optional) – Advanced automation for modern living',
              'Completion Timeline – 6 to 8 weeks',
            ]
          },
          {
            'header': 'Estimated Budget:',
            'data':[
              '₹12,00,000 - ₹20,00,000',
            ]
          },
          {
            'header': 'Ideal For:',
            'data':[
              '2 & 3 BHK apartments or villas',
              'Homeowners seeking a refined yet mid-range luxury interior',
              'Those who desire a seamless fusion of aesthetics and functionality',
            ]
          },
        ],
      },
      {
        'title': "Luxury Interior Masterpiece",
        'rating': 4.8,
        'reviews': 5,
        'price': 2500000,
        'description':
        "A bespoke interior design package curated for those who demand nothing but the finest. This high-end offering blends sophistication, exclusivity, and impeccable craftsmanship, ensuring a timeless and luxurious living experience.",
        'imagePath': "assets/images/Luxury-Makeover.jpeg",
        'serviceDetail':[
          {
            'header': 'Key Inclusions:',
            'data':[
              '2D & 3D Designs with Full Virtual Walkthroughs – Immersive visualization for flawless execution',
              'Bespoke Furniture & Cabinetry – Custom-crafted to perfection',
              'Exquisite Material Selection – Natural stone, hardwood flooring, and premium upholstery',
              'Custom Lighting & Home Automation – Intelligent solutions for ultimate convenience and ambiance',
              'Handpicked Decor & Artworks – Luxury furnishings and statement pieces for a refined aesthetic',
              'Dedicated Project Manager – Personalized oversight for precision and quality control',
              'Completion Timeline – 8 to 10 weeks',
            ]
          },
          {
            'header': 'Estimated Budget:',
            'data':[
              '₹25,00,000 - ₹50,00,000',
            ]
          },
          {
            'header': 'Ideal For:',
            'data':[
              'Large villas, penthouses, and ultra-luxury residences',
              'Homeowners seeking an exclusive, top-tier interior experience',
              'Those who desire a fully customized, high-end design solution',
            ]
          },
        ],
      },
    ]
  },
  {
    'category': "Modular Kitchen Solutions",
    'id': 2,
    'imagePath': "assets/images/RED-kitchen.jpeg",
    'data': [
      {
        'title': "Essential Modular Kitchen",
        'rating': 4.8,
        'reviews': 5,
        'price': 150000,
        'description':
        "A cost-effective modular kitchen solution designed for compact and medium-sized spaces. This package prioritizes functionality, smart space utilization, and durability while maintaining affordability.",
        'imagePath': "assets/images/Luxury-Kitchen.jpeg",
        'serviceDetail':[
          {
            'header': 'Key Inclusions:',
            'data':[
              'Standard Modular Cabinets – Durable finishes in laminate or membrane',
              'Essential Countertop Options – Choice of granite or solid surface',
              'Basic Backsplash Design – Elegant ceramic tile options',
              'Standard Kitchen Appliances – Includes hob and chimney for efficient cooking',
              'Essential Lighting & Electrical Setup – Functional and well-placed fixtures',
              'Seamless Installation & Assembly – Hassle-free execution by professionals',
              'Completion Timeline – 2 to 3 weeks',
            ]
          },
          {
            'header': 'Estimated Budget:',
            'data':[
              '₹1,50,000 - ₹3,00,000',
            ]
          },
          {
            'header': 'Ideal For:',
            'data':[
              'Small or compact kitchens',
              'Homeowners looking for a budget-friendly yet functional design',
              'Efficient kitchen layouts with essential features',
            ]
          },
        ],
      },
      {
        'title': "Premium Modular Kitchen",
        'rating': 4.8,
        'reviews': 5,
        'price': 400000,
        'description':
        "A sophisticated modular kitchen solution designed for those who seek a perfect blend of style, efficiency, and premium materials. This package offers personalized designs, high-quality finishes, and smart integrations to elevate your culinary space.",
        'imagePath': "assets/images/Premium-Modular.jpeg",
        'serviceDetail':[
          {
            'header': 'Key Inclusions:',
            'data':[
              'Custom-Designed Modular Cabinets – Premium finishes in high-gloss, acrylic, or membrane',
              'Elegant Countertops – Options include quartz and marble for a refined look',
              'Designer Backsplash – Choice of glass or decorative tiles to enhance aesthetics',
              'Integrated Kitchen Appliances – Includes hob, chimney, oven, and microwave',
              'Advanced Lighting & Electrical Setup – Task lighting for improved functionality',
              'Soft-Closing Drawers & High-Quality Fittings – Effortless usability and durability',
              'Completion Timeline – 4 to 6 weeks',
            ]
          },
          {
            'header': 'Estimated Budget:',
            'data':[
              '₹4,00,000 - ₹7,00,000',
            ]
          },
          {
            'header': 'Ideal For:',
            'data':[
              'Medium to large kitchens in apartments or houses',
              'Homeowners who seek a refined balance between quality and design',
              'Families desiring modern aesthetics with enhanced functionality',
            ]
          },
        ],
      },
      {
        'title': "Luxury Modular Kitchen",
        'rating': 4.8,
        'reviews': 5,
        'price': 800000,
        'description':
        "An exquisite modular kitchen solution crafted for those who desire unparalleled luxury, cutting-edge technology, and bespoke craftsmanship. This high-end package features premium materials, state-of-the-art appliances, and smart innovations, delivering a sophisticated and seamless culinary experience.",
        'imagePath': "assets/images/Luxury-Modular.jpeg",
        'serviceDetail':[
          {
            'header': 'Key Inclusions:',
            'data':[
              'Bespoke Modular Cabinets – Luxury finishes in real wood veneer, lacquered glass, or PU finish',
              'Exquisite Countertops – Imported marble, quartzite, or high-end solid surfaces',
              'Exclusive Backsplash Designs – Mosaic tiles, natural stone, or sleek glass panels',
              'High-End Integrated Appliances – Smart hob, chimney, built-in fridge, wine cooler, and dishwasher',
              'Smart Kitchen Technology – Touch-free faucets, under-cabinet lighting, and sensor-controlled appliances',
              'Premium Lighting Solutions – LED task lighting and ambient illumination for a refined ambiance',
              'Completion Timeline – 6 to 8 weeks',
            ]
          },
          {
            'header': 'Estimated Budget:',
            'data':[
              '₹8,00,000 - ₹15,00,000',
            ]
          },
          {
            'header': 'Ideal For:',
            'data':[
              'Large kitchens in luxury homes, villas, and penthouses',
              'Homeowners seeking bespoke designs with top-tier materials',
              'Those desiring smart kitchen solutions with an elegant, high-end aesthetic',
            ]
          },
        ],
      },
    ]
  },
  {
    'category': "Room-Specific Interiors",
    'id': 3,
    'imagePath': "assets/images/RED-BED.jpeg",
    'data': [
      {
        'title': "Elegant Living Room Design",
        'rating': 4.8,
        'reviews': 5,
        'price': 300000,
        'description':
        "A meticulously crafted living room design package that blends sophistication, comfort, and functionality. This offering enhances your space with custom furniture, premium finishes, and stylish decor, creating a warm and inviting ambiance.",
        'imagePath': "assets/images/Luxury-Living-Room.jpeg",
        'serviceDetail':[
          {
            'header': 'Key Inclusions:',
            'data':[
              'Bespoke Furniture Design – Custom sofas, center tables, and entertainment units',
              'Premium Wall Finishes – Textured paint, designer wallpaper, or elegant wood paneling',
              'Decorative Lighting Fixtures – Chandeliers, LED accents, and ambient lighting solutions',
              'Enhanced Décor Elements – Designer curtains, plush rugs, and curated artwork',
              'Smart Home Integration (Optional) – Automation for lighting and entertainment',
              'Completion Timeline – 2 to 3 weeks',
            ]
          },
          {
            'header': 'Estimated Budget:',
            'data':[
              '₹3,00,000 - ₹6,00,000',
            ]
          },
          {
            'header': 'Ideal For:',
            'data':[
              'Medium-sized living rooms',
              'Homeowners seeking a refined, stylish, and comfortable space',
              'Families desiring a balance between aesthetics and functionality',
            ]
          },
        ],
      },
      {
        'title': "Sophisticated Bedroom Interior",
        'rating': 4.8,
        'reviews': 5,
        'price': 250000,
        'description':
        "A thoughtfully curated bedroom design package that transforms your space into a serene and elegant retreat. With custom furniture, ambient lighting, and premium décor, this offering ensures a perfect blend of comfort, style, and functionality.",
        'imagePath': "assets/images/Luxury-Bedroom.jpeg",
        'serviceDetail':[
          {
            'header': 'Key Inclusions:',
            'data':[
              'Custom Furniture Design – Tailor-made bed, wardrobes, and bedside tables',
              'Premium Wall Finishes – Paint, designer wallpaper, or textured accents',
              'Ambient & Task Lighting – Strategically placed for both relaxation and functionality',
              'Enhanced Décor – Elegant curtains, plush rugs, and stylish cushions',
              'Smart Space Optimization – Intelligent storage solutions for a clutter-free environment',
              'Completion Timeline – 2 to 3 weeks',
            ]
          },
          {
            'header': 'Estimated Budget:',
            'data':[
              '₹2,50,000 - ₹5,00,000',
            ]
          },
          {
            'header': 'Ideal For:',
            'data':[
              'Master bedrooms and guest rooms',
              'Homeowners seeking a peaceful and stylish retreat',
              'Families looking for a balance of aesthetics and practicality',
            ]
          },
        ],
      },
      {
        'title': "Luxury Bathroom Design",
        'rating': 4.8,
        'reviews': 5,
        'price': 200000,
        'description':
        "A meticulously designed bathroom package that blends modern aesthetics with premium functionality. From high-quality fixtures to elegant tiling and smart storage solutions, this offering transforms your bathroom into a sophisticated and spa-like retreat.",
        'imagePath': "assets/images/Luxury-Bathroom.jpeg",
        'serviceDetail':[
          {
            'header': 'Key Inclusions:',
            'data':[
              'Custom Vanity Units & Storage – Sleek, space-efficient designs for an organized look',
              'Premium Sanitaryware & Fixtures – High-quality fittings for a refined experience',
              'Exquisite Wall & Floor Tiling – Options include ceramic, porcelain, and marble',
              'Advanced Lighting & Mirror Solutions – Ambient and task lighting for a stylish, well-lit space',
              'Comprehensive Plumbing, Electrical & Waterproofing – Ensuring durability and efficiency',
              'Completion Timeline – 2 to 3 weeks',
            ]
          },
          {
            'header': 'Estimated Budget:',
            'data':[
              '₹2,00,000 - ₹4,00,000',
            ]
          },
          {
            'header': 'Ideal For:',
            'data':[
              'Compact to medium-sized bathrooms',
              'Homeowners seeking a stylish and modern bathroom upgrade',
              'Families looking for a balance of luxury, functionality, and durability',
            ]
          },
        ],
      },
    ]
  },
];


/// Main widget for Home Interior
class HomeInterior extends StatefulWidget {
  static String tag = '/Interior';
  final String? serviceType;
  HomeInterior({super.key,this.serviceType});

  @override
  State<HomeInterior> createState() => _HomeInteriorState();
}

class _HomeInteriorState extends State<HomeInterior> {
  @override
  Widget build(BuildContext context) {
    return BaseServiceScreen(
      title: "Interior Service",
      serviceType: widget.serviceType,
      services: services, // Use the predefined services list
      serviceTypeList: ['Replacement', 'Installation', 'Repair'],
      serviceSubTypeList: ['Residential', 'Commercial'],
    );
  }
  // final ScrollController _scrollController = ScrollController();
  // final Map<int, GlobalKey> _sectionKeys = {};
  // final controller = PropertyServiceController(); // Assuming this controller is set up properly
  // DateTime _selectedDate = DateTime.now();
  // TimeOfDay _selectedTime = TimeOfDay.now();
  // String formatTimeOfDay(TimeOfDay time) {
  //   final localizations = MaterialLocalizations.of(context);
  //   return localizations.formatTimeOfDay(time, alwaysUse24HourFormat: true);
  // }
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
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     extendBody: true,
  //     backgroundColor: AppColors.white,
  //     appBar: AppBar(
  //       title: const Text(
  //         "Interior Service",
  //         style: TextStyle(color: AppColors.white, fontSize: 18),
  //       ),
  //       backgroundColor: AppColors.appBarColor,
  //       centerTitle: true,
  //       automaticallyImplyLeading: false,
  //       leading:  IconButton(
  //         icon: Icon(Icons.arrow_back),
  //         color: AppColors.white, onPressed: () {
  //         Get.back();
  //       },
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
  //         const SizedBox(height: 1),ServiceListSection(
  //           services: services,
  //           serviceType: widget.serviceType ?? '',
  //           serviceTypeList: ['basic Cleaning', 'deep Cleaning'],
  //           sectionKeys: _sectionKeys,
  //           // serviceSubTypeList: (services.isNotEmpty &&
  //           //     (services.first['category'] == 'Residential Cleaning' || services.first == services[0]))
  //           //     ? ['1 BHK', '2 BHK', '3 BHK', '4 BHK', '5 BHK']
  //           //     : null,
  //         ),
  //
  //       ],
  //     ),
  //   );
  // }

}

