import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:ghar_ka_sathi/controller/property_service_controller.dart';
import 'package:ghar_ka_sathi/view/in_home_services/base_service_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/constant.dart';
import 'package:itq_utils/itq_utils.dart';
import 'cleaning_details_screen.dart';

/// Data for carpentry services
final List<Map<String, dynamic>> services = [
  {
    'category': "Switch & Socket",
    'id': 1,
    'imagePath': "assets/images/Red-Color-Electrical-Switch.jpeg",
    'data': [
      {
        'title': "Switch box Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 142,
        'description':
        "Professional installation of a single switchbox. Thorough cleaning after the service.",
        'imagePath': "assets/images/Switchbox-Installation.jpeg",
        'serviceDetail':[
          {
            'header': 'Service Includes:',
            'data':[
              'Professional installation of a single switchbox.',
              'Thorough cleaning after the service.',
            ]
          },
          {
            'header': 'Important Information:',
            'data':[
              'Ladder must be provided by the customer if needed.',
              'Additional charges for wiring over 2 meters.',
              'Warranty does not cover customer-provided spare parts.'
            ]
          }
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number Of Switches:", // Custom title
          'serviceTypeList': [
            {
              "type": "1 Switch",
              "price": "142",
            },
            {
              "type": "2 Switch",
              "price": "164"
            },
            {
              "type": "3 Switch & More",
              "price": "197"
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "Switchboard Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 142,
        'description':
        "Setup of a single switchboard. Cleaning of the work area after service completion.",
        'imagePath': "assets/images/switchboard.jpeg",
        'serviceDetail':[
          {
            'header': 'Service Includes:',
            'data':[
              'Setup of a single switchboard.',
              'Cleaning of the work area after service completion.',
            ]
          },
          {
            'header': 'Important Information:',
            'data':[
              'Ladder must be provided if required.',
              'Additional charges for wiring over 2 meters.',
              'Warranty excludes customer-provided spare parts.',
            ]
          }
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Switchboard:", // Custom title
          'serviceTypeList': [
            {
              "type": "1 Board",
              "price": "142",
            },
            {
              "type": "2 Board",
              "price": "164",
            },
            {
              "type": "3 Board & More",
              "price": "197",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "SwitchBoard/SwitchBox Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 99,
        'description':
        "Repair of one switchboard or switchbox. Cleaning of the workspace after the repair.",
        'imagePath': "assets/images/Switch-Board-Box.jpeg",
        'serviceDetail':[
          {
            'header': 'Service Includes:',
            'data':[
              'Repair of one switchboard or switchbox.',
              'Cleaning of the workspace after the repair.',
            ]
          }
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Switchboard:", // Custom title
          'serviceTypeList': [
            {
              "type": "1 Switch",
              "price": "99",
            },
            {
              "type": "2 Switch",
              "price": "142",
            },
            {
              "type": "3 Switch and more",
              "price": "164",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "AC Switch Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 279,
        'description':
        "Expert installation of one AC-specific switchbox. Post-installation cleaning.",
        'imagePath': "assets/images/AC-Switch.jpeg",
        'serviceDetail':[
          {
            'header': 'Service Includes:',
            'data':[
              'Expert installation of one AC-specific switchbox.',
              'Post-installation cleaning.',
            ]
          },
          {
            'header': 'Important Information:',
            'data':[
              'Ladder must be provided by the customer if needed.',
              'Additional charges for wiring over 2 meters.',
              'Warranty does not cover customer-provided spare parts.',
            ]
          }
        ],
      },
      {
        'title': "Smart Switch Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 149,
        'description':
        "Installation of a modular retrofit smart switch. Cleaning after installation.",
        'imagePath': "assets/images/Smart-Switch.jpeg",
        'serviceDetail':[
          {
            'header': 'Service Includes:',
            'data':[
              'Installation of a modular retrofit smart switch.',
              'Cleaning after installation.',
            ]
          }
        ],
      },
      {
        'title': "Smart Appliances Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 199,
        'description':
        "Installation of a smart plug or touch panel. Post-service area cleanup.",
        'imagePath': "assets/images/Smart-Appliances.jpeg",
        'serviceDetail':[
          {
            'header': 'Service Includes:',
            'data':[
              'Installation of a smart plug or touch panel.',
              'Post-service area cleanup.',
            ]
          }
        ],
      },
      {
        'title': "Switch-Socket Replacement",
        'rating': 4.8,
        'reviews': 5,
        'price': 59,
        'description':
        "Replacement of a single switch/socket on an existing board. Post-service cleaning.",
        'imagePath': "assets/images/Switch-Socket.jpeg",
        'serviceDetail':[
          {
            'header': 'Service Includes:',
            'data':[
              'Replacement of a single switch/socket on an existing board.',
              'Post-service cleaning.',
            ]
          }
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number of Switchboard:", // Custom title
          'serviceTypeList': [
            {
              "type": "Power Switch",
              "price": "87",
            },
            {
              "type": "Regular Switch",
              "price": "65",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "Wifi Smart Switch Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 199,
        'description':
        "Installation of a Wi-Fi-enabled smart switch converter. Post-service cleaning.",
        'imagePath': "assets/images/Wifi-Smart-Switch.jpeg",
        'serviceDetail':[
          {
            'header': 'Service Includes:',
            'data':[
              'Installation of a Wi-Fi-enabled smart switch converter.',
              'Post-service cleaning.',
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Wall/Ceiling Light",
    'id': 2,
    'imagePath': "assets/images/Red-Color-Ceiling.jpeg",
    'data': [
      {
        'title': "Bulb/Tube Light Holder Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 79,
        'description':
        "Installation of 1 bulb/tubelight holder and cleaning after service.",
        'imagePath': "assets/images/Bulb-Holder.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Installation of 1 bulb/tubelight holder',
              'Cleaning after service',
            ]
          }
        ],
      },
      {
        'title': "CFL to LED Replacement",
        'rating': 4.8,
        'reviews': 5,
        'price': 149,
        'description':
        "Replacing one CFL bulb, tubelight, or LED bulb with an LED bulb tubelight.",
        'imagePath': "assets/images/CFl-LED.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Replacing one CFL bulb, tubelight, or LED bulb with an LED bulb tubelight',
              'Cleaning after service',
            ]
          }
        ],
      },
      {
        'title': "Decorative Lights Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 159,
        'description':
        "Professional installation of decorative lights with cleanup after service.",
        'imagePath': "assets/images/Decorative-Light.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Installation of decorative lights',
              'Cleaning after service',
            ]
          }
        ],
      },
      {
        'title': "Decorative Lights Uninstallation",
        'rating': 4.8,
        'reviews': 5,
        'price': 119,
        'description':
        "Professional removal of decorative lights from your home.",
        'imagePath': "assets/images/decorativeLight.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Uninstallation of decorative lights',
            ]
          }
        ],
      },
      {
        'title': "Decorative Lantern Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 119,
        'description':
        "Installation of one decorative lantern with cleanup after service.",
        'imagePath': "assets/images/decorative-latern.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Installation of one lantern',
              'Cleaning after service',
            ]
          }
        ],
      },
      {
        'title': "Wall/Ceiling Light Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 111,
        'description':
        "Professional installation of wall or ceiling lights with cleanup.",
        'imagePath': "assets/images/Ceiling-Light.jpeg",
        'serviceDetail':[
          {
            'header': '',
            'data':[
              'Installation of one lighting fixture',
              'Tubelight - 69',
              'Lantern - 99',
              'Ceiling - 129',
            ]
          }
        ],
      },
      {
        'title': "Chandelier Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 599,
        'description':
        "Professional installation of a chandelier with cleanup.",
        'imagePath': "assets/images/Chandelier-Installation.jpeg",
        'serviceDetail':[
          {
            'header': 'Up to 6 bulbs - 1099',
            'data':[
              ' ',
            ]
          },
          {
            'header': 'For more than 6 bulbs',
            'data':[
              ' ',
            ]
          },
          {
            'header': 'Includes',
            'data':[
              'Installation of one chandelier',
            ]
          }
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Number Of Bulbs:", // Custom title
          'serviceTypeList': [
            {
              "type": "6 Bulbs",
              "price": "599",
            },
            {
              "type": "12 Bulbs",
              "price": "1199",
            },
            {
              "type": "12+ Bulbs",
              "price": "1499",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "Wiring",
    'id': 3,
    'imagePath': "assets/images/Red-Color-Electrical-Wire.jpeg",
    'data': [
      {
        'title': "New External Wiring (Per 5 meters)",
        'rating': 4.8,
        'reviews': 5,
        'price': 109,
        'description':
        "Professional installation of external wiring with outer casing and capping.",
        'imagePath': "assets/images/wiring-installation.jpeg",
        'serviceDetail':[
          {
            'header': '',
            'data':[
              'With Casing - 209',
              'Without Casing - 89',
            ]
          },
          {
            'header': 'Includes',
            'data':[
              'Wiring with outer casing and capping for a single connection',
              'Cleaning after service',
            ]
          }
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Type:", // Custom title
          'serviceTypeList': [
            {
              "type": "With Casing",
              "price": "249",
            },
            {
              "type": "Without Casing",
              "price": "109",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "New Internal Wiring (Per 5 meters)",
        'rating': 4.8,
        'reviews': 5,
        'price': 189,
        'description':
        "Concealed conduit wiring for a new internal connection with cleanup.",
        'imagePath': "assets/images/wiriing-installation.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Concealed conduit wiring for a new internal connection',
              'Cleaning after service',
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Doorbell",
    'id': 4,
    'imagePath': "assets/images/Red-Color-Doorbell.jpeg",
    'data': [
      {
        'title': "Doorbell Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 142,
        'description':
        "Professional installation of a single doorbell with post-service cleaning.",
        'imagePath': "assets/images/Video-Doorbell.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Professional installation of a single doorbell',
              'Post-service cleaning',
            ]
          }
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Doorbell Type", // Custom title
          'serviceTypeList': [
            {
              "type": "Regular Doorbell",
              "price": "142",
            },
            {
              "type": "Video doorbell",
              "price": "659",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "Doorbell Replacement",
        'rating': 4.8,
        'reviews': 5,
        'price': 164,
        'description':
        "Replacement of an existing doorbell with post-service cleaning.",
        'imagePath': "assets/images/Audio-Doorbell.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Replacement of an existing doorbell',
              'Post-service cleaning',
            ]
          }
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Doorbell Type", // Custom title
          'serviceTypeList': [
            {
              "type": "Regular Doorbell",
              "price": "164",
            },
            {
              "type": "Video doorbell",
              "price": "769",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "MCB & SubMeter",
    'id': 5,
    'imagePath': "assets/images/Red-Color-Mcb.jpeg",
    'data': [
      {
        'title': "Single Pole MCB Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 129,
        'description':
        "Professional installation of a single-pole MCB.",
        'imagePath': "assets/images/Single-Pole.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Installation of a single-pole MCB',
            ]
          }
        ],
      },
      {
        'title': "Double Pole MCB Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 179,
        'description':
        "Professional installation of a double-pole MCB.",
        'imagePath': "assets/images/Double-Pole.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Installation of a double-pole MCB',
            ]
          }
        ],
      },
      {
        'title': "Submeter Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 249,
        'description':
        "Expert installation of an electrical submeter.",
        'imagePath': "assets/images/Sub-Meter.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Installation of a submeter',
            ]
          }
        ],
      },
      {
        'title': "MCB/Fuse Replacement",
        'rating': 4.8,
        'reviews': 5,
        'price': 109,
        'description':
        "Professional replacement of an MCB or fuse.",
        'imagePath': "assets/images/Fuse-Box.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Replacement of a single MCB or fuse',
            ]
          }
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select type", // Custom title
          'serviceTypeList': [
            {
              "type": "1 Switch",
              "price": "109",
            },
            {
              "type": "2 Switch",
              "price": "142",
            },
            {
              "type": "3 Switch & More",
              "price": "164",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "3-Phase Changeover Switch Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 279,
        'description':
        "Professional installation of a 3-phase changeover switch.",
        'imagePath': "assets/images/Face-Changeover.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Installation of a 3-phase changeover switch',
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Inverter and Stablizer",
    'id': 6,
    'imagePath': "assets/images/Red-Color-Inverter.jpeg",
    'data': [
      {
        'title': "Inverter Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 399,
        'description':
        "Professional installation of one inverter.",
        'imagePath': "assets/images/Inverter-Installation.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Includes professional installation of one inverter.',
            ]
          }
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Battery Type::", // Custom title
          'serviceTypeList': [
            {
              "type": "Single Battery",
              "price": "399",
            },
            {
              "type": "Double Battery",
              "price": "499",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "Stablizer Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 149,
        'description':
        "Professional installation of a single stabilizer.",
        'imagePath': "assets/images/Stablizer.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Includes installation of a single stabilizer.',
            ]
          }
        ],
      },
      {
        'title': "Inverter Fuse Replacement",
        'rating': 4.8,
        'reviews': 5,
        'price': 129,
        'description':
        "Professional replacement of one inverter fuse.",
        'imagePath': "assets/images/Inverter-Fuse.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Includes replacement of one inverter fuse.',
            ]
          }
        ],
      },
      {
        'title': "Inverter Servicing",
        'rating': 4.8,
        'reviews': 5,
        'price': 179,
        'description':
        "Professional servicing of your inverter including cleaning of terminals and topping up with distilled water.",
        'imagePath': "assets/images/Inverter-Servicing.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Includes cleaning of terminals and topping up with distilled water.',
            ]
          }
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Battery Type:", // Custom title
          'serviceTypeList': [
            {
              "type": "Single Battery",
              "price": "179",
            },
            {
              "type": "Double Battery",
              "price": "349",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
      {
        'title': "Inverter Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 249,
        'description':
        "Professional diagnosis and repair of inverter issues.",
        'imagePath': "assets/images/Inverter-Repair.jpeg",
        'serviceDetail':[
          {
            'header': 'Includes',
            'data':[
              'Includes diagnosis and repair of inverter issues.',
            ]
          }
        ],
        'serviceOptions': {
          'showServiceType': true,
          'serviceTypeTitle': "Select Issue:", // Custom title
          'serviceTypeList': [
            {
              "type": "Power Backup Issue",
              "price": "249",
            },
            {
              "type": "Noise Issue",
              "price": "249",
            },
            {
              "type": "Unspecified Issue",
              "price": "249",
            },
            {
              "type": "Overload Issue",
              "price": "249",
            },
            {
              "type": "Overload Error",
              "price": "249",
            },
          ],
          'showServiceSubType': false, // Don't show second section
          // 'serviceSubTypeTitle' and 'serviceSubTypeList' are intentionally omitted as not needed
        },
      },
    ]
  },
  {
    'category': "Electric Services Visit ",
    'id': 6,
    'imagePath': "assets/images/solar-panels.jpeg",
    'data': [
      {
        'title': "Book an Electrician Visit",
        'rating': 4.5,
        'reviews': 1566,
        'price': 200,
        'description':
        "Our expert electrician will arrive at your home to assess your needs. A detailed quote will be provided before any work begins, ensuring transparency and clarity.",
        'imagePath': "assets/gks/home_cleaning/kitchen-cleaning.jpeg",
        'serviceDetail':[
          {
            'header': ' ',
            'data':[
              ' '
            ]
          }
        ],
      },
    ]
  },
];

class ElectricianDetailsScreen extends StatefulWidget {
  static String tag = '/Electrician';
  final String? serviceType;
  const ElectricianDetailsScreen({super.key,this.serviceType});

  @override
  State<ElectricianDetailsScreen> createState() => _ElectricianDetailsScreenState();
}

class _ElectricianDetailsScreenState extends State<ElectricianDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return BaseServiceScreen(
      title: "Electrician Services",
      serviceType: widget.serviceType,
      services: services, // Use the predefined services list
      serviceTypeList:  ['basic Cleaning', 'deep Cleaning'],
    );
  }
}
