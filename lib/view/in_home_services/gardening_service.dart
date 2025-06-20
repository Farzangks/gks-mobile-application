import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/view/in_home_services/base_service_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

import 'cleaning_details_screen.dart';

/// Data for carpentry services
final List<Map<String, dynamic>> services = [
  {
    'category': "Lawn Care & Upkeep",
    'id': 1,
    'imagePath': "assets/images/Lawn-Mover.jpeg",
    'data': [
      {
        'title':
        "Premium Lawn Care & Maintenance – A Lush, Green Haven Awaits!",
        'rating': 4.5,
        'reviews': 1566,
        'price': 2200,
        'description':
        "Achieve a perfectly manicured, healthy lawn with our expert Lawn Care & Maintenance service. Designed for homeowners who want a vibrant, weed-free, and pest-controlled lawn, we take care of everything from routine upkeep to specialized treatments, ensuring your outdoor space remains beautiful all year round.",
        'imagePath': "assets/images/Gardening-1.jpeg",
        'serviceDetail': [
          {
            'header': 'What’s Included?',
            'data': [
              " Precision Lawn Mowing & Trimming – Maintain an optimal height for a lush, well-groomed appearance.",
              'Customized Fertilization – Tailored nutrition for your grass, ensuring robust growth and lasting greenery.',
              'Weed Control & Prevention – Targeted treatments to keep your lawn pristine and weed-free.',
              'Soil Aeration for Healthier Roots – Enhance soil quality and improve nutrient absorption.',
              'Eco-Friendly Pest Management – Safe, non-toxic solutions to keep pests away while protecting the environment.'
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data': [
              'New lawn or sod installation',
              'Irrigation system installation or repairs',
              'Large-scale landscaping projects'
            ]
          },
          {
            'header': 'Who is This For?',
            'data': [
              'Homeowners who want a lush, picture-perfect lawn',
              'Busy professionals looking for expert lawn care without the hassle',
              'Families preparing for outdoor events and gatherings'
            ]
          },
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1",
              "price": "899",
            },
            {
              "type": "2",
            },
            {
              "type": "3",
            },
            {
              "type": "4+",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title':
        "Expert Plant Care & Maintenance – Keep Your Greenery Thriving!",
        'rating': 4.5,
        'reviews': 1618,
        'price': 2420,
        'description':
        "Ensure your plants stay lush, vibrant, and healthy with our Plant Care & Maintenance service. Whether you have indoor houseplants or an outdoor garden, our expert team provides tailored care to help your plants flourish. We handle everything from watering to pest monitoring, so you can enjoy a thriving green space without the hassle.",
        'imagePath': "assets/images/Gardening-2.jpeg",
        'serviceDetail': [
          {
            'header': 'What’s Included?',
            'data': [
              'Scheduled Watering & Hydration – Ensuring each plant receives the right amount of water for optimal growth.',
              'Precision Pruning & Trimming – Removing dead or overgrown branches to enhance plant health and flowering.',
              'Customized Fertilization – Organic nutrients tailored to each plant’s needs for strong, lush foliage.',
              'Pest & Disease Monitoring – Early detection and management to protect your plants from common threats.',
              'Seasonal Care Adjustments – Adapting maintenance based on climate changes for year-round plant vitality.'
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data': [
              'New plant installations or full landscaping projects',
              'Major pest control treatments beyond routine monitoring',
              'Landscape design for new garden layouts'
            ]
          },
          {
            'header': 'Who is This For?',
            'data': [
              'Homeowners with indoor and outdoor plants needing regular upkeep',
              'Busy individuals who want expert plant care without the effort',
              'Families looking to create a fresh, green, and lively environment'
            ]
          },
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1",
              "price": "899",
            },
            {
              "type": "2",
            },
            {
              "type": "3",
            },
            {
              "type": "4+",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title':
        "Precision Tree Pruning & Trimming – Enhance, Protect, and Beautify",
        'rating': 4.5,
        'reviews': 1618,
        'price': 990,
        'description':
        "Keep your trees healthy, strong, and visually stunning with our Tree Pruning & Trimming service. Whether you need to remove hazardous branches, improve your tree’s shape, or promote healthier growth, our expert team ensures precision care for your outdoor space.",
        'imagePath': "assets/images/Gardening-3.jpeg",
        'serviceDetail': [
          {
            'header': 'What’s Included?',
            'data': [
              'Professional Tree Pruning – Removing dead, damaged, or overgrown branches to boost tree health.',
              'Aesthetic Trimming & Shaping – Enhancing the natural beauty of your trees to complement your landscape.',
              'Comprehensive Tree Health Check – Identifying potential diseases, decay, or structural issues.',
              'Targeted Disease Treatments – Addressing common tree infections to restore vitality.',
              'Complete Post-Service Cleanup – Clearing all pruned branches and leaves for a neat and tidy yard.'
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data': [
              'Full tree removal services (available separately)',
              'New tree installations or large-scale landscaping projects',
              'Intensive tree surgery for advanced health concerns'
            ]
          },
          {
            'header': 'Who is This For?',
            'data': [
              'Homeowners with mature trees needing routine care',
              'Landscape lovers who want to enhance their outdoor space',
              'Families prioritizing tree safety and aesthetic appeal'
            ]
          },
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1",
              "price": "899",
            },
            {
              "type": "2",
            },
            {
              "type": "3",
            },
            {
              "type": "4+",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "Landscape Planning & Design",
    'id': 2,
    'imagePath': "assets/images/Landscape-Archittecture.jpeg",
    'data': [
      {
        'title': "Transform Your Outdoors – Bespoke Landscape Design Services",
        'rating': 4.5,
        'reviews': 1566,
        'price': 3850,
        'description':
        "Elevate your outdoor space with our expert Landscape Design service. Whether you have a compact garden or a sprawling estate, we craft breathtaking, functional, and sustainable landscapes tailored to your vision. From lush greenery to elegant walkways, we design every detail to enhance beauty and usability.",
        'imagePath': "assets/images/Gardening-4.jpeg",
        'serviceDetail': [
          {
            'header': 'What’s Included?',
            'data': [
              'Personalized Consultation & Site Analysis – Understanding your style, space, and climate to create a perfect design.',
              'Custom Landscape Blueprint – Thoughtfully planned layouts including plant selection, hardscaping, and water features.',
              'Expert Plant Curation & Arrangement – Selecting climate-friendly flora for a thriving, picturesque setting.',
              'Hardscape & Pathway Integration – Designing and installing patios, retaining walls, and other landscape elements.',
              'Sustainable Green Practices – Incorporating eco-conscious elements like rainwater harvesting and native plants.',
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data': [
              'Structural construction work beyond landscaping',
              'Ongoing maintenance after installation (available separately)',
              'Large-scale tree or plant removal unless specified'
            ]
          },
          {
            'header': 'Who is This For?',
            'data': [
              'Homeowners looking to boost their property’s curb appeal',
              'Nature lovers who want a functional, scenic outdoor space',
              'Families keen on sustainable, eco-friendly landscape solutions'
            ]
          },
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1",
              "price": "899",
            },
            {
              "type": "2",
            },
            {
              "type": "3",
            },
            {
              "type": "4+",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "Seasonal Garden Makeover – Fresh Blooms for Every Season!",
        'rating': 4.5,
        'reviews': 1566,
        'price': 549,
        'description':
        "Transform your garden with Seasonal Planting, ensuring a vibrant, colorful outdoor space all year round. From radiant flowers to homegrown veggies, we curate and plant the perfect selection for each season, so your garden stays fresh, lively, and full of life.",
        'imagePath': "assets/images/Gardening-5.jpeg",
        'serviceDetail': [
          {
            'header': 'What’s Included?',
            'data': [
              'Handpicked Seasonal Plants – Selection of climate-friendly flowers, vegetables, and shrubs for every season.',
              'Expert Soil Preparation – Optimizing soil health with nutrient-rich treatments for better growth.',
              'Professional Planting – Thoughtful arrangement and spacing for maximum beauty and yield.',
              'Efficient Irrigation Setup – Ensuring proper hydration for long-lasting plant health.',
              'Seasonal Care Tips – Guidance on watering, fertilization, and maintenance for thriving plants.'
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data': [
              'Permanent garden installations or landscaping',
              'Major garden structure modifications',
              'Ongoing maintenance after the initial setup'
            ]
          },
          {
            'header': 'Who is This For?',
            'data': [
              'Homeowners looking for a dynamic, ever-changing garden',
              'Gardening lovers eager to refresh their space with the seasons',
              'Families wanting an interactive, hands-on gardening experience'
            ]
          },
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1",
              "price": "899",
            },
            {
              "type": "2",
            },
            {
              "type": "3",
            },
            {
              "type": "4+",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "Soil Health & Improvement",
    'id': 3,
    'imagePath': "assets/images/Red-Soil-Improvement.jpeg",
    'data': [
      {
        'title': "Soil Health & Improvement",
        'rating': 4.5,
        'reviews': 1566,
        'price': 7,
        'description':
        "Set the perfect foundation for a lush, productive garden with our Soil Preparation Service. Whether you're starting fresh or revitalizing existing soil, we ensure your plants get the nutrients and structure they need to flourish.",
        'imagePath': "assets/images/Gardening-6.jpeg",
        'serviceDetail': [
          {
            'header': 'What’s Included?',
            'data': [
              'Soil Testing & Analysis – Assessing pH, nutrient levels, and soil structure for tailored improvements.',
              'Organic Soil Enrichment – Adding compost, peat moss, and essential nutrients for long-term fertility.',
              'Tilling & Aeration – Enhancing soil texture for better root penetration and drainage.',
              'Weed & Pest Prevention – Clearing harmful elements to give new plants a healthy start.',
              'Custom Soil Blends – Specially formulated mixes for vegetable gardens, flower beds, or container planting.'
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data': [
              'Installation of hardscaping (e.g., pathways, retaining walls).',
              'Planting or garden design services.',
              'Ongoing maintenance after soil prep.'
            ]
          },
          {
            'header': 'Who is This For?',
            'data': [
              'Homeowners starting fresh with a new garden or vegetable patch.',
              'Gardening enthusiasts looking to improve soil quality for better yields.',
              'Eco-conscious individuals adopting sustainable gardening practices.'
            ]
          },
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1",
              "price": "899",
            },
            {
              "type": "2",
            },
            {
              "type": "3",
            },
            {
              "type": "4+",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "Customized Gardening solutions",
    'id': 3,
    'imagePath': "assets/images/Gardening-Equipments.jpeg",
    'data': [
      {
        'title': "Turn Your Terrace into a Green Haven! (Terrace Gardening)",
        'rating': 4.5,
        'reviews': 1618,
        'price': 1650,
        'description':
        "Maximize your rooftop space with our Terrace Gardening Service, designed to create a lush, peaceful retreat right in the heart of your home. Whether you want a flower-filled sanctuary, an herb garden, or a stylish green escape, we bring your vision to life with expert planning and maintenance.",
        'imagePath': "assets/images/Gardening-7.jpeg",
        'serviceDetail': [
          {
            'header': 'What’s Included:',
            'data': [
              'Custom Garden Design – Thoughtfully planned layouts that optimize sunlight, space, and aesthetics.',
              'Perfect Plant Selection – Herbs, flowers, and shrubs that thrive in terrace conditions.',
              'Premium Soil Preparation – Ensuring healthy growth with the right nutrients and drainage.',
              'Planters & Pot Arrangements – Stylishly setting up greenery for a stunning visual effect.',
              'Complete Maintenance – Regular watering, fertilization, trimming, and eco-friendly pest control.'
            ]
          },
          {
            'header': 'What’s Not Included:',
            'data': [
              'Structural modifications or waterproofing.',
              'Large trees or permanent fixtures.',
              'Landscaping services beyond the terrace.',
            ]
          },
          {
            'header': 'Who is This For?',
            'data': [
              'Urban homeowners looking to bring nature into their city life.',
              'Families wanting to grow their own herbs and organic vegetables.',
              'Those who crave a peaceful, green retreat at home.',
            ]
          },
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1",
              "price": "899",
            },
            {
              "type": "2",
            },
            {
              "type": "3",
            },
            {
              "type": "4+",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "Transform Your Balcony into a Green Paradise!",
        'rating': 4.5,
        'reviews': 1618,
        'price': 1650,
        'description':
        "Our Bed Leg Stabilization Service ensures your bed remains sturdy and balanced by addressing issues with loose, damaged, or missing bed legs. This service is ideal for restoring the bed's stability and overall safety.",
        'imagePath': "assets/images/Gardening-8.jpeg",
        'serviceDetail': [
          {
            'header': 'What’s Included:',
            'data': [
              'Personalized Balcony Garden Design – Tailored to fit your space and style.',
              'Handpicked Plant Selection – Based on sunlight, climate, and your preferences.',
              'Vertical Planters & Smart Layouts – Maximizing greenery in compact spaces.',
              'Soil & Fertilization Management – Ensuring healthy plant growth.',
              'Ongoing Care & Maintenance – Watering, pruning, and eco-friendly pest control.'
            ]
          },
          {
            'header': 'What’s Not Included:',
            'data': [
              'Structural modifications or waterproofing.',
              'Large-scale landscaping beyond the balcony.',
              'Heavy construction or major alterations.'
            ]
          },
          {
            'header': 'Who is This For?',
            'data': [
              'City dwellers looking to bring nature into their high-rise homes.',
              'Homeowners who want aesthetic greenery without a garden.',
              'Plant lovers seeking a low-maintenance yet beautiful balcony setup.'
            ]
          },
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1",
              "price": "899",
            },
            {
              "type": "2",
            },
            {
              "type": "3",
            },
            {
              "type": "4+",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "Grow Fresh, Organic Food at Home!",
        'rating': 4.5,
        'reviews': 1618,
        'price': 1650,
        'description':
        "Turn your kitchen space, balcony, or backyard into a thriving organic garden with our Kitchen Garden Setup! Enjoy fresh herbs, veggies, and fruits grown right at home—chemical-free and bursting with flavor.",
        'imagePath': "assets/images/Gardening-9.jpeg",
        'serviceDetail': [
          {
            'header': 'What’s Included:',
            'data': [
              'Personalized Garden Planning – Designed to fit your space and cooking needs.',
              'Expert Plant Selection – Herbs, vegetables, and fruits suited for your climate.',
              'Soil Enrichment & Preparation – Ensuring nutrient-rich soil for better yields.',
              'Garden Installation – Setting up raised beds, containers, or vertical gardens.',
              'Maintenance & Growth Tips – Guidance on watering, pest control, and harvesting.'
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data': [
              'Structural modifications or large-scale landscaping.',
              'Regular maintenance after initial setup.',
              'Installation of automated irrigation systems.',
            ]
          },
          {
            'header': 'Who is This For?',
            'data': [
              'Home cooks who love fresh, organic ingredients.',
              'Families wanting to grow their own food sustainably.',
              'Beginner gardeners looking for an easy and rewarding way to start gardening.',
            ]
          },
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1",
              "price": "899",
            },
            {
              "type": "2",
            },
            {
              "type": "3",
            },
            {
              "type": "4+",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "Custom Vertical Garden Design",
        'rating': 4.5,
        'reviews': 1618,
        'price': 990,
        'description':
        "Transform your walls, balconies, or small spaces into lush, vertical gardens with our Vertical Gardening Setup! Perfect for urban homes, offices, and apartments, this space-saving solution enhances aesthetics, improves air quality, and brings nature closer to you.",
        'imagePath': "assets/images/Gardening-10.jpeg",
        'serviceDetail': [
          {
            'header': 'What’s Included:',
            'data': [
              'Custom Vertical Garden Design – Tailored layouts to match your space & style.',
              'Expert Plant Selection – Climbing, trailing & air-purifying plants.',
              'Installation of Planters & Trellises – Wall-mounted, modular, or freestanding systems.',
              'Soil & Nutrient Optimization – Ensuring healthy, long-lasting plant growth.',
              'Maintenance Tips & Care – Watering, pruning & pest control guidance.'
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data': [
              'Major wall modifications or structural changes.',
              'Large tree installations or heavy landscaping.',
              'Long-term maintenance beyond initial setup.',
            ]
          },
          {
            'header': 'Who is This For?',
            'data': [
              'Urban dwellers with limited space for traditional gardens.',
              'Homeowners wanting to beautify walls & fences naturally.',
              'Eco-conscious individuals looking to purify indoor air with plants.',
            ]
          },
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1",
              "price": "899",
            },
            {
              "type": "2",
            },
            {
              "type": "3",
            },
            {
              "type": "4+",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  }
];

class GardeningService extends StatefulWidget {
  static String tag = '/Gardening';
  final String? serviceType;
  const GardeningService({super.key, this.serviceType});

  @override
  State<GardeningService> createState() => _GardeningServiceState();
}

class _GardeningServiceState extends State<GardeningService> {

  @override
  Widget build(BuildContext context) {
    return BaseServiceScreen(
      title: "Gardening Service",
      serviceType: widget.serviceType,
      services: services, // Use the predefined services list
              serviceTypeList: ['Replacement', 'Installation', 'Repair'],
              serviceSubTypeList: ['Residential', 'Commercial'],
    );
  }
  // final ScrollController _scrollController = ScrollController();
  // final Map<int, GlobalKey> _sectionKeys = {};
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
  //         "Gardening Service",
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
  //     body: ListView(controller: _scrollController, children: [
  //       GridViewSection(
  //         services: services,
  //         onServiceTap: (index) {
  //           // Handle scroll or other actions
  //           _scrollToIndex(index);
  //         },
  //       ),
  //       const SizedBox(height: 1),
  //       ServiceListSection(
  //         services: services,
  //         serviceType: widget.serviceType ?? '',
  //         serviceTypeList: ['Replacement', 'Installation', 'Repair'],
  //         serviceSubTypeList: ['Residential', 'Commercial'],
  //         sectionKeys: _sectionKeys,
  //       ),
  //     ]),
  //   );
  // }
}
