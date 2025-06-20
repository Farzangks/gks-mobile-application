import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:ghar_ka_sathi/view/in_home_services/base_service_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

import 'cleaning_details_screen.dart';


/// Data for carpentry services
final List<Map<String, dynamic>> services = [
  {
    'category': "Bath Fitting",
    'id': 1,
    'imagePath': "assets/images/Bath-Fittings-Main.jpeg",
    'data': [
      {
        'title': "Bath accessory installation- 69rs",
        'rating': 4.5,
        'reviews': 1566,
        'price': 87,
        'description':
        "Installation of small fittings such as towel hangers, holders, shelves, and soap dispensers.",
        'imagePath': "assets/images/Bath-Accesories-1.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              'Installation of small fittings such as towel hangers, holders, shelves, and soap dispensers.',
              'Thorough cleaning after the service is completed.',
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              'Extensive masonry work, such as tiling, cementing, or granite installation, is not part of the service.',
              'Customers are required to provide a ladder if needed.',
              'Warranty does not apply to spare parts supplied by the customer.',
            ]
          }
        ],
      },
      {
        'title': "Shower Installation -89",
        'rating': 4.5,
        'reviews': 1618,
        'price': 99,
        'description':
        "Assistance with procuring taps or spare parts (additional charges apply).",
        'imagePath': "assets/images/Shower-Installation-2.jpeg",

        'serviceDetail':[
          {
            'header': 'Two Types',
            'data':[
              'Ceiling mounted -119rs',
              'Wall mounted - 89rs',
            ]
          },
          {
            'header': 'What"s Included',
            'data':[
              'Assistance with procuring taps or spare parts (additional charges apply).',
              'Comprehensive cleaning after the service is completed.'
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              'Repair or installation of mixer taps is not included in the service..',
              'Customers are responsible for providing a ladder if required.'
                  'Warranty does not cover spare parts provided by the customer.'
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Basin And Sink",
    'id': 2,
    'imagePath': "assets/images/RED-Basin.jpeg",
    'data': [
      {
        'title': "Wash basin installation",
        'rating': 4.5,
        'reviews': 1566,
        'price': 384,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Wash-Basin-3.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              'Professional installation of a wash basin, whether table-top or wall-mounted.',
              'Installation of a single knob or inlet tap.',
              'Setup of inlet and outlet piping.',
              'Complete cleaning after the service is provided.',
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              'Extensive masonry work such as tiling, cementing, or granite installation is not covered under our services.',
              'Warranty coverage does not extend to spare parts provided by the customer.'
            ]
          }
        ],
      },
      {
        'title': "Waste pipe replacement",
        'rating': 4.5,
        'reviews': 1566,
        'price': 98,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Waste-Pipe-Replacemnet-4.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              'Single knob inlet tap repair kitchen sink waash basin bathroom',
              'Stuck or leaking tap',
              'Postservice cleaning',
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              'Repair or installation of mixer taps is not part of the services offered.',
              'Services do not include extensive masonry work, such as tiling, cementing, or granite installation.',
              'The warranty does not cover any spare parts supplied by the customer.',
            ]
          }
        ],
      },
      {
        'title': "Sink drainage removal",
        'rating': 4.5,
        'reviews': 1566,
        'price': 131,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Sink-Drainage-5.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              'Cleaning and removal of waste from the wash basin strainer and waste pipe are not included.',
              'Post-service cleaning is not part of the service provided.',
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              'Extensive masonry work such as tiling, cementing, or granite installation is not covered under our services.',
              'Warranty coverage does not extend to spare parts provided by the customer.',
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Grouting",
    'id': 3,
    'imagePath': "assets/images/Red-Tiles-Grouting.jpeg",
    'data': [
      {
        'title': "Bathroom Tile Grouting Service",
        'rating': 4.5,
        'reviews': 1618,
        'price': 1429,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Bathroom-Grouting-6.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              'Labor for filling the gaps in one bathroom.',
              'Thorough cleaning after service completion.',
            ]
          },
          {
            'header': 'Important Notes:',
            'data':[
              'Our service does not cover extensive masonry work, such as tiling, cementing, or granite installation.',
              'Our service does not cover extensive masonry work, such as tiling, cementing, or granite installation.Tile cutting will be done as needed, with an additional charge.',
              'A ladder will be provided if required.',
              'Warranty coverage excludes spare parts provided by the customer.',
            ]
          }
        ],
      },
      {
        'title': "Kitchen Tile Grouting Service",
        'rating': 4.5,
        'reviews': 1618,
        'price': 967,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Kitchen-Grouting.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              'Labor for filling the gaps in one kitchen. ',
              'Post-service cleaning.',
            ]
          },
          {
            'header': 'Important Notes:',
            'data':[
              'Our service does not cover extensive masonry work, such as tiling, cementing, or granite installation. ',
              'Tile cutting will be done as needed, with an additional charge.',
              'A ladder will be provided if required.',
              'Warranty coverage excludes spare parts supplied by the customer.',
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "water Filter",
    'id': 4,
    'imagePath': "assets/images/Red-Water-Filter.jpeg",
    'data': [
      {
        'title': "Shower filter installation",
        'rating': 4.5,
        'reviews': 1566,
        'price': 329,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Shower-Filter-9.png",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              'Installation of one shower filter',
              'Post service cleaning',
            ]
          },
          {
            'header': 'Important Notes:',
            'data':[
              'Repair/installation of mixer taps is not included',
              'Provide a ladder if required',
              'warranty does not cover spare parts shourced by customer',
            ]
          }
        ],
      },
      {
        'title': "washing machine filter installation",
        'rating': 4.5,
        'reviews': 1566,
        'price': 142,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Water-Filter-Machine.png",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              'Installation of filter attachment on washing machine for hard water sofetining',
              'Post service cleaning',
            ]
          },
          {
            'header': 'Important Notes:',
            'data':[
              'warranty does not cover spare parts shourced by customer'
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Drainage",
    'id': 5,
    'imagePath': "assets/images/Drainage-Water-Pipes.jpeg",
    'data': [
      {
        'title': "Drainage Cover Installation",
        'rating': 4.5,
        'reviews': 1618,
        'price': 109,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Drainage-Cover-12.png",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              'Installation or replacement of a drainage cover.',
              'Cleaning after the service is completed.',
            ]
          },
          {
            'header': 'Important Notes:',
            'data':[
              'A ladder must be provided if required.',
              'Warranty does not apply to spare parts provided by the customer.',
            ]
          }
        ],
      },
      {
        'title': "Bathroom Drainage Removal",
        'rating': 4.5,
        'reviews': 1618,
        'price': 329,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Bathroom-Drainage-Removal.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              'Clearing blockages and removing waste from underground or in-wall drainage systems.',
              'Thorough cleaning upon completion of the service.',
            ]
          },
          {
            'header': 'Important Notes:',
            'data':[
              'A ladder must be provided if required.',
              'Warranty does not apply to spare parts provided by the customer.',
            ]
          }
        ],
      },
      {
        'title': "Balcony drainage removal",
        'rating': 4.5,
        'reviews': 1618,
        'price': 208,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Balcony-Drainage-Removal.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              'Clearing blockages and removing waste from underground or in-wall drainage systems.',
              'Thorough cleaning upon completion of the service.',
            ]
          },
          {
            'header': 'Important Notes:',
            'data':[
              'A ladder must be provided if required.',
              'Warranty does not apply to spare parts provided by the customer.',
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Toilet",
    'id': 6,
    'imagePath': "assets/images/Red-Toilet-Comode.jpeg",
    'data': [
      {
        'title': "Replacement of Toilet Seat Covers",
        'rating': 4.5,
        'reviews': 1566,
        'price': 87,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Toilet-Drainage-Removal.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Repair of External PVC Flush Tanks",
        'rating': 4.5,
        'reviews': 1566,
        'price': 109,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/PVC-Flush-Tank.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Repair of Concealed Flush Tanks",
        'rating': 4.5,
        'reviews': 1566,
        'price': 219,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Concelead-Flush.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Repair of External Ceramic Flush Tanks",
        'rating': 4.5,
        'reviews': 1566,
        'price': 219,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Creamic-Flush-Tank.png",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Floor-Mounted Western Toilet Repairs",
        'rating': 4.5,
        'reviews': 1566,
        'price': 1649,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Western-Toilet-Commode.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Removal of Toilet Pot Blockages",
        'rating': 4.5,
        'reviews': 1566,
        'price': 1209,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Toilet-plot-removal.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Jet Spray Installation and Repairs",
        'rating': 4.5,
        'reviews': 1566,
        'price': 87,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Jet-Spray-Installation.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Replacement of Western Toilets:",
        'rating': 4.5,
        'reviews': 1566,
        'price': 1649,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Western-Toilet-Replacement.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Installation of Indian Toilets",
        'rating': 4.5,
        'reviews': 1566,
        'price': 1649,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Indian-Toilet.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Flush Tank Replacement",
        'rating': 4.5,
        'reviews': 1566,
        'price': 449,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Flush-Tank-Replacement.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Installation of Western Toilets:",
        'rating': 4.5,
        'reviews': 1566,
        'price': 1484,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Western-Toilet-Installation.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Tap and Mixer",
    'id': 6,
    'imagePath': "assets/images/Tap-Mixers.jpeg",
    'data': [
      {
        'title': "Tap Repair",
        'rating': 4.5,
        'reviews': 1566,
        'price': 54,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Tap-Repair.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Water Mixer Tap Repair",
        'rating': 4.5,
        'reviews': 1566,
        'price': 197,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Water-Tap-Mixer.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Tap Installation",
        'rating': 4.5,
        'reviews': 1566,
        'price': 54,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Installation-Tap.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Water Mixer Installation",
        'rating': 4.5,
        'reviews': 1566,
        'price': 384,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Water-Tap-Installation.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Motor",
    'id': 6,
    'imagePath': "assets/images/Red-Water-Motor.jpeg",
    'data': [
      {
        'title': "Water Nozzle Installation",
        'rating': 4.5,
        'reviews': 1566,
        'price': 76,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Water-Nossel.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Tap Replacement",
        'rating': 4.5,
        'reviews': 1566,
        'price': 200,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Water-Nossel.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "WATER TANK",
    'id': 6,
    'imagePath': "assets/images/Red-Water-Tank.jpeg",
    'data': [
      {
        'title': "Water Tank Repair",
        'rating': 4.5,
        'reviews': 1566,
        'price': 179,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Water-Tank-Repair.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Water Tank Pipeline Repair",
        'rating': 4.5,
        'reviews': 1566,
        'price': 340,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Water-Tank-PipeLine.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Water Overflow Issue Repair",
        'rating': 4.5,
        'reviews': 1566,
        'price': 186,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Water-Tank-Overflow.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Overhead Water Tank Installation",
        'rating': 4.5,
        'reviews': 1566,
        'price': 549,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/OverHead-WaterTank.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Pipeline Services",
        'rating': 4.5,
        'reviews': 1566,
        'price': 200,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/PipeLine-Service.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Pipeline Leakage Repair",
        'rating': 4.5,
        'reviews': 1566,
        'price': 200,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Pipeline-Leakage-Repair.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Water Meter Installation",
        'rating': 4.5,
        'reviews': 1566,
        'price': 200,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Water-Meter.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Motor",
    'id': 6,
    'imagePath': "assets/images/Red-Water-Motor.jpeg",
    'data': [
      {
        'title': "Airlock Removal in Motors",
        'rating': 4.5,
        'reviews': 1566,
        'price': 109,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Water-Pump-AirLock.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Motor Setup and Replacement Services",
        'rating': 4.5,
        'reviews': 1566,
        'price': 384,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Motor-Installation.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Water pipes",
    'id': 6,
    'imagePath': "assets/images/Red-Water-Pipes.jpeg",
    'data': [
      {
        'title': "Installation of Washing Machine Water Inlet",
        'rating': 4.5,
        'reviews': 1566,
        'price': 98,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Water-Inlet.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
      {
        'title': "Setup of Connection Hoses",
        'rating': 4.5,
        'reviews': 1566,
        'price': 87,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Plumbing-Hoses.jpeg",

        'serviceDetail':[
          {
            'header': 'What"s Included',
            'data':[
              ' '
            ]
          },
          {
            'header': 'Exclusions',
            'data':[
              ' '
            ]
          }
        ],
      },
    ]
  },
];


class PlumbingDetailsScreen extends StatefulWidget {
  static String tag = '/Plumber';
  final String? serviceType;
  PlumbingDetailsScreen({super.key,this.serviceType});

  @override
  State<PlumbingDetailsScreen> createState() => _PlumbingDetailsScreenState();
}

class _PlumbingDetailsScreenState extends State<PlumbingDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return BaseServiceScreen(
      title: "Plumber Services",
      serviceType: widget.serviceType,
      services: services, // Use the predefined services list
                serviceTypeList: ['Repair', 'Replace','Install'],
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
  //         "Plumber Services",
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
  //       // crossAxisAlignment: CrossAxisAlignment.start,
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
  //           serviceTypeList: ['Repair', 'Replace','Install'],
  //           sectionKeys: _sectionKeys,
  //         ),
  //               // Section 1: Heading and Short Services
  //             //   const SectionHeader(title: 'Professional Plumbing Services'),
  //             // CustomWidgets.BulletList(items: [
  //             //     'Leak Repair',
  //             //     'Pipe Installation',
  //             //     'Faucet Repair',
  //             //   ]),
  //             //   const SectionHeader(title: 'Experience and Expertise:'),
  //             // CustomWidgets.BulletList(items: [
  //             //     'Years of Experience: A company with a long history of providing plumbing services is likely to have the knowledge and skills to handle various plumbing issues.',
  //             //     'Licensed and Insured: Ensure the company is licensed and insured to protect you from potential liabilities.',
  //             //     'Positive Reviews and Testimonials: Check online reviews to gauge customer satisfaction and the quality of their work.',
  //             //   ]),
  //             //   const SectionHeader(title: 'Services Offered:'),
  //             // CustomWidgets.BulletList(items: [
  //             //     'Leak detection and repair',
  //             //     'Clogged drain cleaning',
  //             //     'Toilet repair and installation',
  //             //     'Faucet repair and replacement',
  //             //     'Water heater installation and repair',
  //             //     'Sewer line cleaning and repair',
  //             //     'Emergency plumbing services',
  //             //   ]),
  //             //
  //             //   // Section 2: Emergency Services
  //             //   const SectionHeader(title: 'Emergency Services:'),
  //             // CustomWidgets.BulletList(items: [
  //             //     'A reliable plumbing company should be available to handle emergencies, such as burst pipes or sewage backups, at any time of day or night.',
  //             //     'Quick Response Time: A prompt response to your emergency call can minimize damage and inconvenience.',
  //             //   ]),
  //             //
  //             //   // Section 3: Pricing and Transparency
  //             //   const SectionHeader(title: 'Transparency and Pricing:'),
  //             // CustomWidgets.BulletList(items: [
  //             //     'Clear Estimates: Obtain detailed written estimates that break down costs for labor, materials, and any additional fees.',
  //             //     'No Hidden Charges: Avoid companies with hidden fees or unexpected costs.',
  //             //     'Transparent Communication: A good plumbing company will keep you informed about the progress of the work and any potential issues.',
  //             //   ]),
  //             //
  //             //   // Section 4: Professionalism
  //             //   const SectionHeader(title: 'Professionalism and Efficiency:'),
  //             // CustomWidgets.BulletList(items: [
  //             //     'Clean and Respectful: The technicians should be clean, courteous, and respectful of your property.',
  //             //     'Efficient Work: A skilled plumber can complete the job quickly and efficiently, minimizing disruption to your daily routine.',
  //             //     'Quality Materials: The company should use high-quality materials and tools to ensure long-lasting repairs.',
  //             //   ]),
  //             //
  //             //   // Additional Tips
  //             //   const SectionHeader(title: 'Additional Tips:'),
  //             // CustomWidgets.BulletList(items: [
  //             //     'Get Multiple Quotes: Compare quotes from different companies to find the best deal.',
  //             //     'Read Reviews: Check online reviews to get a sense of the company\'s reputation.',
  //             //     'Ask Questions: Don\'t hesitate to ask questions about the company\'s experience, services, and pricing.',
  //             //     'Trust Your Gut: If something feels off, it\'s best to choose another company.',
  //             //   ]),
  //             //
  //             //   // Button
  //             //
  //             //   // Why Choose Us?
  //             //   const SizedBox(height: 20),
  //             //    CustomWidgets.cardSection(
  //             //      'Why Choose Us ?',
  //             //      [
  //             //       'Expert Technicians: Our team comprises highly skilled and certified plumbers with years of experience.',
  //             //       'Prompt and Reliable Service: We understand the inconvenience of plumbing issues. That\'s why we offer prompt and efficient service, arriving on time and getting the job done right.',
  //             //       'Quality Workmanship: We prioritize quality in every job, using top-notch materials and advanced techniques to ensure long-lasting solutions.',
  //             //       'Transparent Pricing: No hidden fees or surprises. We provide upfront, competitive pricing for all our services.',
  //             //       'Emergency Service: Plumbing emergencies don\'t wait. Our emergency service is available to assist you whenever you need it.',
  //             //       'Customer Satisfaction: Your satisfaction is our top priority. We strive to exceed your expectations with every service.',
  //             //     ],
  //             //   ),
  //             //
  //             //   // Plumbing Issues Section
  //             //    CustomWidgets.cardSection( 'Plumbing Issues',
  //             //      [
  //             //       'Kitchen and bathroom are integral parts of a home, and any issues or obstructions in these areas can greatly disrupt daily routines.',
  //             //       'From clogged pipes and blocked sinks to running toilets, timely repairs and maintenance can prevent future discomfort and inconvenience.',
  //             //       'By hiring professional services, you can save time and avoid costly replacements.',
  //             //       'Plumbers have the expertise and knowledge to handle any problem, and their advice can ensure a smooth-running plumbing system.',
  //             //     ],
  //             //   ),
  //             //   const SectionHeader(title: 'All About Plumbers'),
  //             //   const SectionHeader(title: 'Plumbing Services in Raipur, India'),
  //             // CustomWidgets.BulletList(items: [
  //             //     'Consider the disruption and inconvenience of waking up to a malfunctioning plumbing system in your home.While some may try to save money with DIY fixes, this can ultimately lead to costly repairs in the long run, especially if there are underlying major issues.',
  //             //     'It is important to note that plumbing problems do not typically occur suddenly; often, there are subtle warning signs that are overlooked, leading to more significant issues in the future.',
  //             //     'GharKaSathi offers fast and efficient plumbing services in Raipur, India, with repairs made at your doorstep within 60 minutes.Our service is also backed by a 30-day guarantee for your peace of mind. Trust GharKaSathi for top-notch plumbers in Raipur.',
  //             //     'Trust Your Gut: If something feels off, it\'s best to choose another company.',
  //             //   ]),
  //             //
  //             //   const SectionHeader(title: 'What Does Professional Home Deep Cleaning Include?'),
  //             // CustomWidgets.BulletList(items: [
  //             //     'To give your house a thorough deep cleaning, the following procedures are typically followed:',
  //             //
  //             //   ]),
  //             //
  //             //   const SectionHeader(title: 'Common Plumbing Issues'),
  //             // CustomWidgets.BulletList(items: [
  //             //     "Tap repair",
  //             //     "Tap replacement",
  //             //     "Tap installation",
  //             //     "Waste pipe leakage",
  //             //     "Jet spray installation",
  //             //     "Jet spray repair",
  //             //     "Flush tank installation",
  //             //     "Flush tank repair",
  //             //     "Wash basin installation",
  //             //     "Wash basin leakage repair",
  //             //     "Shower installation",
  //             //     "Shower repair",
  //             //     "Balcony drain blockage removal",
  //             //     "Drain pipe blockage removal",
  //             //     "Toilet pot blockage removal",
  //             //     "Overhead tank installation",
  //             //     "Pipeline leakage repair",
  //             //     "Water meter installation",
  //             //     "Motor installation",
  //             //     "Tap filter installation",
  //             //     "Shower filter installation",
  //             //   ]),
  //             //   const SectionHeader(title: 'Benefits of Hiring Plumbers from GharKaSathi'),
  //             // CustomWidgets.BulletList(items: [
  //             //     "Trustworthy Service: GharKaSathis plumbers are fully licensed and have undergone thorough background checks and training.",
  //             //     "Convenient Repair: GharKaSathi offers plumbing repairs at your doorstep within a quick turnaround time of 60 minutes.",
  //             //     "After-service Assurance: GharKaSathi offers a 30-day guarantee for plumbing services provided.",
  //             //     "GharKaSathi is known for its exceptional plumbing services in.",
  //             //     "Our team of experts is skilled in delivering projects on time and to the highest standards.",
  //             //     "Our professionals are ready to tackle any leakage or plumbing issues you may have, whether it be in your home, office, or commercial space. Connect with our leading plumbing experts to learn more about our services and how we can assist you",
  //             //   ]),
  //             //   const SizedBox(height: 20),
  //             ],
  //           ),
  //         );
  // }
}



