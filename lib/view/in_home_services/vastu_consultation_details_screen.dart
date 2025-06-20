import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/view/in_home_services/base_service_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

import 'cleaning_details_screen.dart';


/// Data for vastu consistency  services
final List<Map<String, dynamic>> services = [
  {
    'category': "Home Vastu",
    'id': 1,
    'imagePath': "assets/images/vastu-1.jpeg",
    'data': [
      {
        'title': "Basic Home Vastu",
        'rating': 4.8,
        'reviews': 5,
        'price': 555,
        'description':
        "Comprehensive Vastu consultation for your home to ensure positive energy flow and harmony. Our expert Vastu consultants will analyze your home's layout and provide recommendations for optimal placement of rooms, furniture, and décor elements according to ancient Vastu principles.",
        'imagePath': "assets/images/vastu-1.jpeg",
        'serviceDetail':[
          {
            'header': "What's Included?",
          'data':[
            'Complete home Vastu analysis and assessment',
            'Room-wise Vastu recommendations and corrections',
            'Guidance on furniture placement and interior arrangement',
            'Detailed Vastu report with actionable suggestions',
            'Follow-up consultation for clarifications'
          ]
          },
          {
            'header': "What's Not Included?",
          'data':[
            'Physical modifications or construction work',
            'Purchase of Vastu remedies or artifacts',
            'Structural changes to the building'
          ]
          }
        ],
      },
    ]
  },
  {
    'category': "Office Vastu",
    'id': 2,
    'imagePath': "assets/images/vastu-2.jpeg",
    'data': [
      {
        'title': "Office Vastu Consultation",
        'rating': 4.8,
        'reviews': 5,
        'price': 555,
        'description':
        "Professional Vastu consultation for your office space to enhance productivity, prosperity, and positive work environment. Our consultants will provide specialized guidance for commercial spaces to attract success and maintain harmonious workplace energy.",
        'imagePath': "assets/images/vastu-2.jpeg",
        'serviceDetail':[
          {
            'header': "What's Included?",
          'data':[
            'Complete office layout Vastu analysis',
            'Desk and seating arrangement recommendations',
            'Guidance on office entrance and reception area placement',
            'Conference room and meeting space Vastu tips',
            'Detailed consultation report with implementation guidelines'
          ]
          },
          {
            'header': "What's Not Included?",
          'data':[
            'Office renovation or construction services',
            'Purchase of office furniture or Vastu items',
            'Ongoing maintenance consultations'
          ]
          }
        ],
      },
    ]
  },
  {
    'category': "Business Vastu",
    'id': 3,
    'imagePath': "assets/images/vastu-3.jpeg",
    'data': [
      {
        'title': "Basic Business Vastu",
        'rating': 4.8,
        'reviews': 5,
        'price': 555,
        'description':
        "Specialized Vastu consultation for business establishments including shops, showrooms, and commercial spaces. Our expert guidance helps attract customers, increase sales, and ensure business prosperity through proper Vastu alignment.",
        'imagePath': "assets/images/vastu-3.jpeg",
        'serviceDetail':[
          {
            'header': "What's Included?",
          'data':[
            'Business premises Vastu evaluation',
            'Cash counter and storage area positioning guidance',
            'Customer area and display arrangement suggestions',
            'Entrance and exit placement recommendations',
            'Business-specific Vastu remedies and solutions'
          ]
          },
          {
            'header': "What's Not Included?",
          'data':[
            'Business setup or interior design services',
            'Purchase of display fixtures or furniture',
            'Legal or business registration consultations'
          ]
          }
        ],
      },
    ]
  },
  {
    'category': "Vastu For Rooms",
    'id': 4,
    'imagePath': "assets/images/vastu-4.jpeg",
    'data': [
      {
        'title': "Vastu For Bedroom",
        'rating': 4.8,
        'reviews': 5,
        'price': 555,
        'description':
        "Specialized Vastu consultation for bedrooms to ensure restful sleep, positive relationships, and personal well-being. Our experts provide detailed guidance on bed placement, room colors, and décor arrangements for optimal bedroom Vastu.",
        'imagePath': "assets/images/vastu-4.jpeg",
        'serviceDetail':[
          {
            'header': "What's Included?",
          'data':[
            'Bedroom layout and bed placement analysis',
            'Color scheme and lighting recommendations',
            'Wardrobe and furniture positioning guidance',
            'Mirror and electronics placement suggestions',
            'Personalized bedroom Vastu remedies'
          ]
          },
          {
            'header': "What's Not Included?",
          'data':[
            'Bedroom furniture or décor purchases',
            'Interior design or renovation services',
            'Painting or electrical work'
          ]
          }
        ],
      },
      {
        'title': "Vastu For Living Room",
        'rating': 4.8,
        'reviews': 5,
        'price': 555,
        'description':
        "Comprehensive Vastu guidance for living rooms to create a harmonious family environment and positive social interactions. Our consultation covers seating arrangements, entertainment unit placement, and overall living space optimization.",
        'imagePath': "assets/images/Vastu-Living-Room.jpeg",
        'serviceDetail':[
          {
            'header': "What's Included?",
          'data':[
            'Living room layout and furniture arrangement analysis',
            'TV and entertainment unit positioning guidance',
            'Seating arrangement and flow optimization',
            'Lighting and ventilation recommendations',
            'Family harmony enhancement tips'
          ]
          },
          {
            'header': "What's Not Included?",
          'data':[
            'Living room furniture or appliances',
            'Interior decoration services',
            'Electrical or lighting installation work'
          ]
          }
        ],
      },
      {
        'title': "Vastu For Kitchen",
        'rating': 4.8,
        'reviews': 5,
        'price': 555,
        'description':
        "Expert Vastu consultation for kitchens to ensure health, prosperity, and positive energy in the heart of your home. Our specialists provide guidance on cooking area placement, storage arrangements, and kitchen workflow optimization according to Vastu principles.",
        'imagePath': "assets/images/Vasti-Kitchen.jpeg",
        'serviceDetail':[
          {
            'header': "What's Included?",
          'data':[
            'Kitchen layout and cooking area analysis',
            'Stove, sink, and refrigerator placement guidance',
            'Storage and cabinet arrangement recommendations',
            'Kitchen entrance and ventilation suggestions',
            'Health and prosperity enhancement tips'
          ]
          },
          {
            'header': "What's Not Included?",
          'data':[
            'Kitchen appliances or utensils',
            'Plumbing or electrical modifications',
            'Kitchen renovation or modular kitchen installation'
          ]
          }
        ],
      },
    ]
  },
];

class VastuConsultationDetailsScreen extends StatefulWidget {
  static String tag = '/vastu consultancy';
  final String? serviceType;
  const VastuConsultationDetailsScreen({super.key, this.serviceType});

  @override
  State<VastuConsultationDetailsScreen> createState() => _VastuConsultationDetailsScreenState();
}

class _VastuConsultationDetailsScreenState extends State<VastuConsultationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseServiceScreen(
      title: "Vastu Consultancy",
      serviceType: widget.serviceType,
      services: services, // Use the predefined services list
                  serviceTypeList: ['Replacement', 'Installation','Repair'],
                  serviceSubTypeList:
                  ['Residential', 'Commercial'],
    );
  }
}
