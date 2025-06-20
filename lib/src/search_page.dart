import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/component/property_card_component.dart';
import 'package:ghar_ka_sathi/controller/property_search_controller.dart';
import 'package:ghar_ka_sathi/model/rent_property_model.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/custom_widget.dart';
import 'package:ghar_ka_sathi/src/section_title.dart';
import 'package:ghar_ka_sathi/src/search_filter_dropdown.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:itq_utils/itq_utils.dart';
import 'package:lottie/lottie.dart';

class ServiceItem {
  final String title;
  final String category;
  final String route;
  final bool isSubcategory;
  final String? parentCategory;

  ServiceItem({
    required this.title,
    required this.category,
    required this.route,
    this.isSubcategory = false,
    this.parentCategory,
  });
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final propertySearchController = Get.put(PropertySearchController());
  final TextEditingController propertySearchTextController = TextEditingController();
  final TextEditingController locationTextController = TextEditingController();
  final TextEditingController serviceSearchController = TextEditingController();
  String selectedCategory = 'All';

  // Property categories
  final List<String> propertyCategories = [
    'All',
    'Residential Land',
    'Commercial Land',
    'Agricultural Land',
    'House',
    'Apartment',
    'Villa',
    'Office Space',
    'Shop',
    'Warehouse'
  ];

