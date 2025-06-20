import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/view/in_home_services/base_service_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/service_bottom_sheet_components.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

import 'cleaning_details_screen.dart';

/// Data for carpentry services
final List<Map<String, dynamic>> services = [
  {
    'category': "Kitchen & Bathroom Pest Control",
    'id': 1,
    'imagePath': "assets/images/Kitchen-Pest.jpeg",
    'data': [
      {
        'title': "Pest Control (With Complete Kitchen Preparation)",
        'rating': 4.5,
        'reviews': 1566,
        'price': 200,
        'description':
            "Say goodbye to cockroaches, ants, and hidden pests with our expert kitchen and bathroom pest control service! We ensure deep treatment with minimal effort from your end. Our unique approach includes utensil removal, allowing us to reach every hidden corner and eliminate pests effectively.",
        'imagePath': "assets/images/Kitchen-Bathroom-WU.jpeg",
        'serviceDetail': [
          {
            'header': 'What’s Included?',
            'data': [
              'Detailed Inspection: Identifying infestation sources and entry points.',
              'Utensil Removal: Ensuring access to hidden pest-prone areas.',
              'Eco-Friendly Treatment: Safe and effective pest control solutions.',
              'Targeted Application: Treating cracks, drains, and breeding zones.',
              'Preventive Shield: Creating a barrier against future infestations.',
              'Expert Tips: Guidance on keeping your kitchen & bathroom pest-free.',
            ]
          },
          {
            'header': 'What’s NOT Included?',
            'data': [
              'Reorganizing utensils after treatment.',
              'Pest control beyond the kitchen & bathroom.',
              'Specialized treatments (termites, bed bugs, honey bees).',
              'Major structural repairs or sealing of large gaps.',
            ]
          },
          {
            'header': 'Why Choose Us?',
            'data': [
              'Comprehensive Coverage: No corner is left untreated.',
              'Safe & Family-Friendly: Non-toxic, child & pet-safe solutions.',
              'Hygienic & Healthy: Eliminates pests that spread diseases.',
              'Long-Lasting Protection: Prevents reinfestation.',
              'Effortless for You: We handle utensil removal for maximum convenience.',
            ]
          },
          {
            'header': 'Service Warranty',
            'data': [
              '3-Month Assurance: If pests return, so do we—for free!',
              'Free Follow-Up: Guaranteed support within the warranty period.',
            ]
          },
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Your Prefrence:", // Custom title
          'serviceTypeList': [
            {
              "type": "Only kitchen",
              "price": "1457",
            },
            {
              "type": "1 Bathroom & Kitchen",
              "price": "1543",
            },
            {
              "type": "2 Bathroom & Kitchen",
              "price": "1628",
            },
            {
              "type": "3 Bathroom & Kitchen",
              "price": "1713",
            },
            {
              "type": "4 Bathroom & Kitchen",
              "price": "1801",
            },
            {
              "type": "5 Bathroom & Kitchen",
              "price": "1886",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "Pest Control (No Utensil Shifting)",
        'rating': 4.5,
        'reviews': 1618,
        'price': 200,
        'description':
            "Looking for a cost-effective way to keep your kitchen and bathroom pest-free? This solution delivers high-quality pest control while allowing you to handle utensil removal at your convenience. Say goodbye to cockroaches, ants, and hidden pests—without breaking the bank!",
        'imagePath': "assets/images/Kitchen-Bathroom-UR.jpeg",
        'serviceDetail': [
          {
            'header': 'What’s Included?',
            'data': [
              '✅ Thorough Inspection: Identifying pest entry points and breeding zones.',
              '✅ Targeted Treatment: Effective pest control solutions applied to infestations.',
              '✅ Crack & Drain Treatment: Eliminating hidden breeding spots.',
              '✅ Perimeter Protection: Preventing future pest entry.',
              '✅ Expert Guidance: Tips to maintain a pest-free space.',
            ]
          },
          {
            'header': 'What’s NOT Included?',
            'data': [
              'Utensil removal or reorganization before/after treatment.',
              'Pest control beyond the kitchen & bathroom.',
              'Specialized treatments (termites, bed bugs, honey bees).',
              'Structural repairs or sealing of major gaps.',
            ]
          },
          {
            'header': 'Why Choose This Plan?',
            'data': [
              'Affordable & Effective: Save money by handling utensils yourself.',
              'Safe for Families: Non-toxic treatments, child & pet-friendly.',
              'Hygienic & Pest-Free: Keeps your kitchen & bathroom spotless.',
              'Convenient & Flexible: Perfect for households managing utensil removal.',
            ]
          },
          {
            'header': 'Service Warranty',
            'data': [
              '3-Month Protection: If pests return, we’ll treat it again—for free!',
              'Complimentary Follow-Up: Assurance within the warranty period.',
            ]
          },
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Your Prefrence:", // Custom title
          'serviceTypeList': [
            {
              "type": "Only kitchen",
              "price": "2058",
            },
            {
              "type": "1 Bathroom & Kitchen",
              "price": "2142",
            },
            {
              "type": "2 Bathroom & Kitchen",
              "price": "2230",
            },
            {
              "type": "3 Bathroom & Kitchen",
              "price": "2315",
            },
            {
              "type": "4 Bathroom & Kitchen",
              "price": "2401",
            },
            {
              "type": "5 Bathroom & Kitchen",
              "price": "2659",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "Apartment Pest Treatment",
    'id': 2,
    'imagePath': "assets/images/Apartment-Pest-Control-Main.jpeg",
    'data': [
      {
        'title': "Apartment Pest Control (With Utensil Handling)",
        'rating': 4.5,
        'reviews': 1566,
        'price': 200,
        'description':
            "This specialized pest control service is designed for apartments, ensuring complete pest eradication with the added convenience of utensil removal. Our professionals thoroughly treat all hidden areas, making it ideal for tackling cockroaches, ants, and other common apartment infestations.",
        'imagePath': "assets/images/Apartment-WR.jpeg",
        'serviceDetail': [
          {
            'header': 'Service Includes:',
            'data': [
              'Comprehensive Inspection: Identifying pest entry points and infested areas.',
              'Utensil Removal: Ensuring access to hidden and hard-to-reach spaces.',
              'Safe & Effective Treatment: Application of non-toxic pest control solutions.',
              'Targeted Pest Elimination: Treating cracks, drains, and breeding zones.',
              'Perimeter Protection: Blocking pest entry for long-term prevention.',
              'Expert Advice: Tips on maintaining a pest-free home.',
            ]
          },
          {
            'header': 'Not Included:',
            'data': [
              'Replacing or reorganizing utensils after service.',
              'Pest control for areas outside the apartment premises.',
              'Specialized treatments for termites, bed bugs, or honey bees.',
              'Structural repairs or sealing of major cracks or gaps.',
            ]
          },
          {
            'header': 'Benefits:',
            'data': [
              'Thorough Treatment: Utensil removal allows complete pest control coverage.',
              'Safe & Eco-Friendly: Non-toxic solutions, safe for families and pets.',
              'Long-Term Protection: Preventive measures to keep pests away.',
              'Hassle-Free Service: Professionals handle utensil removal, minimizing effort for residents.',
              'Apartment-Specific Solutions: Tailored for urban apartment living.',
            ]
          },
          {
            'header': 'Service Warranty:',
            'data': [
              '3-Month Warranty: Guaranteed pest control effectiveness for three months.',
              'Free Follow-Up: Complimentary service if pests return within the warranty period.',
            ]
          },
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Your BHK Type:", // Custom title
          'serviceTypeList': [
            {
              "type": "1 BHK",
              "price": "1972",
            },
            {
              "type": "2 BHK",
              "price": "2144",
            },
            {
              "type": "3 BHK",
              "price": "2315",
            },
            {
              "type": "4 BHK",
              "price": "2659",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "Apartment Pest Control (Without Utensil Handling)",
        'rating': 4.5,
        'reviews': 1566,
        'price': 200,
        'description':
            "A budget-friendly pest control solution tailored for apartments, where homeowners can manage utensil removal themselves. This service effectively eliminates pests and helps maintain a clean, pest-free living space.",
        'imagePath': "assets/images/Apartment-UR.jpeg",
        'serviceDetail': [
          {
            'header': "What's Included?",
            'data': [
              'Comprehensive Inspection – Identifying pest entry points and infestation sources.',
              'Safe & Effective Treatment – Application of non-toxic solutions for thorough pest elimination.',
              'Targeted Treatment – Cracks, drains, and common breeding areas are treated.',
              'Perimeter Protection – Prevents future pest infestations.',
              'Expert Guidance – Professional advice on pest prevention and maintenance.',
            ]
          },
          {
            'header': "What's Not Included?",
            'data': [
              'Utensil Removal/Reorganization – Homeowners handle utensil management before and after service.',
              'External Pest Control – Service covers only the apartment’s interior.',
              'Specialized Treatments – Termites, bed bugs, and honey bees require separate services.',
              'Structural Repairs – Sealing cracks or fixing entry points is not included.',
            ]
          },
          {
            'header': 'Why Choose This Service?',
            'data': [
              'Budget-Friendly – Save on costs by handling utensil removal yourself.',
              'Safe & Reliable – Non-toxic, family-friendly pest control solutions.',
              'Long-Lasting Protection – Preventive measures ensure a pest-free home.',
              'Apartment-Specific – Designed to address common apartment pest issues.',
            ]
          },
          {
            'header': 'Service Warranty',
            'data': [
              "3-Month Warranty – If pests return within three months, we've got you covered.",
              'Free Follow-Up – One complimentary follow-up service for recurring issues.',
            ]
          },
        ], 'serviceOptions': {
        'showServiceType': true,
        'serviceTypeTitle': "Select Your BHK Type:", // Custom title
        'serviceTypeList': [
          {
            "type": "1 BHK",
            "price": "2573",
          },
          {
            "type": "2 BHK",
            "price": "2743",
          },
          {
            "type": "3 BHK",
            "price": "2915",
          },
          {
            "type": "4 BHK",
            "price": "3173",
          },
        ],
        'showServiceSubType': false, // Don't show second section
        // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
      },
      },
    ]
  },
  {
    'category': "Independent House Pest Protection",
    'id': 3,
    'imagePath': "assets/images/Indepednet-Pest-Control-Main.jpeg",
    'data': [
      {
        'title':
            "Bungalow Pest Control – Thorough Protection with Utensil Removal",
        'rating': 4.5,
        'reviews': 1618,
        'price': 200,
        'description':
            "A high-quality pest control solution designed for bungalows and independent houses, ensuring complete pest elimination with the added convenience of utensil removal. Our professionals access hidden and hard-to-reach areas, delivering effective treatment for cockroaches, ants, and other common household pests.",
        'imagePath': "assets/images/Independent-WU.jpeg",
        'serviceDetail': [
          {
            'header': "What's Included?",
            'data': [
              'Detailed Inspection – Identifying pest entry points and breeding zones.',
              'Utensil Removal – Ensuring thorough access to all areas for effective treatment.',
              'Eco-Friendly & Family-Safe Treatment – Non-toxic solutions safe for kids and pets.',
              'Crack & Crevice Treatment – Targeting drains, hidden spaces, and pest hotspots.',
              'Perimeter Protection – Blocking entry points to prevent future infestations.',
              'Expert Advice – Professional guidance on maintaining a pest-free home.',
            ]
          },
          {
            'header': "What's Not Included?",
            'data': [
              'Utensil Reorganization – Homeowners need to arrange utensils post-service.',
              'External Pest Control – Gardens and outhouses require separate treatment.',
              'Specialized Treatments – Termites, bed bugs, and honey bees are not included.',
              'Structural Repairs – Sealing large cracks or gaps is not part of the service.',
            ]
          },
          {
            'header': 'Why Choose This Service?',
            'data': [
              'Complete Coverage – Utensil removal allows for a deep and thorough treatment.',
              'Safe & Eco-Friendly – Non-toxic solutions ensure safety for your family and pets.',
              'Long-Term Protection – Preventive measures help keep your home pest-free.',
              'Hassle-Free Experience – Professionals handle utensil removal for added convenience.',
              'Tailored for Larger Homes – Specifically designed for bungalows and independent houses.',
            ]
          },
          {
            'header': 'Service Warranty',
            'data': [
              '3-Month Warranty – Guaranteed protection against pest recurrence.',
              'Free Follow-Up – One complimentary follow-up if pests return within three months.',
            ]
          },
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Bunglow Size", // Custom title
          'serviceTypeList': [
            {
              "type": "Upto 1000 sq ft",
              "price": "2964",
            },
            {
              "type": "1001-2000 sq ft",
              "price": "3354",
            },
            {
              "type": "2001-3000 sq ft",
              "price": "3687",
            },
            {
              "type": "3001-4000 sq ft",
              "price": "4031",
            },
            {
              "type": "4001-5000 sq ft",
              "price": "4375",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title':
            "Bungalow Pest Control – Thorough Protection without  Utensil Removal",
        'rating': 4.5,
        'reviews': 1618,
        'price': 200,
        'description':
            "This budget-friendly pest control service is perfect for bungalows and independent houses, delivering the same premium treatment without utensil removal. Ideal for homeowners comfortable handling their own utensil management.",
        'imagePath': "assets/images/Independent-UR.jpeg",
        'serviceDetail': [
          {
            'header': "What's Included?",
            'data': [
              'Comprehensive Inspection – Identifying pest entry points and infestation zones.',
              'Targeted Pest Elimination – Effective treatment using safe and reliable solutions.',
              'Crack & Crevice Treatment – Covers drains, gaps, and breeding areas.',
              'Perimeter Protection – Prevents future pest infestations.',
              'Expert Guidance – Professional advice on keeping your home pest-free.',
            ]
          },
          {
            'header': "What's Not Included?",
            'data': [
              'Utensil Removal/Reorganization – Homeowners manage utensils before and after service.',
              'External Pest Control – Gardens and outhouses require separate treatment.',
              'Specialized Treatments – Termites, bed bugs, and honey bees not included.',
              'Structural Repairs – Sealing major cracks or gaps is not part of the service.',
            ]
          },
          {
            'header': 'Why Choose This Service?',
            'data': [
              'Budget-Friendly – Save costs by handling utensil removal yourself.',
              'Safe & Effective – Non-toxic solutions ensure a healthy home environment.',
              'Long-Term Results – Preventive measures help keep pests away.',
              'Designed for Bungalows – Perfect for larger, independent homes with unique pest challenges.',
            ]
          },
          {
            'header': 'Service Warranty',
            'data': [
              '3-Month Warranty – Guaranteed pest control effectiveness for three months.',
              'Free Follow-Up – One complimentary follow-up if pests return within the warranty period.',
            ]
          },
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "Upto 1000 sq ft",
            },
            {
              "type": "1001-2000 sq ft",
            },
            {
              "type": "2001-3000 sq ft",
            },
            {
              "type": "3001-4000 sq ft",
            },
            {
              "type": "4001-5000 sq ft",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },{
    "category": "Insect & Bug Removal",
    "id": 4,
    "imagePath": "assets/images/Insect-Bug-Pest.jpeg",
    "data": [
      {
        "title": "Cockroach Control Treatment",
        "rating": 4.5,
        "reviews": 1566,
        "price": 200,
        "description": "This specialized pest control treatment eliminates cockroaches from kitchens, bathrooms, and hidden spaces, ensuring a hygienic home. Safe for families and pets, our service provides long-term protection against cockroach infestations.",
        "imagePath": "assets/images/Cockroach-Pest.jpeg",
        "serviceDetail": [
          {
            "header": "What's Included?",
            "data": [
              "Thorough Inspection – Identifying cockroach hotspots and breeding zones.",
              "Targeted Treatment – Application of gel bait and sprays for maximum effectiveness.",
              "Crack & Crevice Treatment – Covers drains, gaps, and common hiding spots.",
              "Perimeter Protection – Prevents future infestations and cockroach entry.",
              "Expert Guidance – Professional advice on maintaining a cockroach-free home."
            ]
          },
          {
            "header": "What's Not Included?",
            "data": [
              "External Pest Control – Areas outside the specified treatment zones.",
              "Specialized Pest Treatments – Termites, bed bugs, and other pests require separate services.",
              "Structural Repairs – Sealing cracks or fixing entry points is not included."
            ]
          },
          {
            "header": "Why Choose This Service?",
            "data": [
              "Thorough Eradication – Effectively targets all cockroach breeding zones.",
              "Family & Pet Safe – Non-toxic solutions for a worry-free home.",
              "Long-Term Protection – Preventive measures help stop cockroaches from returning.",
              "Hygienic Living – Keeps kitchens and bathrooms clean and pest-free."
            ]
          },
          {
            "header": "Service Warranty",
            "data": [
              "3-Month Warranty – Guaranteed cockroach control for three months.",
              "Free Follow-Up – One complimentary service if cockroaches return during the warranty period."
            ]
          }
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Your BHK Type:", // Custom title
          'serviceTypeList': [
            {
              "type": "1 BHK",
              "price": "1972",
            },
            {
              "type": "2 BHK",
              "price": "2144",
            },
            {
              "type": "3 BHK",
              "price": "2315",
            },
            {
              "type": "4 BHK",
              "price": "2504",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        "title": "Bed Bug Control Treatment",
        "rating": 4.5,
        "reviews": 1566,
        "price": 200,
        "description": "This specialized service ensures complete removal of bed bugs from mattresses, furniture, and hidden crevices, creating a comfortable and pest-free home. Safe for families and pets, our treatment eliminates bed bugs at all life stages.",
        "imagePath": "assets/images/BedBug-Pest.png",
        "serviceDetail": [
          {
            "header": "What's Included?",
            "data": [
              "Detailed Inspection – Identifying bed bug hotspots in mattresses, furniture & crevices.",
              "Targeted Treatment – Safe & effective solutions to eliminate bed bugs at every stage.",
              "Comprehensive Coverage – Treatment of mattresses, furniture, cracks & hiding spots.",
              "Expert Advice – Professional tips to prevent reinfestation."
            ]
          },
          {
            "header": "What's Not Included?",
            "data": [
              "Other Pest Treatments – Termites, cockroaches, and other pests require separate services.",
              "Furniture Repairs/Replacements – Fixing or replacing infested items is not included."
            ]
          },
          {
            "header": "Why Choose This Service?",
            "data": [
              "Effective & Long-Lasting – Eliminates bed bugs at all life stages for lasting relief.",
              "Safe & Non-Toxic – Family-friendly solutions for a worry-free home.",
              "Restful Sleep – Say goodbye to bites and enjoy uninterrupted sleep.",
              "Expert Prevention Tips – Learn how to keep your home bed bug-free."
            ]
          },
          {
            "header": "Service Warranty",
            "data": [
              "3-Month Warranty – Guaranteed bed bug control for three months.",
              "Free Follow-Up – One complimentary service if bed bugs return within the warranty period."
            ]
          }
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Your BHK Type:", // Custom title
          'serviceTypeList': [
            {
              "type": "1 BHK",
              "price": "1929",
            },
            {
              "type": "2 BHK",
              "price": "2072",
            },
            {
              "type": "3 BHK",
              "price": "2215",
            },
            {
              "type": "4 BHK",
              "price": "2358",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        "title": "Rodent Control",
        "rating": 4.5,
        "reviews": 1566,
        "price": 200,
        "description": "Our rodent control service eliminates rats and mice while preventing future infestations. Using safe and humane methods, we protect your home, health, and property from rodent-related damage and contamination.",
        "imagePath": "assets/images/Rodent-Control.jpeg",
        "serviceDetail": [
          {
            "header": "What's Included?",
            "data": [
              "Thorough Inspection – Identify rodent entry points, nesting areas, and infestation signs.",
              "Humane Trapping & Removal – Safe methods to quickly eliminate rodent activity.",
              "Rodenticide Application (If Needed) – Pet- & child-safe treatment for inaccessible areas.",
              "Sanitation & Nest Removal – Cleaning of droppings, nests, and debris.",
              "Bait Stations – Secure, tamper-resistant bait stations for long-term rodent control.",
              "Prevention Tips – Expert guidance on sanitation and rodent-proofing your home."
            ]
          },
          {
            "header": "Why Choose This Service?",
            "data": [
              "Effective & Humane – Safe removal methods that minimize harm.",
              "Protects Health & Property – Prevents disease transmission and damage.",
              "Long-Term Prevention – Reduces the risk of future infestations.",
              "Safe for Families & Pets – Non-toxic options for a worry-free environment."
            ]
          }
        ], 'serviceOptions': {
        'showServiceType': true,
        'serviceTypeTitle': "Select Your BHK Type:", // Custom title
        'serviceTypeList': [
          {
            "type": "1 BHK",
            "price": "1143",
          },
          {
            "type": "2 BHK",
            "price": "1429",
          },
          {
            "type": "3 BHK",
            "price": "1715",
          },
          {
            "type": "4 BHK",
            "price": "2145",
          },
        ],
        'showServiceSubType': false, // Don't show second section
        // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
      },
      },
      {
        "title": "Commercial Pest Management",
        "rating": 4.5,
        "reviews": 1566,
        "price": 200,
        "description": "A clean and pest-free workspace is essential for a healthy environment and a positive impression on customers and employees. Our expert pest control solutions are designed to eliminate pests while ensuring minimal disruption to your business operations.",
        "imagePath": "assets/images/Commercial-Pest-Control.jpeg",
        "serviceDetail": [
          {
            "header": "What's Included?",
            "data": [
              "Detailed Inspection – Identify pest entry points, nesting sites, and infestation risks.",
              "Customized Treatment Plans – Tailored solutions for offices, retail shops, and warehouses.",
              "Cockroach Control – Targeted insecticide applications to eliminate infestations.",
              "Rodent Control – Humane trapping, baiting, and entry point sealing.",
              "Ant and Termite Treatment – Preventive and curative solutions to protect property.",
              "Fly and Insect Management – Traps and barrier treatments to control nuisance pests.",
              "Sanitation and Prevention Tips – Expert guidance on reducing pest risks.",
              "Ongoing Monitoring and Maintenance – Regular follow-ups for long-term control.",
              "Emergency Pest Control – Rapid response for unexpected infestations."
            ]
          },
          {
            "header": "Why Choose This Service?",
            "data": [
              "Professional and Discreet – Ensure a pest-free business environment.",
              "Comprehensive Protection – Covers all major commercial pest threats.",
              "Long-Term Pest Control – Preventive measures for sustained results.",
              "Minimal Business Disruption – Fast, efficient, and hassle-free service."
            ]
          }
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "Restaurants & Food Service",
              "price": "3900",
            },
            {
              "type": "Hotels & Hospitality",
              "price": "4212",
            },
            {
              "type": "Commercial Buildings",
              "price": "4524",
            },
            {
              "type": "Industrial Facilities",
              "price": "4992",
            },
            {
              "type": "Office/Shop Pest Control 2000-3000sqft",
              "price": "4524",
            },
            {
              "type": "Office/Shop Pest Control 3000-4000sqft",
              "price": "5016",
            },
            {
              "type": "Office/Shop Pest Control 4000-5000sqft",
              "price": "5508",
            },
            {
              "type": "Office/Shop Pest Control 5000sqft+",
              "price": "6000",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      }
    ]
  }
];

class PestControlAndDisinfect extends StatefulWidget {
  static String tag = '/PestControl';
  final String? serviceType;
  const PestControlAndDisinfect({super.key, this.serviceType});

  @override
  State<PestControlAndDisinfect> createState() =>
      _PestControlAndDisinfectState();
}

class _PestControlAndDisinfectState extends State<PestControlAndDisinfect> {

  @override
  Widget build(BuildContext context) {
    return BaseServiceScreen(
      title: "Pest Control and Disinfect",
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
  // void _showAddModal(BuildContext context, String title) {
  //   showModalBottomSheet(
  //     useSafeArea: true,
  //     isScrollControlled: true,
  //     context: context,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) => ServiceBottomSheetComponents(
  //       serviceSubCategory: title,
  //       serviceType: widget.serviceType,
  //       serviceTypeList: ['Utensil Removal', 'No Utensil Removal'],
  //     ),
  //   );
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     extendBody: true,
  //     appBar: AppBar(
  //       title: const Text(
  //         "Pest Control and Disinfect",
  //         style: TextStyle(color: AppColors.white),
  //       ),
  //       backgroundColor: AppColors.appBarColor,
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
  //           serviceTypeList: ['basic Cleaning', 'deep Cleaning'],
  //           sectionKeys: _sectionKeys,
  //           // serviceSubTypeList: (services.isNotEmpty &&
  //           //     (services.first['category'] == 'Residential Cleaning' || services.first == services[0]))
  //           //     ? ['1 BHK', '2 BHK', '3 BHK', '4 BHK', '5 BHK']
  //           //     : null,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
