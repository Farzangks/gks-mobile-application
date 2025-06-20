import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:ghar_ka_sathi/component/ratting_widgets.dart';
import 'package:ghar_ka_sathi/controller/ratting_controller.dart';
import 'package:ghar_ka_sathi/view/in_home_services/base_service_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/cart_screen.dart';
import 'package:ghar_ka_sathi/src/review_ratting_component.dart';
import 'package:ghar_ka_sathi/view/in_home_services/service_bottom_sheet_components.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/constant.dart';

/// Data for carpentry services
final List<Map<String, dynamic>> services = [
  {
    'category': "Furnished Apartment",
    'id': 1,
    'imagePath': "assets/images/furnished-apartment.jpeg",
    'data': [
      {
        'title': "Basic Full Home Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description':
            "Regular upkeep and general cleaning, including dusting, vacuuming, mopping, and surface cleaning in all rooms",
        'imagePath': "assets/images/Basic-Furnished-Apartment.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': ['Comprehensive cleaning of furnished spaces']
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1BHK",
              "price": "3299",
            },
            {
              "type": "2BHK",
              "price": "3699",
            },
            {
              "type": "3BHK",
              "price": "4799",
            },
            {
              "type": "4BHK",
              "price": "5899",
            },
            {"type": "5BHK",
              "price": "6299"
            }
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "Deep Full Home Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description':
            "Thorough and detailed cleaning of all areas, including hard-to-reach spots and deep cleaning of surfaces",
        'imagePath': "assets/images/Deep-Furnished-Apartment.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': ['Intensive cleaning of all furnished areas']
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1BHK",
              "price": "4499",
            },
            {
              "type": "2BHK",
              "price": "5199",
            },
            {
              "type": "3BHK",
              "price": "6299",
            },
            {
              "type": "4BHK",
              "price": "7499",
            },
            {"type": "5BHK",
              "price": "7999"
            }
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "Unfurnished Apartment",
    'id': 2,
    'imagePath': "assets/images/unfurnished-apartment.jpeg",
    'data': [
      {
        'title': "Basic Full Home Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description':
            "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Deep-Furnished-Apartment.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': ['Comprehensive cleaning of unfurnished spaces']
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1BHK",
              "price": "4499",
            },
            {
              "type": "2BHK",
              "price": "5199",
            },
            {
              "type": "3BHK",
              "price": "6299",
            },
            {
              "type": "4BHK",
              "price": "7499",
            },
            {"type": "5BHK",
              "price": "7999"
            }
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "Deep Full Home Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description':
            "Thorough and detailed cleaning of unfurnished spaces, covering all areas and surfaces",
        'imagePath': "assets/images/Basic-Unfurnished-Apartment.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': ['Intensive cleaning of unfurnished areas']
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1BHK",
              "price": "4499",
            },
            {
              "type": "2BHK",
              "price": "5199",
            },
            {
              "type": "3BHK",
              "price": "6299",
            },
            {
              "type": "4BHK",
              "price": "7499",
            },
            {"type": "5BHK",
              "price": "7999"
            }
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "Furnished Independent",
    'id': 3,
    'imagePath': "assets/images/furnished-indpendent.jpeg",
    'data': [
      {
        'title': "Basic Full Furnished Independent Home Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description':
            "Comprehensive cleaning of furnished independent spaces, ensuring thorough maintenance",
        'imagePath': "assets/images/Basic-Furnished-Independent.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': ['Detailed cleaning of furnished independent home']
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select House Size:", // Custom title
          'serviceTypeList': [
            {
              "type": "1200sqft",
              "price": "4699",
            },
            {
              "type": "1200sqft - 2000sqft",
              "price": "6099",
            },
            {
              "type": "2000sqft - 3000sqft",
              "price": "12399",
            },
            {
              "type": "3000sqft - 4000sqft",
              "price": "15499",
            },
            {
              "type": "4000sqft - 5000sqft",
              "price": "18099"
            },
            {
              "type": "5000sqft - 6000sqft",
              "price": "20699"
            },
            {
              "type": "5000sqft - 6000sqft",
              "price": "23799"
            }
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "Deep Full Furnished Independent",
        'rating': 4.8,
        'reviews': 5,
        'description':
            "Intensive and thorough cleaning of all areas in a furnished independent home",
        'imagePath': "assets/images/Deep-Furnished-Independent.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': ['Complete deep cleaning of furnished independent spaces']
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select House Size:", // Custom title
          'serviceTypeList': [
            {
              "type": "1200sqft",
              "price": "7199",
            },
            {
              "type": "1200sqft - 2000sqft",
              "price": "10299",
            },
            {
              "type": "2000sqft - 3000sqft",
              "price": "15499",
            },
            {
              "type": "3000sqft - 4000sqft",
              "price": "18499",
            },
            {
              "type": "4000sqft - 5000sqft",
              "price": "23799"
            },
            {
              "type": "5000sqft - 6000sqft",
              "price": "27999"
            },
            {
              "type": "5000sqft - 6000sqft",
              "price": "33199"
            }
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "Unfurnished Independent",
    'id': 4,
    'imagePath': "assets/images/unfurnished-independent.jpeg",
    'data': [
      {
        'title': "Basic Full Unfurnished Independent",
        'rating': 4.8,
        'reviews': 5,
        'description':
            "Comprehensive cleaning of unfurnished independent spaces",
        'imagePath': "assets/images/Basic-Furnished-Independent.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': ['Thorough cleaning of unfurnished independent home']
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select House Size:", // Custom title
          'serviceTypeList': [
            {
              "type": "1200sqft",
              "price": "6199",
            },
            {
              "type": "1200sqft - 2000sqft",
              "price": "7899",
            },
            {
              "type": "2000sqft - 3000sqft",
              "price": "13499",
            },
            {
              "type": "3000sqft - 4000sqft",
              "price": "17199",
            },
            {
              "type": "4000sqft - 5000sqft",
              "price": "20399"
            },
            {
              "type": "5000sqft - 6000sqft",
              "price": "24499"
            },
            {
              "type": "5000sqft - 6000sqft",
              "price": "27999"
            }
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "Deep Full Unfurnished Independent",
        'rating': 4.8,
        'reviews': 5,
        'description':
            "Intensive and detailed cleaning of all areas in an unfurnished independent home",
        'imagePath': "assets/images/Basic-Furnished-Independent.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': ['Complete deep cleaning of unfurnished independent spaces']
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select House Size:", // Custom title
          'serviceTypeList': [
            {
              "type": "1200sqft",
              "price": "6199",
            },
            {
              "type": "1200sqft - 2000sqft",
              "price": "7899",
            },
            {
              "type": "2000sqft - 3000sqft",
              "price": "13499",
            },
            {
              "type": "3000sqft - 4000sqft",
              "price": "17199",
            },
            {
              "type": "4000sqft - 5000sqft",
              "price": "20399"
            },
            {
              "type": "5000sqft - 6000sqft",
              "price": "24499"
            },
            {
              "type": "5000sqft - 6000sqft",
              "price": "27999"
            }
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "Room Cleaning",
    'id': 5,
    'imagePath': "assets/images/Red-Room-Cleaning.jpeg",
    'data': [
      {
        'title': "Unfurnished BedRoom Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description':
            "Thorough cleaning of unfurnished bedroom, including basic maintenance and surface cleaning",
        'imagePath': "assets/images/room-cleaning.jpeg",
        'serviceDetail': [
          {
            'header': 'Service Charge',
            'data': [
              'Up to 1,000 Litres: ₹2,500',
              '1,001 to 2,000 Litres: ₹3,500',
              '2,001 to 5,000 Litres: ₹4,500',
              'Above 5,000 Litres: ₹6,000',
            ]
          }
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
        'title': "Furnished BedRoom Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description':
            "Comprehensive cleaning of furnished bedroom, including detailed maintenance",
        'imagePath': "assets/images/Furnished-Bedroom-Cleaning.jpeg",
        'serviceDetail': [
          {
            'header': 'Service Charge',
            'data': [
              'Up to 1,000 Litres: ₹2,000',
              '1,001 to 2,000 Litres: ₹2,800',
              '2,001 to 5,000 Litres: ₹4,000',
              'Above 5,000 Litres: ₹5,000',
            ]
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1",
              "price": "999",
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
        'title': "Unfurnished Living Room Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description': "Detailed cleaning of unfurnished living room",
        'imagePath': "assets/images/Unfurnished-Livingroom-Cleaning.jpeg",
        'serviceDetail': [
          {
            'header': 'Detail',
            'data': [
              '1499L',
              '1500-2999L',
            ]
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1",
              "price": "1099",
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
        'title': "Furnished Living Room Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description': "Comprehensive cleaning of furnished living room",
        'imagePath': "assets/images/Furnished-Livingroom-Cleaning.jpeg",
        'serviceDetail': [
          {
            'header': 'Detail',
            'data': [
              '1499L',
              '1500-2999L',
            ]
          }
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Rooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1",
              "price": "1399",
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
    'category': "Bathroom",
    'id': 6,
    'imagePath': "assets/images/bathroom-cleaning.jpeg",
    'data': [
      {
        'title': "Bathroom Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description':
            "Stain removal from bathroom tiles, sink, floor, exhaust, window, fan, etc.",
        'imagePath': "assets/images/Furnished-Bathroom-Cleaning.jpeg",
        'serviceDetail': [
          {
            'header': 'Includes',
            'data': [
              'Stain removal from bathroom tiles, sink, floor, exhaust, window, fan, etc.',
              'Comprehensive bathroom cleaning and sanitization',
            ]
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Bathrooms:", // Custom title
          'serviceTypeList': [
            {
              "type": "1 Bathroom",
              "price": "549",
            },
            {
              "type": "2 Bathrooms",
              "price": "1,049",
            },
            {
              "type": "3 Bathrooms",
              "price": "₹1,649",
            },
            {
              "type": "4 Bathrooms",
              "price": "2,149",
            },
            {
              "type": "5 Bathrooms",
              "price": "2,649",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "Sofa Cleaning",
    'id': 7,
    'imagePath': "assets/images/sofa-cleaning.jpeg",
    'data': [
      {
        'title': "Fabric Sofa Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description':
            "Thorough cleaning of fabric sofas, removing stains and dirt",
        'imagePath': "assets/images/Fabric-Sofa-Cleaning.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': ['Deep cleaning of fabric sofas']
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Sofa Size:", // Custom title
          'serviceTypeList': [
            {
              "type": "3 Seater",
              "price": "549",
            },
            {
              "type": "4 Seater",
              "price": "679",
            },
            {
              "type": "5 Seater",
              "price": "849",
            },
            {
              "type": "6 Seater",
              "price": "979",
            },
            {"type": "7 Seater",
              "price": "1049"
            },
            {
              "type": "8 Seater",
              "price": "1199",
            },
            {
              "type": "9 Seater",
              "price": "1349",
            },
            {
              "type": "10 Seater",
              "price": "1499",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "Leather Sofa Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description': "Specialized cleaning and conditioning of leather sofas",
        'imagePath': "assets/images/Leather-Sofa-Cleaning.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': ['Specialized leather sofa cleaning']
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Sofa Size:", // Custom title
          'serviceTypeList': [
            {
              "type": "3 Seater",
              "price": "899",
            },
            {
              "type": "4 Seater",
              "price": "1199",
            },
            {
              "type": "5 Seater",
              "price": "1499",
            },
            {
              "type": "6 Seater",
              "price": "1799",
            },
            {"type": "7 Seater",
              "price": "2099"
            },
            {
              "type": "8 Seater",
              "price": "2399",
            },
            {
              "type": "9 Seater",
              "price": "2699",
            },
            {
              "type": "10 Seater",
              "price": "2999",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "Carpet Cleaning",
    'id': 8,
    'imagePath': "assets/images/carpet-cleaning.jpeg",
    'data': [
      {
        'title': "Carpet Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description':
            "Professional carpet cleaning to remove dirt, stains, and allergens",
        'imagePath': "assets/images/Home-Carpet-Cleaning.jpeg",
        'serviceDetail': [
          {
            'header': 'Included',
            'data': [
              'Dry Dusting: Dust removal from carpet using specialized techniques',
              'Stain Removal: Elimination of tough stains and marks',
              'Deep Cleaning: Thorough cleaning to restore carpet freshness'
            ]
          },
          {
            'header': 'Excluded',
            'data': [
              'Additional treatments may require separate service',
            ]
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Carpet Size:", // Custom title
          'serviceTypeList': [
            {
              "type": "Upto 25 sqft",
              "price": "450",
            },
            {
              "type": "25 - 50 sqft",
              "price": "650",
            },
            {
              "type": "50 - 100 sqft",
              "price": "850",
            },
            {
              "type": "100 - 150 sqft",
              "price": "950",
            },
            {"type": "150 - 200 sqft",
              "price": "1050"
            }
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      }
    ]
  },
  {
    'category': "Mattress Cleaning",
    'id': 9,
    'imagePath': "assets/images/mattress-cleaning.jpeg",
    'data': [
      {
        'title': "Mattress Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description':
            "Comprehensive mattress cleaning to remove dust, mites, and stains",
        'imagePath': "assets/images/Home-Mattress-Cleaning.jpeg",
        'serviceDetail': [
          {
            'header': 'Cleaning Process',
            'data': [
              'Preparation: Careful removal of bedding and preparation of mattress',
              'Stain Removal: Addressing tough stains and marks',
              'Deep Cleaning: Thorough sanitization and cleaning',
              'Final Touches: Deodorizing and freshening the mattress'
            ]
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Mattress Size:", // Custom title
          'serviceTypeList': [
            {
              "type": "Single",
              "price": "450",
            },
            {
              "type": "Double",
              "price": "750",
            },
            {
              "type": "Queen",
              "price": "1000",
            },
            {"type": "King",
              "price": "1150"
            }
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "Water Tank Cleaning",
    'id': 10,
    'imagePath': "assets/images/Red-Water-Tank-Cleaning.jpeg",
    'data': [
      {
        'title': "Lofted WaterTank Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description': "Comprehensive cleaning of lofted water tanks",
        'imagePath': "assets/images/Water-Tank-Cleaning.jpeg",
        'serviceDetail': [
          {
            'header': 'Cleaning Process',
            'data': [
              'Thorough cleaning of lofted water tanks',
              'Removal of sediment and potential contaminants',
              'Sanitization and disinfection'
            ]
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Water Tank Size:", // Custom title
          'serviceTypeList': [
            {
              "type": "1000L",
              "price": "799",
            },
            {
              "type": "1001 -2000L",
              "price": "799",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "UnderGround WaterTank Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description': "Detailed cleaning of underground water tanks",
        'imagePath': "assets/images/Water-Tank-Cleaning.jpeg",
        'serviceDetail': [
          {
            'header': 'Cleaning Process',
            'data': [
              'Comprehensive cleaning of underground water tanks',
              'Thorough removal of sediments and contaminants',
              'Complete sanitization and disinfection'
            ]
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Water Tank Size:", // Custom title
          'serviceTypeList': [
            {
              "type": "Up to 1499L",
              "price": "1199",
            },
            {
              "type": "1500-2999L",
              "price": "1199",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "Kitchen Cleaning",
    'id': 11,
    'imagePath': "assets/images/kitchen-cleaning.jpeg",
    'data': [
      {
        'title': "Kitchen Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description':
            "Comprehensive cleaning of kitchen, including appliances and surfaces",
        'imagePath': "assets/images/Kitchen-Cleaning 2.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': ['Thorough kitchen cleaning and sanitization']
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Type of Kitchen Cleaning:", // Custom title
          'serviceTypeList': [
            {
              "type": "Complete kitchen cleaning",
              "price": "1549",
            },
            {
              "type": "Kitchen cleaning with chimney",
              "price": "2399",
            },
            {
              "type": "Kitchen cleaning with appliances",
              "price": "2399",
            },
            {
              "type": "Kitchen cleaning with chimney and appliances",
              "price": "2999",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "Move In Kitchen Cleaning",
    'id': 12,
    'imagePath': "assets/images/modern-kitchen.jpeg",
    'data': [
      {
        'title': "Move In Kitchen Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description': "Detailed cleaning for kitchens before moving in",
        'imagePath': "assets/images/Kitchen-Move-Cleaning.jpeg",
        'serviceDetail': [
          {
            'header': 'Included',
            'data': [
              'Comprehensive cleaning of kitchen surfaces',
              'Thorough appliance cleaning',
              'Sanitization and preparation for move-in'
            ]
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Type of Move-In Kitchen Cleaning:", // Custom title
          'serviceTypeList': [
            {
              "type": "Complete kitchen cleaning",
              "price": "900",
            },
            {
              "type": "Kitchen cleaning with chimney",
              "price": "1100",
            },
            {
              "type": "Kitchen cleaning with appliances",
              "price": "1300",
            },
            {
              "type": "Kitchen cleaning with chimney and appliances",
              "price": "1600",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "Commercial Cleaning",
    'id': 13,
    'imagePath': "assets/images/Commercial-Cleaning.jpeg",
    'data': [
      {
        'title': "Commercial Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description': "Professional cleaning services for commercial spaces",
        'imagePath': "assets/images/basic-full-home-cleaning.jpg",
        'serviceDetail': [
          {
            'header': ' ',
            'data': [
              'Our Cleaning Process',
            ]
          },
          {
            'header': 'Preparation',
            'data': [
              'We begin by carefully removing all bathroom toiletries and personal items to create an unobstructed space for cleaning. After the cleaning is complete, we will return everything to its original position.',
            ]
          },
          {
            'header': 'Stain Removal',
            'data': [
              'Our team addresses tough stains, including dirt and unsightly black and yellow-brown spots, ensuring that every corner and fixture is thoroughly cleaned.',
            ]
          },
          {
            'header': 'Comprehensive Cleaning',
            'data': [
              'We perform a detailed hand-scrubbing of the floors and tiles, paying special attention to hard-to-reach areas to ensure a deep and effective clean.',
            ]
          },
          {
            'header': 'Final Touches',
            'data': [
              'To complete the process, we dry the bathroom using a multi-fiber cloth and apply a pleasant scented freshener, leaving your space both clean and inviting.',
            ]
          },
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Package:", // Custom title
          'serviceTypeList': [
            {
              "type": "Small Office (Up to 500 sq. ft.)",
              "price": "599",
            },
            {
              "type": "Medium Office (500-1,500 sq. ft.)",
              "price": "599",
            },
            {
              "type": "Large Office (1,500+ sq. ft.)",
              "price": "599",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "Chimney Cleaning",
    'id': 14,
    'imagePath': "assets/images/Red-Color-Chimney.jpeg",
    'data': [
      {
        'title': "Chimney Basic Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description': "Basic cleaning and maintenance of kitchen chimneys",
        'imagePath': "assets/images/Wall-Mounted-Chimney.jpeg",
        'serviceDetail': [
          {
            'header': 'Cleaning Process',
            'data': [
              'Surface cleaning of chimney exterior',
              'Basic filter and mesh cleaning',
              'Removal of light grease and dust'
            ]
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Chimney Type:", // Custom title
          'serviceTypeList': [
            {
              "type": "Wall Mount Chimney",
              "price": "599",
            },
            {
              "type": "Island Chimney",
              "price": "1449",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "Chimney Deep Cleaning",
        'rating': 4.8,
        'reviews': 5,
        'description': "Comprehensive deep cleaning of kitchen chimneys",
        'imagePath': "assets/images/Island-Kitchen-Chimney.jpeg",
        'serviceDetail': [
          {
            'header': 'Cleaning Process',
            'data': [
              'Complete dismantling of chimney components',
              'Thorough cleaning of internal parts',
              'Degreasing and deep sanitization',
              'Reassembly and final inspection'
            ]
          }
        ],

        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Chimney Type:", // Custom title
          'serviceTypeList': [
            {
            "type": "Wall Mount Chimney",
            "price": "999",
            },
            {
            "type": "Island Chimney",
            "price": "1999",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  }
];

class CleaningDetailsScreen extends StatefulWidget {
  static String tag = '/Cleaning';
  final String? serviceType;

  CleaningDetailsScreen({Key? key, this.serviceType}) : super(key: key);

  @override
  State<CleaningDetailsScreen> createState() => _CleaningDetailsScreenState();
}

class _CleaningDetailsScreenState extends State<CleaningDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseServiceScreen(
      title: "Cleaning Service",
      serviceType: widget.serviceType,
      services: services, // Use the predefined services list
      // serviceTypeList: ['basic', 'Standard', 'Premium', 'Custom'],
      // serviceSubTypeList: ['Small', 'Medium', 'Large'],
    );
  }
}

// Updated GridViewSection class
class GridViewSection extends StatelessWidget {
  final List<Map<String, dynamic>> services;
  final Function(int) onServiceTap;
  final int selectedIndex;

  const GridViewSection({
    Key? key,
    required this.services,
    required this.onServiceTap,
    this.selectedIndex = -1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 2,
            mainAxisSpacing: 5,
            childAspectRatio: 0.7,
          ),
          itemCount: services.length,
          itemBuilder: (context, index) {
            final service = services[index];
            final bool isSelected = selectedIndex == index;

            // Staggered animation effect for grid items
            return AnimatedBuilder(
              animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: ModalRoute.of(context)!.animation!,
                  curve: Interval(
                    0.1 + (index * 0.05), // Stagger the animations
                    0.7 + (index * 0.05),
                    curve: Curves.easeOutQuad,
                  ),
                ),
              ),
              builder: (context, child) {
                return Transform.scale(
                  scale: ModalRoute.of(context)!.animation!.value,
                  child: Opacity(
                    opacity: ModalRoute.of(context)!.animation!.value,
                    child: child,
                  ),
                );
              },
              child: Transform(
                transform: isSelected
                    ? (Matrix4.identity()..scale(1.05))
                    : Matrix4.identity(),
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  child: GestureDetector(
                    behavior: HitTestBehavior
                        .opaque, // Makes the entire area tappable
                    onTap: () {
                      // Call the callback directly with our robust scroll
                      onServiceTap(index);
                    },
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: isSelected
                              ? AppColors.appBarColor.withOpacity(0.05)
                              : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: isSelected
                                        ? AppColors.appBarColor
                                        : AppColors.grey),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                                boxShadow: [
                                  BoxShadow(
                                    color: isSelected
                                        ? AppColors.appBarColor.withOpacity(0.2)
                                        : Colors.black.withOpacity(0.1),
                                    blurRadius: isSelected ? 6 : 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Image.asset(service['imagePath'],
                                  fit: BoxFit.fill),
                              clipBehavior: Clip.antiAlias,
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: 80,
                              child: Text(
                                service['category'],
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                  color: isSelected
                                      ? AppColors.appBarColor
                                      : Colors.black,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Enhanced Service List Section with highlighted selected item
class ServiceListSection extends StatelessWidget {
  final List<Map<String, dynamic>> services;
  final String serviceType;
  final List<String> serviceTypeList;
  final List<String>? serviceSubTypeList;
  final VoidCallback? onTap;
  final int selectedIndex;
  final Map<int, GlobalKey> sectionKeys;
  final CartController cartController;
  final bool useDynamicOptions; // New flag to control dynamic options

  const ServiceListSection({
    Key? key,
    required this.services,
    required this.serviceType,
    required this.serviceTypeList,
    this.serviceSubTypeList,
    this.onTap,
    this.selectedIndex = -1,
    required this.sectionKeys,
    required this.cartController,
    this.useDynamicOptions =
        false, // Default to false for backward compatibility
  }) : super(key: key);

  void _showAddModal(BuildContext context, String serviceSubCategory,
      String serviceCategory, String imagePath, int categoryIndex, int subIndex) {

    // Debug the service options
    // _debugServiceOptions(categoryIndex, subIndex);

    // Get the service data for this category
    Map<String, dynamic>? serviceOptions;

    try {
      if (categoryIndex >= 0 && categoryIndex < services.length) {
        final category = services[categoryIndex];
        if (category != null && category.containsKey('data')) {
          final List<dynamic> data = category['data'];
          if (subIndex >= 0 && subIndex < data.length) {
            final serviceData = data[subIndex];
            if (serviceData is Map<String, dynamic> &&
                serviceData.containsKey('serviceOptions')) {
              serviceOptions = serviceData['serviceOptions'] as Map<String, dynamic>?;
              print("Successfully extracted serviceOptions: $serviceOptions");
            }
          }
        }
      }
    } catch (e) {
      print("Error extracting service options: $e");
    }

    // Prepare the values with proper defaults
    final List<dynamic> finalServiceTypeList = serviceOptions?['serviceTypeList'] ?? serviceTypeList;
    final String finalServiceTypeTitle = serviceOptions?['serviceTypeTitle'] ?? "Select Service Type";
    final bool finalShowServiceType = serviceOptions?['showServiceType'] ?? true;
    final bool finalShowServiceSubType = serviceOptions?['showServiceSubType'] ?? false;
    final String finalServiceSubTypeTitle = serviceOptions?['serviceSubTypeTitle'] ?? "Select Project Type";
    final List<String>? finalServiceSubTypeList = serviceOptions?['serviceSubTypeList'] ?? serviceSubTypeList;

    print("Final values being passed:");
    print("serviceTypeList: $finalServiceTypeList");
    print("serviceTypeTitle: $finalServiceTypeTitle");
    print("showServiceType: $finalShowServiceType");
    print("showServiceSubType: $finalShowServiceSubType");

    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ServiceBottomSheetComponents(
        serviceSubCategory: serviceSubCategory,
        serviceType: serviceType,
        serviceCategory: serviceCategory,

        // Use extracted values with proper defaults
        serviceTypeList: finalServiceTypeList,
        serviceTypeTitle: finalServiceTypeTitle,
        showServiceType: finalShowServiceType,
        showServiceSubType: finalShowServiceSubType,
        serviceSubTypeTitle: finalServiceSubTypeTitle,
        serviceSubTypeList: finalServiceSubTypeList,

        imagePath: imagePath,
        onActionPressed: (selectedServiceType, selectedProjectType, added) {
          // The callback will be triggered after adding to cart
          if (added && onTap != null) {
            onTap!();
          }
        },
      ),
    );
  }



  // Add this method to ServiceListSection class for debugging
  String? _getFirstAvailablePrice(List<dynamic>? serviceTypeList) {
    if (serviceTypeList == null || serviceTypeList.isEmpty) return null;

    for (var item in serviceTypeList) {
      if (item is Map<String, dynamic> &&
          item.containsKey('price') &&
          item['price'] != null &&
          item['price'].toString().isNotEmpty) {
        return item['price'].toString();
      }
    }
    return null;
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final category = services[index];
        final bool isSelected = selectedIndex == index;

        // Staggered animation delay for categories
        // final int animDelay = 100 * index;

        return AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOutCubic,
          margin: EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColors.appBarColor.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 0,
                      offset: Offset(0, 3),
                    )
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Use GlobalKey for section headers to enable accurate scrolling
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: Duration(milliseconds: 600),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  return Container(
                    key: sectionKeys[index],
                    margin: EdgeInsets.zero,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOutCirc,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.appBarColor.withOpacity(0.15)
                            : Colors.white,
                        borderRadius: isSelected
                            ? BorderRadius.circular(4)
                            : BorderRadius.zero,
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          // Show animated indicator for selected category
                          AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeOutCubic,
                            width: isSelected ? 24 : 0,
                            child: isSelected
                                ? TweenAnimationBuilder<double>(
                                    tween: Tween<double>(begin: 0.0, end: 1.0),
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.elasticOut,
                                    builder: (context, value, child) {
                                      return Transform.scale(
                                        scale: value,
                                        child: Icon(
                                          Icons.arrow_right,
                                          color: AppColors.appBarColor,
                                        ),
                                      );
                                    },
                                  )
                                : SizedBox.shrink(),
                          ),
                          Expanded(
                            child: Text(
                              category['category'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight:
                                    // isSelected ?
                                    FontWeight.bold,
                                // : FontWeight.normal,
                                color: isSelected
                                    ? AppColors.appBarColor
                                    : Colors.black,
                              ),
                            ),
                          ),
                          // Show badge with item count for this category
                          if (category['data'] != null)
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.appBarColor
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '${category['data'].length}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // Animate the appearance of service items when a category is selected
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOutCubic,
                // height: category['data'].length *
                //     (isSelected ? 160.0 : 160.0), // Height per item
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: category['data'].length,
                  itemBuilder: (context, subIndex) {
                    final service = category['data'][subIndex];

                    // Apply staggered animation to items in the selected category
                    return AnimatedOpacity(
                      opacity: isSelected ? 1.0 : 0.8,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      child: AnimatedPadding(
                        padding: EdgeInsets.only(
                          left: isSelected ? 4.0 : 0.0,
                          right: isSelected ? 4.0 : 0.0,
                        ),
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeOutCubic,
                        child: ServiceCard(
                          context: context,
                          serviceType: serviceType.toString(),

                          // Use dynamic options if available, otherwise use defaults
                          serviceTypeList: service['serviceOptions']?['serviceTypeList'] ?? serviceTypeList,
                          projectSizeList: service['serviceOptions']?['serviceSubTypeList'] ?? serviceSubTypeList,

                          title: service['title'],
                          // Safe price access - get first available price or use fallback
                          price: _getFirstAvailablePrice(service['serviceOptions']?['serviceTypeList']) ?? service['price'].toString(),
                          description: service['description'],
                          imagePath: service['imagePath'],
                          serviceDetail: service['serviceDetail'],
                          cartController: cartController,
                          categoryIndex: index,
                          onTap: () => _showAddModal(
                              context,
                              service['title'],
                              category['category'],
                              service['imagePath'],
                              index,
                              subIndex
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  // String? _getFirstAvailablePrice(List<dynamic>? serviceTypeList) {
  //   if (serviceTypeList == null || serviceTypeList.isEmpty) return null;
  //
  //   for (var item in serviceTypeList) {
  //     if (item is Map<String, dynamic> &&
  //         item.containsKey('price') &&
  //         item['price'] != null &&
  //         item['price'].toString().isNotEmpty) {
  //       return item['price'].toString();
  //     }
  //   }
  //   return null;
  // }
}

/// Enhanced Service Card Widget with universal quantity controls
class ServiceCard extends StatelessWidget {
  final BuildContext context;
  final String serviceType;
  final List<dynamic> serviceTypeList;
  final List<String>? projectSizeList;
  final String title;
  final String price;
  final String? buttonTitle;
  final String description;
  final String imagePath;
  final VoidCallback? onTap;
  final List<Map<String, dynamic>>? serviceDetail;
  final CartController cartController;
  final int categoryIndex;
  final Map<String, dynamic>? serviceOptions;

  const ServiceCard({
    super.key,
    required this.context,
    required this.serviceType,
    required this.serviceTypeList,
    this.projectSizeList,
    required this.title,
    required this.price,
    this.buttonTitle,
    required this.description,
    required this.imagePath,
    this.onTap,
    this.serviceDetail,
    required this.cartController,
    this.categoryIndex = 0,
    this.serviceOptions,
  });

  // Helper method to get price from the first item in service type list
  String? _getFirstItemPrice() {
    if (serviceTypeList.isEmpty) return null;

    for (var item in serviceTypeList) {
      if (item != null && item is Map<String, dynamic> &&
          item.containsKey("price") &&
          item["price"] != null &&
          item["price"].toString().isNotEmpty) {
        return item["price"].toString();
      }
    }
    return null;
  }

  // Helper method to get a type string from an item
  String _getTypeString(dynamic item) {
    if (item == null) return "";

    if (item is String) {
      return item;
    } else if (item is Map<String, dynamic> && item.containsKey("type")) {
      return item["type"]?.toString() ?? "";
    }
    return "";
  }

  // Helper method to check if service has options
  bool _hasServiceOptions() {
    final serviceOptionData = serviceOptions ?? _findServiceOptions();
    return serviceOptionData != null &&
        serviceOptionData.containsKey('serviceTypeList') &&
        serviceOptionData['serviceTypeList'] != null &&
        (serviceOptionData['serviceTypeList'] as List).isNotEmpty;
  }

  // Helper method to add service directly to cart
  void _addDirectlyToCart() {
    try {
      // Get first service type for default selection
      String defaultType = "Basic Service";
      double defaultPrice = 200.0; // Default price from carpenter services

      if (serviceTypeList.isNotEmpty && serviceTypeList.first != null) {
        defaultType = _getTypeString(serviceTypeList.first);
        final firstItemPrice = _getFirstItemPrice();
        if (firstItemPrice != null) {
          defaultPrice = double.tryParse(firstItemPrice.replaceAll(',', '')) ?? 200.0;
        }
      }

      // Create cart item with default values
      CartItem item = CartItem(
        serviceName: title,
        finalSelection: defaultType,
        price: defaultPrice,
        serviceCategory: serviceType,
        serviceSubcategory: title,
        imagePath: imagePath,
        quantity: 1, // Start with quantity 1
      );

      // Add to cart
      cartController.addToCart(item);

    } catch (e) {
      print("Error adding directly to cart: $e");
      Get.snackbar(
        'Error',
        'Failed to add to cart. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.9),
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 2),
        borderRadius: 10,
      );
    }
  }

  // Helper method to handle button tap
  void _handleButtonTap() {
    if (_hasServiceOptions()) {
      // Show bottom sheet for services with options
      final serviceOptionData = serviceOptions ?? _findServiceOptions();

      showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => ServiceBottomSheetComponents(
          serviceType: serviceType,
          serviceCategory: title,
          serviceSubCategory: title,
          imagePath: imagePath,

          // Use options from the service data with proper defaults
          serviceTypeList: serviceOptionData?['serviceTypeList'] ?? serviceTypeList,

          // Pass dynamic titles and visibility flags with proper defaults
          serviceTypeTitle: serviceOptionData?['serviceTypeTitle'] ?? "Select Service Type",
          showServiceType: serviceOptionData?['showServiceType'] ?? true,
          showServiceSubType: serviceOptionData?['showServiceSubType'] ?? false,
          serviceSubTypeTitle: serviceOptionData?['serviceSubTypeTitle'] ?? "Select Project Type",
          serviceSubTypeList: serviceOptionData?['serviceSubTypeList'],

          onActionPressed: (selectedType, selectedProject, added) {
            // This will be called after adding to cart
          },
        ),
      );
    } else {
      // Add directly to cart without showing bottom sheet
      _addDirectlyToCart();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the price to display - use first item's price if available
    final displayPrice = _getFirstItemPrice();

    return Column(
      children: [
        // Apply a subtle hover-like effect using animated container
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, (1.0 - value) * 10),
                child: child,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Material(
              color: Colors.transparent,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: contentTitleSize,
                          ),
                        ),
                        const SizedBox(height: 8),
                        RatingIndicator(
                          serviceType: serviceType,
                          starSize: 15,
                          textStyle: TextStyle(
                            fontSize: contentSize,
                            color: Colors.grey[600],
                          ),
                          onTap: () {
                            showModalBottomSheet(
                              useSafeArea: true,
                              isScrollControlled: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => ReviewScreen(
                                serviceType: serviceType,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        // Price with subtle highlight - uses the first item's price if available
                        Builder(
                          builder: (context) {
                            final displayPrice = _getFirstItemPrice();
                            if (displayPrice == null) {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: AppColors.appBarColor.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  price, // Default price for carpenter services
                                  style: TextStyle(
                                    fontSize: contentSize,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.appBarColor,
                                  ),
                                ),
                              );
                            }

                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppColors.appBarColor.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                "₹ $displayPrice",
                                style: TextStyle(
                                  fontSize: contentSize,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.appBarColor,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 8),
                        // Enhanced View Details button
                        InkWell(
                          onTap: () {
                            // Use the first item's price for the details view
                            double startingPrice = 200.0; // Default price
                            final displayPrice = _getFirstItemPrice();
                            if (displayPrice != null) {
                              try {
                                startingPrice = double.parse(displayPrice.replaceAll(',', ''));
                              } catch (e) {
                                print("Error parsing price: $e");
                                startingPrice = 200.0;
                              }
                            }

                            showModalBottomSheet(
                              useSafeArea: true,
                              isScrollControlled: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => ItemsDetails(
                                serviceDetail: serviceDetail,
                                title: title,
                                description: description,
                                ctaText: "Proceed",
                                startingPrice: startingPrice,
                                onProceed: _handleButtonTap, // Use the new handler
                                cartController: cartController,
                                serviceType: serviceType,
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'View Details',
                                style: TextStyle(
                                  fontSize: contentSize,
                                  color: AppColors.appBarColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: AppColors.appBarColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                    children: [
                      // Enhanced image container with subtle shadow animation
                      Container(
                        height: 80,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.appBarColor.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[200],
                                child: const Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),
                        clipBehavior: Clip.antiAlias,
                      ),
                      const SizedBox(height: 8),

                      // Action button - shows quantity controls for ALL services in cart
                      Obx(() {
                        // Get first service type for cart checking
                        String firstType = "Basic Service"; // Default type
                        if (serviceTypeList.isNotEmpty && serviceTypeList.first != null) {
                          firstType = _getTypeString(serviceTypeList.first);
                        }

                        bool isInCart = firstType.isNotEmpty && cartController.isInCart(
                          serviceType,
                          title,
                          firstType,
                        );

                        if (isInCart) {
                          // Show quantity controls for ALL services in cart
                          return _buildQuantityControls(firstType);
                        } else {
                          // If not in cart, show standard "Book Now" button
                          return TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 0.0, end: 1.0),
                            duration: Duration(milliseconds: 300),
                            curve: Curves.elasticOut,
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: 0.95 + (value * 0.05),
                                child: ElevatedButton(
                                  onPressed: _handleButtonTap,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.appBarColor,
                                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                    minimumSize: const Size(70, 32),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    elevation: 2,
                                  ),
                                  child: Text(
                                    buttonTitle ?? "Book Now",
                                    style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: serviceButtonText,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        // Add a subtle animation to the divider
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 400),
          curve: Curves.easeIn,
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Divider(
                color: AppColors.grey,
                indent: 16 * (1 - value),
                endIndent: 16 * (1 - value),
              ),
            );
          },
        ),
      ],
    );
  }

  // Helper method to build quantity controls with proper limits (1-5)
  Widget _buildQuantityControls(String serviceType) {
    return Obx(() {
      // Get the cart item for this service
      CartItem? cartItem = cartController.getCartItem(this.serviceType, title, serviceType);

      if (cartItem == null) {
        // This shouldn't happen, but fallback to regular button
        return ElevatedButton(
          onPressed: _handleButtonTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.appBarColor,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            minimumSize: const Size(70, 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            elevation: 2,
          ),
          child: Text(
            "Book Now",
            style: TextStyle(
                color: AppColors.white,
                fontSize: serviceButtonText,
                fontWeight: FontWeight.bold),
          ),
        );
      }

      // Generate service key for quantity operations
      String serviceKey = '${cartItem.serviceCategory}_${cartItem.serviceSubcategory}_${cartItem.finalSelection}';

      // Show quantity controls with limits
      return TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: 300),
        curve: Curves.elasticOut,
        builder: (context, value, child) {
          return Transform.scale(
            scale: 0.95 + (value * 0.05),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.green, width: 1.5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Decrease button (disabled if quantity is 1)
                  InkWell(
                    onTap: cartItem.quantity > 1 ? () {
                      cartController.decreaseQuantity(serviceKey);
                    } : null,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      child: Icon(
                        Icons.remove,
                        size: 16,
                        color: cartItem.quantity > 1 ? Colors.green : Colors.grey,
                      ),
                    ),
                  ),
                  // Quantity display
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      "${cartItem.quantity}",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: serviceButtonText,
                      ),
                    ),
                  ),
                  // Increase button (disabled if quantity is 5)
                  InkWell(
                    onTap: cartItem.quantity < 5 ? () {
                      cartController.increaseQuantity(serviceKey);
                    } : null,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      child: Icon(
                        Icons.add,
                        size: 16,
                        color: cartItem.quantity < 5 ? Colors.green : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }

  // Helper method to find service options from global services data
  Map<String, dynamic>? _findServiceOptions() {
    try {
      if (categoryIndex >= 0 && categoryIndex < services.length) {
        final category = services[categoryIndex];
        if (category != null && category.containsKey('data')) {
          final List<dynamic> data = category['data'];
          if (data.isNotEmpty) {
            for (var service in data) {
              if (service is Map<String, dynamic> &&
                  service.containsKey('title') &&
                  service['title'] == title) {
                // Check if serviceOptions exists and is a Map
                if (service.containsKey('serviceOptions') &&
                    service['serviceOptions'] is Map<String, dynamic>) {
                  print("Found service options for $title: ${service['serviceOptions']}");
                  return service['serviceOptions'] as Map<String, dynamic>;
                }
              }
            }
          }
        }
      }
      print("No service options found for $title at category index $categoryIndex");
      return null;
    } catch (e) {
      print("Error finding service options: $e");
      return null;
    }
  }
}

/// Updated ItemsDetails Modal with Cart Integration and Quantity Controls
class ItemsDetails extends StatelessWidget {
  final List<Map<String, dynamic>>? serviceDetail;
  final String title;
  final String description;
  final String ctaText;
  final double startingPrice;
  final VoidCallback? onProceed;
  final String serviceType;
  final CartController cartController;

  const ItemsDetails({
    super.key,
    this.serviceDetail,
    required this.title,
    required this.description,
    required this.ctaText,
    required this.startingPrice,
    this.onProceed,
    this.serviceType = 'cleaning',
    required this.cartController,
  });

  // Helper method to add service directly to cart
  void _addDirectlyToCart(BuildContext context) {
    try {
      // Create cart item with default values
      CartItem item = CartItem(
        serviceName: title,
        finalSelection: "Basic Service", // Default service type
        price: startingPrice > 0 ? startingPrice : 200.0,
        serviceCategory: serviceType,
        serviceSubcategory: title,
        imagePath: '',
      );

      // Add to cart
      cartController.addToCart(item);

    } catch (e) {
      print("Error adding directly to cart: $e");
      Get.snackbar(
        'Error',
        'Failed to add to cart. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.9),
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 2),
        borderRadius: 10,
      );
    }
  }

  // Helper method to build quantity controls for ItemsDetails
  Widget _buildQuantityControls(BuildContext context) {
    return Obx(() {
      // Find the cart item for this service and count quantity
      int quantity = 0;
      int firstItemIndex = -1;

      for (int i = 0; i < cartController.cartItems.length; i++) {
        final item = cartController.cartItems[i];
        if (item.serviceCategory == serviceType &&
            item.serviceSubcategory == title) {
          quantity++;
          if (firstItemIndex == -1) {
            firstItemIndex = i;
          }
        }
      }

      if (quantity == 0) {
        // Fallback - shouldn't happen
        return ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            if (onProceed != null) onProceed!();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.appBarColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          child: Text(
            ctaText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        );
      }

      // Show quantity controls
      return Container(
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Decrease button
            InkWell(
              onTap: () {
                if (firstItemIndex != -1) {
                  cartController.removeFromCart(firstItemIndex);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  Icons.remove,
                  size: 20,
                  color: Colors.green,
                ),
              ),
            ),
            // Quantity display
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "$quantity",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "in cart",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            // Increase button
            InkWell(
              onTap: () {
                _addDirectlyToCart(context);
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with drag indicator
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                  color: Colors.grey[600],
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                // Description card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Service Description",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Service Details Sections
                if (serviceDetail != null && serviceDetail!.isNotEmpty)
                  ...serviceDetail!.map((section) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (section['header'] != ' ')
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              section['header'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.appBarColor,
                              ),
                            ),
                          ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey[200]!),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.05),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...List.generate(
                                section['data'].length,
                                    (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.check_circle,
                                        size: 18,
                                        color: AppColors.appBarColor,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          section['data'][index],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            height: 1.4,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),

                // Review section preview
                const Text(
                  "Customer Reviews",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.appBarColor,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[200]!),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.05),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RatingIndicator(
                            serviceType: serviceType,
                            starSize: 16,
                            onTap: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                useSafeArea: true,
                                isScrollControlled: true,
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) =>
                                    ReviewScreen(serviceType: serviceType),
                              );
                            },
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                useSafeArea: true,
                                isScrollControlled: true,
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) =>
                                    ReviewScreen(serviceType: serviceType),
                              );
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              "View All",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.appBarColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // Sample review or dynamic review
                      FutureBuilder<void>(
                        future: Get.find<RatingController>()
                            .loadRatings(serviceType),
                        builder: (context, snapshot) {
                          // Handle loading state
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }

                          // Get reviews for this service type
                          final reviews = Get.find<RatingController>()
                              .getRatingListForService(serviceType);

                          if (reviews.isEmpty) {
                            return Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                "No reviews yet. Be the first to leave a review!",
                                style: TextStyle(color: Colors.grey),
                              ),
                            );
                          }

                          // Show the first review
                          final firstReview = reviews.first;

                          return Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 14,
                                      backgroundColor: AppColors.appBarColor,
                                      child: Text(
                                        firstReview.name[0].toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        firstReview.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: AppColors.appBarColor,
                                            size: 14),
                                        const SizedBox(width: 2),
                                        Text(
                                          firstReview.rating.toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  firstReview.comments,
                                  style: const TextStyle(fontSize: 13),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Info box
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.appBarColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.appBarColor.withOpacity(0.2),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: AppColors.appBarColor,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Premium Service Guarantee",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: AppColors.appBarColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "All services come with a satisfaction guarantee. Our professional staff ensures quality work.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom navigation bar with pricing and CTA
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "₹${startingPrice.toStringAsFixed(0)}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.appBarColor,
                      ),
                    ),
                    const Text(
                      "Price includes all taxes",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  bool isInCart = cartController.isInCart(
                    serviceType,
                    title,
                    'basic cleaning', // Default to basic cleaning
                  );

                  return isInCart
                      ? ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Get.to(() => CartScreen(cartController: cartController));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.shopping_cart, size: 18),
                        SizedBox(width: 8),
                        Text(
                          "View Cart",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                      : ElevatedButton(
                    onPressed: onProceed, // Use the provided onProceed callback
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appBarColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      ctaText,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