  // Enhanced service data structure
  final Map<String, List<Map<String, dynamic>>> serviceData = {
    'Carpenter': [
      {
        'category': "Door",
        'subcategories': [
          "Door Accessories Setup",
          "Lock Replacement Services",
          "Lock Repair Solutions",
          "Lock Installation Services",
          "Door Maintenance and Repair",
          "Sliding Door Repairs",
          "Hinge Installation Services",
          "Professional Door Installation",
          "Door Closer Setup",
          "Mesh Grill Door Installation & Replacement Service",
          "Latch Installation Services",
        ],
      },
      {
        'category': "Window and Curtains",
        'subcategories': [
          "Curtain Rod Installation Service",
          "Professional Window Grill Installation",
          "Window Hinge Fitting",
          "Curtain Blinds Repair & Maintenance",
          "Installation of Curtain Rod with Dual Brackets",
          "Shower Curtain Rod Installation with Two Brackets",
          "Installation of Motorized Blinds (Up to 5 Feet)",
          "Installation Non-Motorized Blinds (up to 5 ft)",
        ],
      },
      {
        'category': "Bed",
        'subcategories': [
          "Bed Frame Support Restoration Service",
          "Bed Leg Stabilization Service",
          "Headboard Restoration",
        ],
      },
      {
        'category': "Drill And Hang",
        'subcategories': [
          "Drilling and Mounting Services",
          "Bathroom Holder and Hanger Installations",
          "Wall Decor Mounting",
          "Bathroom Mirror Setup",
          "Glass Shelf Mounting",
          "Wooden Shelf Setup",
          "Corner Guard and Safety Lock Installation",
          "Bed Fence Installation",
          "Safety Gate Installation",
        ],
      },
      {
        'category': "Cabinets & Cupboards",
        'subcategories': [
          "Channel Repair for Cupboards",
          "Channel Replacement for Cupboards",
          "Hinge Installation for Cupboards",
          "Lock Repair for Cupboards",
          "Lock Replacement for Cupboards",
          "Lock Installation for Cupboards",
        ],
      },
      {
        'category': "Shelving & Storage",
        'subcategories': [
          "Glass Shelf Mounting",
          "Custom Wooden Shelf Installation",
          "Tailored Shelf Installation for Custom Storage Solutions",
        ],
      },
      {
        'category': "Carpenter Consultation",
        'subcategories': [
          "General Carpenter Consultation",
        ],
      },
    ],
    'Cleaning': [
      {
        'category': "Furnished Apartment",
        'subcategories': [
          "Basic Full Home Cleaning",
          "Deep Full Home Cleaning",
        ]
      },
      {
        'category': "Unfurnished Apartment",
        'subcategories': [
          "Basic Full Home Cleaning",
          "Deep Full Home Cleaning",
        ]
      },
      {
        'category': "Furnished Independent",
        'subcategories': [
          "Basic Full Furnished Independent Home Cleaning",
          "Deep Full Furnished Independent",
        ]
      },
      {
        'category': "Unfurnished Independent",
        'subcategories': [
          "Basic Full Unfurnished Independent",
          "Deep Full Unfurnished Independent",
        ]
      },
      {
        'category': "Room Cleaning",
        'subcategories': [
          "Unfurnished BedRoom Cleaning",
          "Furnished BedRoom Cleaning",
          "Unfurnished Living Room Cleaning",
          "Furnished Living Room Cleaning",
        ]
      },
      {
        'category': "Bathroom",
        'subcategories': [
          "Bathroom Cleaning",
        ]
      },
      {
        'category': "Sofa Cleaning",
        'subcategories': [
          "Fabric Sofa Cleaning",
          "Leather Sofa Cleaning",
        ]
      },
      {
        'category': "Carpet Cleaning",
        'subcategories': [
          "Carpet Cleaning",
        ]
      },
      {
        'category': "Mattress Cleaning",
        'subcategories': [
          "Mattress Cleaning",
        ]
      },
      {
        'category': "Water Tank Cleaning",
        'subcategories': [
          "Lofted WaterTank Cleaning",
          "UnderGround WaterTank Cleaning",
        ]
      },
      {
        'category': "Kitchen Cleaning",
        'subcategories': [
          "Kitchen Cleaning",
        ]
      },
      {
        'category': "Move In Kitchen Cleaning",
        'subcategories': [
          "Move In Kitchen Cleaning",
        ]
      },
      {
        'category': "Commercial Cleaning",
        'subcategories': [
          "Commercial Cleaning",
        ]
      },
      {
        'category': "Chimney Cleaning",
        'subcategories': [
          "Chimney Basic Cleaning",
          "Chimney Deep Cleaning",
        ]
      },
    ],
    'Construction': [
      {
        'category': "Turnkey Project",
        'subcategories': [
          "Affordable Turnkey Home Construction",
          "Complete Turnkey Home Construction Solution",
          "Luxury Turnkey Home Construction Solution",
        ]
      },
      {
        'category': "Material Contract",
        'subcategories': [
          "Budget-Friendly Material Contract Home Construction",
          "Standard Material Contract Home Construction",
          "Premium Material Contract Home Construction",
        ]
      },
      {
        'category': "Eco Friendly Green House",
        'subcategories': [
          "Affordable Green Home Construction",
          "Standard Green Home Construction",
          "Luxury Green Home Construction",
        ]
      },
      {
        'category': "Prefabricated House",
        'subcategories': [
          "Budget-Friendly prefabricated Home Construction",
          "Standard Prefabricated Home Construction",
          "Luxury prefabricated Home Construction",
        ]
      },
    ],
    'Electrician': [
      {
        'category': "Switch & Socket",
        'subcategories': [
          "Switch box Installation",
          "Switchboard Installation",
          "SwitchBoard/SwitchBox Repair",
          "AC Switch Installation",
          "Smart Switch Installation",
          "Smart Appliances Installation",
          "Switch-Socket Replacement",
          "Wifi Smart Switch Installation",
        ]
      },
      {
        'category': "Wall/Ceiling Light",
        'subcategories': [
          "Bulb/Tube Light Holder Installation",
          "CFL to LED Replacement",
          "Decorative Lights Installation",
          "Decorative Lights Uninstallation",
          "Decorative Lantern Installation",
          "Wall/Ceiling Light Installation",
          "Chandelier Installation",
        ]
      },
      {
        'category': "Wiring",
        'subcategories': [
          "New External Wiring (Per 5 meters)",
          "New Internal Wiring (Per 5 meters)",
        ]
      },
      {
        'category': "Doorbell",
        'subcategories': [
          "Doorbell Installation",
          "Doorbell Replacement",
        ]
      },
      {
        'category': "MCB & SubMeter",
        'subcategories': [
          "Single Pole MCB Installation",
          "Double Pole MCB Installation",
          "Submeter Installation",
          "MCB/Fuse Replacement",
          "3-Phase Changeover Switch Installation",
        ]
      },
      {
        'category': "Inverter and Stablizer",
        'subcategories': [
          "Inverter Installation",
          "Stablizer Installation",
          "Inverter Fuse Replacement",
          "Inverter Servicing",
          "Inverter Repair",
        ]
      },
      {
        'category': "Electric Services Visit ",
        'subcategories': [
          "Book an Electrician Visit",
        ]
      },
    ],
    'ElectronicAppliances': [
      {
        'category': "Chimney",
        'subcategories': [
          "Chimney Filter Replacement Service",
          "Chimney Airflow Blockage Removal",
          "Chimney Motor Repair",
          "Chimney Suction Power Restoration",
          "Chimney Fan/Blower Repair",
          "Chimney Button/Control Panel Repair",
          "Chimney Light/Bulb Replacement",
          "Chimney Noise Reduction Service",
          "Chimney Duct Repair",
          "Chimney Electrical Repair",
        ]
      },
      {
        'category': "Fans",
        'subcategories': [
          "Expert Fan Installation – Safe, Efficient & Reliable",
          "Professional Fan Uninstallation – Safe, Quick & Hassle-Free",
          "Professional Fan Replacement – Safe, Seamless & Efficient",
          "Expert Fan Repair – Restore Performance & Efficiency",
          "Ceiling Fan Regulator Replacement – Smooth & Reliable Speed Control",
          "Wall Fan Installation",
          "Exhaust Fan Installation",
          "Decorative Ceiling Fan Installation",
          "Pigeon FAN-tastic Ceiling Fan Installation:Regular",
          "Pigeon FAN-tastic Ceiling Fan Installation:Decorative",
          "Pigeon FAN-tastic Ceiling Fan Installation:Smart/BLDC",
        ]
      },
      {
        'category': "Air-Conditioner",
        'subcategories': [
          "AC Service Saver Pack – 2 ACs | Deep Cleaning & Maintenance",
          "AC Service Saver Pack – 3 ACs | Deep Cleaning & Maintenance",
          "AC Service Saver Pack – 4 ACs | Maximum Savings & Efficiency",
          "Gas Refill",
          "Professional AC Repair – Fast, Reliable & Efficient Cooling",
          "Expert AC Service – Keep Your Cooling Efficient & Long-Lasting",
          "Expert AC Installation - Precision, Safety & Efficiency",
          "Professional AC Uninstallation – Safe, Quick & Damage-Free",
        ]
      },
      {
        'category': "Refrigerator",
        'subcategories': [
          "Refrigerator Not Cooling – Inspection & Diagnosis",
          "Refrigerator Water Leakage – Inspection & Diagnosis",
          "Refrigerator Noise Issue – Inspection & Diagnosis",
          "Refrigerator Light Not Working – Inspection & Diagnosis",
          "Refrigerator Water Dispenser Repair – Inspection & Diagnosis",
          "Refrigerator Door Alignment Repair – Inspection & Diagnosis",
          "Refrigerator Door Handle Repair/Replacement – Inspection",
          "Refrigerator Ice Maker Repair – Inspection",
          "Refrigerator Defrosting Issues Repair – Inspection",
          "Refrigerator Door Seal/Gasket Replacement – Inspection",
          "Refrigerator Gas Refilling – Inspection",
          "Single Door Refrigerator Repair – Inspection",
          "Double Door Refrigerator Repair – Inspection",
        ]
      },
      {
        'category': "Microwave",
        'subcategories': [
          "Microwave Heating Issue - Professional Inspection & Repair",
          "Microwave Overheating Issue - Professional Inspection & Repair",
          "Microwave Power Issue - Professional Inspection & Repair",
          "Microwave Button/Touchpad Issue - Professional Inspection & Repair",
          "Microwave Display/Screen Repair - Professional Inspection & Service",
          "Microwave Timer/Clock Repair - Professional Inspection & Service",
          "Microwave Turntable Not Rotating - Professional Inspection & Repair",
          "Microwave Sparking or Arcing - Professional Inspection & Repair",
          "Microwave Noise Repair - Professional Inspection & Service",
          "Microwave Fan Repair - Inspection",
          "Microwave Door Repair - Professional Inspection & Service",
          "Microwave Door Seal/Gasket Replacement - Professional Inspection & Service",
        ]
      },
      {
        'category': "Water-Purifier",
        'subcategories': [
          "Water Purifier Service - Keep Your Water Clean & Safe",
          "Hassle-Free Water Purifier Uninstallation – Safe & Damage-Free",
          "Water Purifier Installation - Hassle-Free & Professional",
          "Water Purifier Low Water Pressure? Get It Fixed!",
          "Water Purifier Pump Repair/Replacement",
          "Water Purifier Taste and Odor Issues Service",
          "Water Purifier UV Lamp Replacement Service",
          "Water Purifier Noise Issues Service",
          "Water Purifier Error Diagnosis & Fix",
          "Fix Water Purifier Leaks – Inlet/Outlet",
          "Replace Water Purifier Filters – Keep Water Fresh & Pure",
        ]
      },
      {
        'category': "Geyser",
        'subcategories': [
          "Geyser Deep Cleaning & Descaling",
          "Geyser Not Heating Water – Repair Service",
          "Geyser Leakage Repair",
          "Geyser Inlet/Outlet Pipe Leakage Repair",
          "Geyser Water Pressure Repair",
          "Geyser Noise Issue Repair",
          "Geyser Timer Repair",
          "Geyser Thermostat Repair & Replacement",
          "Geyser Installation Service",
          "Geyser Uninstallation Service",
        ]
      },
    ],
    'Plumber': [
      {
        'category': "Bath Fitting",
        'subcategories': [
          "Bath accessory installation- 69rs",
          "Shower Installation -89",
        ]
      },
      {
        'category': "Basin And Sink",
        'subcategories': [
          "Wash basin installation",
          "Waste pipe replacement",
          "Sink drainage removal",
        ]
      },
      {
        'category': "Grouting",
        'subcategories': [
          "Bathroom Tile Grouting Service",
          "Kitchen Tile Grouting Service",
        ]
      },
      {
        'category': "water Filter",
        'subcategories': [
          "Shower filter installation",
          "washing machine filter installation",
        ]
      },
      {
        'category': "Drainage",
        'subcategories': [
          "Drainage Cover Installation",
          "Bathroom Drainage Removal",
          "Balcony drainage removal",
        ]
      },
      {
        'category': "Toilet",
        'subcategories': [
          "Replacement of Toilet Seat Covers",
          "Repair of External PVC Flush Tanks",
          "Repair of Concealed Flush Tanks",
          "Repair of External Ceramic Flush Tanks",
          "Floor-Mounted Western Toilet Repairs",
          "Removal of Toilet Pot Blockages",
          "Jet Spray Installation and Repairs",
          "Replacement of Western Toilets:",
          "Installation of Indian Toilets",
          "Flush Tank Replacement",
          "Installation of Western Toilets:",
        ]
      },
      {
        'category': "Tap and Mixer",
        'subcategories': [
          "Tap Repair",
          "Water Mixer Tap Repair",
          "Tap Installation",
          "Water Mixer Installation",
        ]
      },
      {
        'category': "Motor",
        'subcategories': [
          "Water Nozzle Installation",
          "Tap Replacement",
          "Airlock Removal in Motors",
          "Motor Setup and Replacement Services",
        ]
      },
      {
        'category': "WATER TANK",
        'subcategories': [
          "Water Tank Repair",
          "Water Tank Pipeline Repair",
          "Water Overflow Issue Repair",
          "Overhead Water Tank Installation",
          "Pipeline Services",
          "Pipeline Leakage Repair",
          "Water Meter Installation",
        ]
      },
      {
        'category': "Water pipes",
        'subcategories': [
          "Installation of Washing Machine Water Inlet",
          "Setup of Connection Hoses",
        ]
      },
    ],
    'Painting': [
      {
        'category': "Interior Painting",
        'subcategories': [
          "Basic Interior Painting",
          "Deluxe Interior Painting",
          "Rental Painting",
        ]
      },
      {
        'category': "Exterior Painting",
        'subcategories': [
          "Exterior Painting",
        ]
      },
      {
        'category': "Specialty & Decorative",
        'subcategories': [
          "Wall Stencil & Custom Designs",
          "Textured Finishes & Wall Artwork",
          "Accent & Statement Wall Painting",
        ]
      },
      {
        'category': "Woodwork & Cabinetry",
        'subcategories': [
          "Woodwork Polishing",
          "Cabinet Refinishing",
        ]
      },
    ],
    'Interior': [
      {
        'category': "Complete Home Interiors",
        'subcategories': [
          "Essential Interior Makeover",
          "Premium Interior Elegance",
          "Luxury Interior Masterpiece",
        ]
      },
      {
        'category': "Modular Kitchen Solutions",
        'subcategories': [
          "Essential Modular Kitchen",
          "Premium Modular Kitchen",
          "Luxury Modular Kitchen",
        ]
      },
      {
        'category': "Room-Specific Interiors",
        'subcategories': [
          "Elegant Living Room Design",
          "Sophisticated Bedroom Interior",
          "Luxury Bathroom Design",
        ]
      },
    ],
    'PackersMovers': [
      {
        'category': "Local Relocation",
        'subcategories': [
          "1 BHK Local Shifting Service",
          "2 BHK Local Shifting Service",
          "3 BHK Local Shifting Service",
          "4 BHK Local Shifting Service",
        ]
      },
      {
        'category': "City-to-City Moving",
        'subcategories': [
          "1 BHK Long-Distance Relocation (Up to 500 km)",
          "2 BHK Long-Distance Relocation (Up to 500 km)",
          "3 BHK Long-Distance Relocation (Up to 500 km)",
          "4 BHK Long-Distance Relocation (Up to 500 km)",
        ]
      },
    ],
    'PestControl': [
      {
        'category': "Kitchen & Bathroom Pest Control",
        'subcategories': [
          "Pest Control (With Complete Kitchen Preparation)",
          "Pest Control (No Utensil Shifting)",
        ]
      },
      {
        'category': "Apartment Pest Treatment",
        'subcategories': [
          "Apartment Pest Control (With Utensil Handling)",
          "Apartment Pest Control (Without Utensil Handling)",
        ]
      },
      {
        'category': "Independent House Pest Protection",
        'subcategories': [
          "Bungalow Pest Control – Thorough Protection with Utensil Removal",
          "Bungalow Pest Control – Thorough Protection without  Utensil Removal",
        ]
      },
      {
        'category': "Insect & Bug Removal",
        'subcategories': [
          "Cockroach Control Treatment",
          "Bed Bug Control Treatment",
          "Rodent Control",
          "Commercial Pest Management",
        ]
      },
    ],
    'HomeRenovation': [
      {
        'category': "Complete Home Renovation",
        'subcategories': [
          "Standard Home Renovation",
          "Family Centric Renovation",
          "Contemporary Home Makeover",
          "Luxury Home Overhaul",
          "Investment Property Enhancement",
        ]
      },
      {
        'category': "Exterior Renovation",
        'subcategories': [
          "Basic Exterior Upgrade",
          "Comprehensive Exterior Revamp",
          "Premium Exterior Transformation",
        ]
      },
      {
        'category': "Structural Renovation",
        'subcategories': [
          "Foundation Stabilization & Repair",
          "Structural Strengthening & Reinforcement",
          "Customized Structural Modifications",
        ]
      },
      {
        'category': "Room Specific Renovation",
        'subcategories': [
          "Living Room Redesign",
          "Bedroom Renovation",
          "Home Office Transformation",
        ]
      },
      {
        'category': "Bathroom Renovation",
        'subcategories': [
          "Smart Budget Makeover: Affordable Bathroom Upgrade",
          "Smart Elegance: Mid-Range Bathroom Upgrade",
          "Luxury Escape: High-End Bathroom Redesign",
          "Budget Refresh: Affordable Shower & Tub Makeover",
          "Smart Upgrade: Mid-Range Shower & Tub Transformation",
          "Luxury Escape: High-End Shower & Tub Redesign",
          "Budget Fix: Affordable Plumbing & Fixture Update",
          "Smart Upgrade: Mid-Range Plumbing & Fixture Transformation",
          "High-End Plumbing & Fixture Redesign",
        ]
      },
      {
        'category': "Kitchen Renovation",
        'subcategories': [
          "Smart Refresh: Essential Kitchen Upgrade",
          "Tailored Elegance: Lifestyle Kitchen Makeover",
          "Elite Gourmet Kitchen Makeover",
          "Effortless Kitchen Upgrade",
          "Tailor-Made Kitchen Upgrade",
          "Elite Kitchen Transformation",
          "Effortless Countertop Revamp",
          "Stylish & Durable Countertop Upgrade",
          "Elegant & Timeless Countertop Upgrade",
          "Affordable Kitchen Cabinet Makeover",
          "Mid-Range Kitchen Cabinet Upgrade",
          "Elite Custom Kitchen Cabinets",
        ]
      },
      {
        'category': "Waterproofing",
        'subcategories': [
          "Ultimate Roof & Terrace Protection",
          "Ultimate Exterior Wall Protection",
          "Interior Wall Waterproofing",
          "Bathroom Leak-Proofing Solution",
          "Water Tank & Sump Waterproofing Solution",
        ]
      },
      {
        'category': "Fabrication",
        'subcategories': [
          "Steel Fabrication for Security & Safety",
          "Artistic & Decorative Steel Fabrication",
          "Steel Carports & Garage Frame Solutions",
          "Tailor-Made Steel Furniture Fabrication",
          "Premium Custom Glass Door Solutions",
          "Exquisite Window Solutions: Crafted for Style & Efficiency",
          "Modern Glass Partition & Wall Systems",
          "Contemporary Glass Balustrade & Railing Systems",
          "Luminous Roof Innovations: Custom Skylights & Roof Windows",
          "Reflective Elegance: Custom Mirror Crafting & Installation",
          "Contemporary Glass Backsplash & Countertop Solutions",
          "Glass Restoration & Replacement Solutions",
        ]
      },
    ],
  };

  // Route mapping for each service
  final Map<String, String> serviceRoutes = {
    'Carpenter': '/Carpenter',
    'Cleaning': '/Cleaning',
    'Construction': '/Construction',
    'Electrician': '/Electrician',
    'ElectronicAppliances': '/ElectronicAppliances',
    'Plumber': '/Plumber',
    'Painting': '/Painting',
    'Interior': '/Interior',
    'PackersMovers': '/PackersMovers',
    'PestControl': '/PestControl',
    'HomeRenovation': '/HomeRenovation',
  };

  var searchResults = <ServiceItem>[].obs;
  var isSearching = false.obs;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    propertySearchTextController.dispose();
    locationTextController.dispose();
    serviceSearchController.dispose();
    super.dispose();
  }

  // Enhanced search function for services
  void searchServices(String query) {
    if (query.isEmpty) {
      searchResults.clear();
      isSearching.value = false;
      return;
    }

    isSearching.value = true;
    List<ServiceItem> results = [];
    String searchLower = query.toLowerCase();

    serviceData.forEach((serviceKey, categories) {
      String serviceName = _getServiceDisplayName(serviceKey);

      // Search in main service name
      if (serviceName.toLowerCase().contains(searchLower)) {
        results.add(ServiceItem(
          title: serviceName,
          category: serviceName,
          route: serviceRoutes[serviceKey]!,
          isSubcategory: false,
        ));
      }

      // Search in categories and subcategories
      for (var categoryData in categories) {
        String categoryName = categoryData['category'];

        // Search in category names
        if (categoryName.toLowerCase().contains(searchLower)) {
          results.add(ServiceItem(
            title: categoryName,
            category: serviceName,
            route: serviceRoutes[serviceKey]!,
            isSubcategory: false,
            parentCategory: serviceName,
          ));
        }

        // Search in subcategories
        List<String> subcategories = List<String>.from(categoryData['subcategories']);
        for (String subcategory in subcategories) {
          if (subcategory.toLowerCase().contains(searchLower)) {
            results.add(ServiceItem(
              title: subcategory,
              category: categoryName,
              route: serviceRoutes[serviceKey]!,
              isSubcategory: true,
              parentCategory: serviceName,
            ));
          }
        }
      }
    });

    // Remove duplicates and limit results
    Map<String, ServiceItem> uniqueResults = {};
    for (var item in results) {
      String key = "${item.title}_${item.category}";
      if (!uniqueResults.containsKey(key)) {
        uniqueResults[key] = item;
      }
    }

    searchResults.value = uniqueResults.values.take(20).toList();
  }

  String _getServiceDisplayName(String serviceKey) {
    switch (serviceKey) {
      case 'ElectronicAppliances':
        return 'Electronic Appliances';
      case 'PackersMovers':
        return 'Packers & Movers';
      case 'PestControl':
        return 'Pest Control';
      case 'HomeRenovation':
        return 'Home Renovation';
      default:
        return serviceKey;
    }
  }

  void clearServiceSearch() {
    serviceSearchController.clear();
    searchResults.clear();
    isSearching.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        elevation: 0,
        title: Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.appBarColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(25),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              labelStyle: TextStyle(fontWeight: FontWeight.w600),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
              tabs: [
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.home, size: 20),
                      SizedBox(width: 6),
                      Text('Property'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.handyman, size: 20),
                      SizedBox(width: 6),
                      Text('Services'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Property Search Tab
          _buildPropertySearchTab(),
          // Enhanced Services Search Tab
          _buildEnhancedServicesSearchTab(),
        ],
      ),
    );
  }

  // Property Search Tab (keeping existing functionality)
  Widget _buildPropertySearchTab() {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPropertySearchFields(),
                    SizedBox(height: 20),
                    Obx(() => !propertySearchController.showSearchResults.value
                        ? _buildRecentSearches()
                        : SizedBox.shrink()),
                    Obx(() => propertySearchController.showSearchResults.value
                        ? _buildSearchResults()
                        : _buildFeaturedCategories()),
                  ],
                ),
              ),
            ),
            Obx(() => propertySearchController.isLoading.value
                ? Container(
              color: Colors.black.withOpacity(0.3),
              child: Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(
                          color: AppColors.appBarColor,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Searching properties...',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
                : SizedBox.shrink()),
          ],
        ),
      ),
    );
  }

  // Enhanced Services Search Tab
  Widget _buildEnhancedServicesSearchTab() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.bgColor,
            Colors.white,
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Premium Search Bar
            Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.appBarColor.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: serviceSearchController,
                onChanged: (query) {
                  searchServices(query);
                },
                decoration: InputDecoration(
                  hintText: "Search for services, categories, or specific tasks...",
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                  prefixIcon: Container(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.search_rounded,
                      color: AppColors.appBarColor,
                      size: 24,
                    ),
                  ),
                  suffixIcon: serviceSearchController.text.isNotEmpty
                      ? IconButton(
                    icon: Icon(
                      Icons.clear_rounded,
                      color: Colors.grey[400],
                    ),
                    onPressed: clearServiceSearch,
                  )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.grey[200]!,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: AppColors.appBarColor,
                      width: 2,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),

            // Search Results or Service Categories
            Expanded(
              child: Obx(() {
                if (isSearching.value && searchResults.isNotEmpty) {
                  return _buildServiceSearchResults();
                } else if (isSearching.value && searchResults.isEmpty && serviceSearchController.text.isNotEmpty) {
                  return _buildNoSearchResults();
                } else {
                  return _buildServiceCategories();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  // Enhanced Service Search Results
  Widget _buildServiceSearchResults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Text(
                "Search Results",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.appBarColor,
                ),
              ),
              SizedBox(width: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.appBarColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "${searchResults.length}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Spacer(),
              TextButton.icon(
                onPressed: clearServiceSearch,
                icon: Icon(
                  Icons.clear_all_rounded,
                  size: 16,
                  color: AppColors.appBarColor,
                ),
                label: Text(
                  'Clear',
                  style: TextStyle(
                    color: AppColors.appBarColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              final item = searchResults[index];
              return _buildSearchResultCard(item);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchResultCard(ServiceItem item) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColors.redGradient,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            item.isSubcategory ? Icons.subdirectory_arrow_right : _getServiceIcon(item.parentCategory ?? item.category),
            color: Colors.white,
            size: 24,
          ),
        ),
        title: Text(
          item.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Colors.black87,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              item.isSubcategory
                  ? "${item.parentCategory} • ${item.category}"
                  : item.parentCategory ?? item.category,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 6),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: item.isSubcategory
                    ? AppColors.bgColors
                    : AppColors.secondaryBtnLigRed,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                item.isSubcategory ? 'Service' : 'Category',
                style: TextStyle(
                  color: AppColors.appBarColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        trailing: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: AppColors.appBarColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: AppColors.appBarColor,
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, item.route);
        },
      ),
    );
  }

  Widget _buildNoSearchResults() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.bgColors,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(
              Icons.search_off_rounded,
              size: 40,
              color: AppColors.appBarColor,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'No services found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Try searching with different keywords',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: clearServiceSearch,
            icon: Icon(Icons.refresh_rounded),
            label: Text('Show All Services'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.appBarColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  // Enhanced Service Categories
  Widget _buildServiceCategories() {
    final List<Map<String, dynamic>> categories = [
      {
        "title": "Carpenter Services",
        "items": "Door, Window, Curtains, Bed, Drill & Hang Services",
        "pageRoute": "/Carpenter",
        "icon": Icons.carpenter,
        "color": AppColors.btnLightRed,
      },
      {
        "title": "Construction Services",
        "items": "Turnkey Project, Material Contract",
        "pageRoute": "/Construction",
        "icon": Icons.construction,
        "color": AppColors.btnLightGreen,
      },
      {
        "title": "Electrician Service",
        "items": "Switch & Socket, Wall/Ceiling Lights",
        "pageRoute": "/Electrician",
        "icon": Icons.electrical_services,
        "color": AppColors.btnLightRed,
      },
      {
        "title": "Plumber Service",
        "items": "Bath Fitting, Basin & Sink etc.",
        "pageRoute": "/Plumber",
        "icon": Icons.plumbing,
        "color": AppColors.btnLightGreen,
      },
      {
        "title": "Painting Service",
        "items": "Interior Painting, Exterior Painting etc.",
        "pageRoute": "/Painting",
        "icon": Icons.format_paint,
        "color": AppColors.btnLightRed,
      },
      {
        "title": "Cleaning Service",
        "items": "Residential Cleaning, Sofa, Carpet Cleaning etc.",
        "pageRoute": "/Cleaning",
        "icon": Icons.cleaning_services,
        "color": AppColors.btnLightGreen,
      },
      {
        "title": "Interior Service",
        "items": "Complete Home Interiors, Modular Kitchen",
        "pageRoute": "/Interior",
        "icon": Icons.design_services,
        "color": AppColors.btnLightRed,
      },
      {
        "title": "Electronic Appliances Service",
        "items": "AC, Refrigerator, Microwave, Water Purifier",
        "pageRoute": "/ElectronicAppliances",
        "icon": Icons.electrical_services,
        "color": AppColors.btnLightGreen,
      },
      {
        "title": "Packers & Movers Service",
        "items": "Local & Long Distance Moving Services",
        "pageRoute": "/PackersMovers",
        "icon": Icons.local_shipping,
        "color": AppColors.btnLightRed,
      },
      {
        "title": "Pest Control & Disinfect Service",
        "items": "Apartment, House, Commercial Pest Control",
        "pageRoute": "/PestControl",
        "icon": Icons.pest_control,
        "color": AppColors.btnLightGreen,
      },
      {
        "title": "Home Renovation Service",
        "items": "Complete Renovation, Bathroom, Kitchen Upgrade",
        "pageRoute": "/HomeRenovation",
        "icon": Icons.home_repair_service,
        "color": AppColors.btnLightRed,
      },
    ];

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Container(
          margin: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.08),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Navigator.pushNamed(context, category['pageRoute']);
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: index % 2 == 0 ? AppColors.redGradient : AppColors.greenGradient,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        category['icon'],
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category["title"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            category["items"],
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: (index % 2 == 0 ? AppColors.btnLightRed : AppColors.btnLightGreen).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: index % 2 == 0 ? AppColors.btnDarkRed : AppColors.btnDarkGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Keep existing property search methods
  Widget _buildPropertySearchFields() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: propertySearchTextController,
            decoration: InputDecoration(
              hintText: "Search property by name...",
              prefixIcon: Icon(Icons.search, color: AppColors.appBarColor),
              suffixIcon: propertySearchTextController.text.isNotEmpty
                  ? IconButton(
                icon: Icon(Icons.clear, color: Colors.grey),
                onPressed: () {
                  propertySearchTextController.clear();
                },
              )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
        SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: DropdownButtonFormField<String>(
            value: selectedCategory,
            decoration: InputDecoration(
              hintText: 'Select Category',
              prefixIcon: Icon(Icons.category, color: AppColors.appBarColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            ),
            items: propertyCategories.map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  selectedCategory = newValue;
                });
              }
            },
          ),
        ),
        SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: locationTextController,
            decoration: InputDecoration(
              hintText: "Location (optional)",
              prefixIcon: Icon(Icons.location_on, color: AppColors.appBarColor),
              suffixIcon: locationTextController.text.isNotEmpty
                  ? IconButton(
                icon: Icon(Icons.clear, color: Colors.grey),
                onPressed: () {
                  locationTextController.clear();
                },
              )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 15),
            ),
          ),
        ),
        SizedBox(height: 16),
        Container(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              propertySearchController.searchProperties(
                name: propertySearchTextController.text,
                category: selectedCategory != 'All' ? selectedCategory : null,
                location: locationTextController.text,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.appBarColor,
              foregroundColor: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Search Properties',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentSearches() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Recent Searches",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        Obx(() => propertySearchController.recentSearches.isEmpty
            ? Center(
          child: Text(
            'No recent searches',
            style: TextStyle(color: Colors.grey),
          ),
        )
            : Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: propertySearchController.recentSearches.map((search) {
            return GestureDetector(
              onTap: () {
                propertySearchTextController.text = search;
                propertySearchController.searchProperties(
                  category: selectedCategory,
                );
              },
              child: Chip(
                avatar: Icon(Icons.history, size: 18),
                label: Text(search),
                backgroundColor: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                side: BorderSide(color: Colors.transparent),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              ),
            );
          }).toList(),
        )),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSearchResults() {
    if (propertySearchController.errorMessage.isNotEmpty) {
      return Column(
        children: [
          SizedBox(height: 40),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.search_off,
                  size: 60,
                  color: Colors.grey[400],
                ),
                SizedBox(height: 16),
                Text(
                  propertySearchController.errorMessage.value,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    propertySearchController.clearSearch();
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.appBarColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Clear Search',
                    style: TextStyle(color: AppColors.appBarColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    if (propertySearchController.searchResults.isEmpty) {
      return SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Search Results (${propertySearchController.searchResults.length})",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                propertySearchController.clearSearch();
              },
              child: Text(
                'Clear',
                style: TextStyle(color: AppColors.appBarColor),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: List.generate(
            propertySearchController.searchResults.length,
                (index) {
              final property = propertySearchController.searchResults[index];
              return PropertyCard(
                title: property['name'] ?? 'Unknown Property',
                details: property['detail'] != null
                    ? (property['detail'] as String).length > 50
                    ? '${(property['detail'] as String).substring(0, 50)}...'
                    : property['detail']
                    : 'No details available',
                price: property['price']?.toString() ?? 'Price on request',
                location: property['location'] ?? 'Location not specified',
                images: List<String>.from(property['images'] ?? []),
                type: property['type'] ?? 'Buy',
                typeColor: _getTypeColor(property['type'] ?? 'Buy'),
                allPropertyList: property['_id'] != null
                    ? PropertyRentResource.fromJson(property)
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Featured Categories",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            final List<Map<String, dynamic>> featuredCategories = [
              {
                'title': 'Residential Land',
                'icon': Icons.landscape,
                'color': Colors.blue[100]!,
                'iconColor': Colors.blue[700]!,
              },
              {
                'title': 'Houses',
                'icon': Icons.home,
                'color': Colors.green[100]!,
                'iconColor': Colors.green[700]!,
              },
              {
                'title': 'Apartments',
                'icon': Icons.apartment,
                'color': Colors.orange[100]!,
                'iconColor': Colors.orange[700]!,
              },
              {
                'title': 'Commercial',
                'icon': Icons.business,
                'color': Colors.purple[100]!,
                'iconColor': Colors.purple[700]!,
              },
            ];

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = featuredCategories[index]['title'];
                });
                propertySearchController.searchProperties(
                  category: featuredCategories[index]['title'],
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: featuredCategories[index]['color'],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      featuredCategories[index]['icon'],
                      size: 40,
                      color: featuredCategories[index]['iconColor'],
                    ),
                    SizedBox(height: 12),
                    Text(
                      featuredCategories[index]['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(height: 24),
        Text(
          "Popular Searches",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Container(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildPopularSearchChip('Raipur', Icons.location_city),
              _buildPopularSearchChip('Naya Raipur', Icons.location_city),
              _buildPopularSearchChip('Under 30 Lakhs', Icons.monetization_on),
              _buildPopularSearchChip('Premium Villa', Icons.villa),
              _buildPopularSearchChip('Investment Plot', Icons.landscape),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPopularSearchChip(String label, IconData icon) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          propertySearchTextController.text = label;
          propertySearchController.searchProperties(
            name: label,
          );
        },
        child: Chip(
          avatar: Icon(icon, size: 16, color: AppColors.appBarColor),
          label: Text(label),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.grey[300]!),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        ),
      ),
    );
  }

  // Helper Methods
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

  IconData _getServiceIcon(String serviceTitle) {
    if (serviceTitle.contains('Carpenter')) return Icons.carpenter;
    if (serviceTitle.contains('Construction')) return Icons.construction;
    if (serviceTitle.contains('Electrician')) return Icons.electrical_services;
    if (serviceTitle.contains('Plumber')) return Icons.plumbing;
    if (serviceTitle.contains('Painting')) return Icons.format_paint;
    if (serviceTitle.contains('Cleaning')) return Icons.cleaning_services;
    if (serviceTitle.contains('Interior')) return Icons.design_services;
    if (serviceTitle.contains('Electronic')) return Icons.electrical_services;
    if (serviceTitle.contains('Packers')) return Icons.local_shipping;
    if (serviceTitle.contains('Pest')) return Icons.pest_control;
    if (serviceTitle.contains('Renovation')) return Icons.home_repair_service;
    return Icons.handyman;
  }
}