import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:ghar_ka_sathi/view/in_home_services/base_service_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/cleaning_details_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/service_bottom_sheet_components.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

/// Data for carpentry services
final List<Map<String, dynamic>> services = [
  {
    'category': "Chimney",
    'id': 1,
    'imagePath': "assets/images/Red-Color-Chimney.jpeg",
    'data': [
      {
        'title': "Chimney Filter Replacement Service",
        'rating': 4.8,
        'reviews': 5,
        'price': 329,
        'description':
            "Professional replacement of chimney filters to improve air quality and ensure efficient functioning of your kitchen chimney",
        'imagePath': "assets/images/Chimney-Filter.png",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Professional diagnosis and replacement of clogged or damaged filters',
              'Improves suction power and overall performance',
              'Extends the life of your chimney',
              'Reduces noise and odors in your kitchen'
            ]
          }
        ],
      },
      {
        'title': "Chimney Airflow Blockage Removal",
        'rating': 4.8,
        'reviews': 5,
        'price': 329,
        'description':
            "Professional cleaning and removal of blockages to restore optimal airflow in your kitchen chimney",
        'imagePath': "assets/images/Chimeny-Airflow.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Thorough inspection and cleaning of duct pathways',
              'Removal of grease and debris causing blockages',
              'Improves chimney efficiency and suction power',
              'Prevents overheating and extends chimney lifespan'
            ]
          }
        ],
      },
      {
        'title': "Chimney Motor Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 329,
        'description':
            "Expert repair service for chimney motors to restore proper function and performance",
        'imagePath': "assets/images/Chimney-Motor.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Diagnosis of motor issues and electrical problems',
              'Repair or replacement of faulty components',
              'Testing to ensure proper motor function',
              'Extends the life of your chimney'
            ]
          }
        ],
      },
      {
        'title': "Chimney Suction Power Restoration",
        'rating': 4.8,
        'reviews': 5,
        'price': 329,
        'description':
            "Comprehensive service to restore optimal suction power to your kitchen chimney",
        'imagePath': "assets/images/Chimney-Suction.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Thorough cleaning of all components affecting suction',
              'Inspection and repair of motor and fan assembly',
              'Removal of blockages in ducts and filters',
              'Performance testing to ensure proper suction restoration'
            ]
          }
        ],
      },
      {
        'title': "Chimney Fan/Blower Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 329,
        'description':
            "Expert repair service for chimney fans and blowers to ensure efficient operation",
        'imagePath': "assets/images/Chimney-Fan.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Diagnosis of fan/blower issues',
              'Cleaning and lubrication of fan components',
              'Repair or replacement of damaged parts',
              'Noise reduction and performance optimization'
            ]
          }
        ],
      },
      {
        'title': "Chimney Button/Control Panel Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 329,
        'description':
            "Professional repair of chimney control panels and buttons for seamless operation",
        'imagePath': "assets/images/Chimney-button.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Diagnosis of control panel electrical issues',
              'Repair or replacement of faulty buttons and switches',
              'PCB board inspection and repair if needed',
              'Full testing of all control functions'
            ]
          }
        ],
      },
      {
        'title': "Chimney Light/Bulb Replacement",
        'rating': 4.8,
        'reviews': 5,
        'price': 329,
        'description':
            "Quick and efficient replacement of chimney lights and bulbs for better visibility",
        'imagePath': "assets/images/Chimney-Light.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Removal of old or non-functional bulbs',
              'Installation of appropriate replacement bulbs',
              'Testing of lighting system',
              'Inspection of related electrical components'
            ]
          }
        ],
      },
      {
        'title': "Chimney Noise Reduction Service",
        'rating': 4.8,
        'reviews': 5,
        'price': 329,
        'description':
            "Specialized service to diagnose and reduce excessive noise from your kitchen chimney",
        'imagePath': "assets/images/Chimney-Appliance.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Diagnosis of noise sources in the chimney',
              'Fan balancing and lubrication',
              'Tightening of loose components',
              'Replacement of damaged parts causing noise'
            ]
          }
        ],
      },
      {
        'title': "Chimney Duct Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 329,
        'description':
            "Professional repair service for damaged or disconnected chimney ducts",
        'imagePath': "assets/images/Chimney-Duct.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Inspection of duct system for damage or disconnections',
              'Repair or replacement of damaged ducts',
              'Sealing of leaks and gaps',
              'Ensuring proper airflow and ventilation'
            ]
          }
        ],
      },
      {
        'title': "Chimney Electrical Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 329,
        'description':
            "Expert electrical repair service for all chimney electrical components and wiring",
        'imagePath': "assets/images/Chimney-Electrical.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Diagnosis of electrical faults and shorts',
              'Repair of wiring and connections',
              'Replacement of damaged electrical components',
              'Safety testing of all electrical systems'
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Fans",
    'id': 2,
    'imagePath': "assets/images/Red-Color-Fan.jpeg",
    'data': [
      {
        'title': "Expert Fan Installation – Safe, Efficient & Reliable",
        'rating': 4.8,
        'reviews': 5,
        'price': 98,
        'description':
            "Professional installation service for ceiling fans with safety and reliability guaranteed",
        'imagePath': "assets/images/Fan-Installation.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Proper mounting and secure installation',
              'Electrical wiring and connection setup',
              'Balance adjustment for wobble-free operation',
              'Testing for safe and efficient performance'
            ]
          }
        ],
      },
      {
        'title': "Professional Fan Uninstallation – Safe, Quick & Hassle-Free",
        'rating': 4.8,
        'reviews': 5,
        'price': 76,
        'description':
            "Quick and safe removal of ceiling fans with proper handling of electrical connections",
        'imagePath': "assets/images/Ceiling-Fan-Uninstallation.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Safe disconnection of electrical wiring',
              'Careful removal of fan unit',
              'Proper handling of components',
              'Optional storage preparation advice'
            ]
          }
        ],
      },
      {
        'title': "Professional Fan Replacement – Safe, Seamless & Efficient",
        'rating': 4.8,
        'reviews': 5,
        'price': 164,
        'description':
            "Comprehensive service to remove your old fan and install a new one in a single visit",
        'imagePath': "assets/images/Fan-Replacement.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Safe removal of existing fan',
              'Installation of new fan unit',
              'Proper electrical connections',
              'Testing and balance adjustment'
            ]
          }
        ],
      },
      {
        'title': "Expert Fan Repair – Restore Performance & Efficiency",
        'rating': 4.8,
        'reviews': 5,
        'price': 120,
        'description':
            "Professional diagnosis and repair service for all types of ceiling and wall fans",
        'imagePath': "assets/images/Fan-Repairing.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Diagnosis of electrical and mechanical issues',
              'Repair of motor, capacitor, and winding problems',
              'Balancing and noise reduction',
              'Performance testing after repair'
            ]
          }
        ],
      },
      {
        'title':
            "Ceiling Fan Regulator Replacement – Smooth & Reliable Speed Control",
        'rating': 4.8,
        'reviews': 5,
        'price': 54,
        'description':
            "Professional replacement of fan regulators to ensure smooth speed control",
        'imagePath': "assets/images/Fan-Regulator.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Removal of old or faulty regulator',
              'Installation of new compatible regulator',
              'Proper wiring and connection',
              'Testing of all speed settings'
            ]
          }
        ],
      },
      {
        'title': "Wall Fan Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 120,
        'description':
            "Professional installation of wall-mounted fans for optimal air circulation",
        'imagePath': "assets/images/Fan-Repairing.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Secure wall mounting and bracket installation',
              'Electrical wiring and connection',
              'Angle adjustment for optimal airflow',
              'Testing of all functions and speeds'
            ]
          }
        ],
      },
      {
        'title': "Exhaust Fan Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 120,
        'description':
            "Expert installation of exhaust fans for proper ventilation in bathrooms and kitchens",
        'imagePath': "assets/images/Fan-Repairing.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Wall/window preparation and cutting if required',
              'Secure mounting and installation',
              'Electrical connections and testing',
              'Sealing around fan to prevent air and water leakage'
            ]
          }
        ],
      },
      {
        'title': "Decorative Ceiling Fan Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 120,
        'description':
            "Professional installation of decorative and designer ceiling fans",
        'imagePath': "assets/images/Fan-Repairing.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Careful handling of decorative elements',
              'Secure mounting and assembly',
              'Electrical connections and wiring',
              'Balancing and performance testing'
            ]
          }
        ],
      },
      {
        'title': "Pigeon FAN-tastic Ceiling Fan Installation:Regular",
        'rating': 4.8,
        'reviews': 5,
        'price': 120,
        'description':
            "Professional installation service for Pigeon brand standard ceiling fans",
        'imagePath': "assets/images/Fan-Repairing.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Brand-specific installation expertise',
              'Secure mounting and assembly',
              'Proper electrical connections',
              'Testing and adjustment for optimal performance'
            ]
          }
        ],
      },
      {
        'title': "Pigeon FAN-tastic Ceiling Fan Installation:Decorative",
        'rating': 4.8,
        'reviews': 5,
        'price': 120,
        'description':
            "Professional installation service for Pigeon brand decorative ceiling fans",
        'imagePath': "assets/images/Fan-Repairing.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Careful handling of decorative components',
              'Brand-specific installation expertise',
              'Secure mounting and proper assembly',
              'Balance adjustment and performance testing'
            ]
          }
        ],
      },
      {
        'title': "Pigeon FAN-tastic Ceiling Fan Installation:Smart/BLDC",
        'rating': 4.8,
        'reviews': 5,
        'price': 120,
        'description':
            "Expert installation of Pigeon brand smart and BLDC (brushless DC) ceiling fans",
        'imagePath': "assets/images/Fan-Repairing.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Smart connectivity setup if applicable',
              'BLDC motor handling expertise',
              'Remote control programming',
              'Full functionality testing and demonstration'
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Air-Conditioner",
    'id': 3,
    'imagePath': "assets/images/Red-Color-AC.png",
    'data': [
      {
        'title': "AC Service Saver Pack – 2 ACs | Deep Cleaning & Maintenance",
        'rating': 4.8,
        'reviews': 5,
        'price': 200,
        'description':
            "Comprehensive service package for two air conditioners including deep cleaning and maintenance",
        'imagePath': "assets/images/Two-AC.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Deep cleaning of indoor and outdoor units for 2 ACs',
              'Filter cleaning and sanitization',
              'Condenser and evaporator coil cleaning',
              'Performance check and refrigerant level inspection'
            ]
          }
        ],
      },
      {
        'title': "AC Service Saver Pack – 3 ACs | Deep Cleaning & Maintenance",
        'rating': 4.8,
        'reviews': 5,
        'price': 200,
        'description':
            "Comprehensive service package for three air conditioners including deep cleaning and maintenance",
        'imagePath': "assets/images/Three-AC.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Deep cleaning of indoor and outdoor units for 3 ACs',
              'Filter cleaning and sanitization',
              'Condenser and evaporator coil cleaning',
              'Performance check and refrigerant level inspection'
            ]
          }
        ],
      },
      {
        'title': "AC Service Saver Pack – 4 ACs | Maximum Savings & Efficiency",
        'rating': 4.8,
        'reviews': 5,
        'price': 200,
        'description':
            "Comprehensive service package for four air conditioners with maximum savings",
        'imagePath': "assets/images/Four-AC.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Deep cleaning of indoor and outdoor units for 4 ACs',
              'Filter cleaning and sanitization',
              'Condenser and evaporator coil cleaning',
              'Performance check and refrigerant level inspection'
            ]
          }
        ],
      },
      {
        'title': "Gas Refill",
        'rating': 4.8,
        'reviews': 5,
        'price': 2749,
        'description':
            "Professional refrigerant gas refilling service for air conditioners",
        'imagePath': "assets/images/AC-Gas.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Leak detection and repair if necessary',
              'Vacuum pumping to remove moisture',
              'Refilling with appropriate refrigerant gas',
              'Performance testing after refill'
            ]
          }
        ],
      },
      {
        'title': "Professional AC Repair – Fast, Reliable & Efficient Cooling",
        'rating': 4.8,
        'reviews': 5,
        'price': 329,
        'description':
            "Expert repair service for all types of air conditioner issues",
        'imagePath': "assets/images/AC-Cooling.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Comprehensive diagnosis of AC problems',
              'Repair of electrical and mechanical issues',
              'Component replacement if necessary',
              'Performance testing after repair'
            ]
          }
        ],
      },
      {
        'title':
            "Expert AC Service – Keep Your Cooling Efficient & Long-Lasting",
        'rating': 4.8,
        'reviews': 5,
        'price': 604,
        'description':
            "Complete air conditioner service to ensure efficient and long-lasting cooling",
        'imagePath': "assets/images/AC-service.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Thorough cleaning of all components',
              'Filter cleaning or replacement',
              'Condenser and evaporator coil cleaning',
              'Refrigerant level check and system optimization'
            ]
          }
        ],
      },
      {
        'title': "Expert AC Installation - Precision, Safety & Efficiency",
        'rating': 4.8,
        'reviews': 5,
        'price': 1029,
        'description':
            "Professional installation service for split and window air conditioners",
        'imagePath': "assets/images/AC-Installation.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Proper indoor and outdoor unit mounting',
              'Copper tubing installation and insulation',
              'Electrical connections and circuit protection',
              'Performance testing and system optimization'
            ]
          }
        ],
      },
      {
        'title': "Professional AC Uninstallation – Safe, Quick & Damage-Free",
        'rating': 4.8,
        'reviews': 5,
        'price': 549,
        'description': "Safe and damage-free removal of air conditioning units",
        'imagePath': "assets/images/AC-Uninstallation.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Safe recovery of refrigerant gas',
              'Careful disconnection of electrical components',
              'Removal of indoor and outdoor units',
              'Proper sealing of wall openings if requested'
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Refrigerator",
    'id': 4,
    'imagePath': "assets/images/Red-Color-Refrigerator.jpeg",
    'data': [
      {
        'title': "Refrigerator Not Cooling – Inspection & Diagnosis",
        'rating': 4.8,
        'reviews': 5,
        'price': 99,
        'description':
            "Professional inspection and diagnosis service for refrigerators with cooling issues",
        'imagePath': "assets/images/Refrigerator-Inspection.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Comprehensive diagnostic check of cooling system',
              'Inspection of compressor, thermostat, and fans',
              'Identification of refrigerant leaks',
              'Detailed report and repair recommendations'
            ]
          }
        ],
      },
      {
        'title': "Refrigerator Water Leakage – Inspection & Diagnosis",
        'rating': 4.8,
        'reviews': 5,
        'price': 99,
        'description':
            "Expert inspection service to identify causes of refrigerator water leakage",
        'imagePath': "assets/images/Refrigerator-Leakage.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Inspection of drain system and water lines',
              'Check for ice maker and water dispenser issues',
              'Evaluation of door seals and condensation',
              'Detailed repair recommendations'
            ]
          }
        ],
      },
      {
        'title': "Refrigerator Noise Issue – Inspection & Diagnosis",
        'rating': 4.8,
        'reviews': 5,
        'price': 99,
        'description':
            "Professional diagnosis of unusual or loud noises from your refrigerator",
        'imagePath': "assets/images/Refrigerator-Noise.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Identification of noise sources',
              'Inspection of fan, compressor, and motor',
              'Evaluation of refrigerant flow noise',
              'Recommendations for noise reduction'
            ]
          }
        ],
      },
      {
        'title': "Refrigerator Light Not Working – Inspection & Diagnosis",
        'rating': 4.8,
        'reviews': 5,
        'price': 99,
        'description': "Diagnosis service for refrigerator lighting issues",
        'imagePath': "assets/images/Refrigerator-Light.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Inspection of bulb or LED lighting',
              'Check of door switches and connections',
              'Evaluation of control board issues',
              'Repair recommendations'
            ]
          }
        ],
      },
      {
        'title': "Refrigerator Water Dispenser Repair – Inspection & Diagnosis",
        'rating': 4.8,
        'reviews': 5,
        'price': 149,
        'description':
            "Professional diagnosis of water dispenser issues in refrigerators",
        'imagePath': "assets/images/Refrigerator-Water.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Inspection of water supply line and filter',
              'Check of dispenser mechanism and controls',
              'Evaluation of valve and solenoid functionality',
              'Detailed repair recommendations'
            ]
          }
        ],
      },
      {
        'title': "Refrigerator Door Alignment Repair – Inspection & Diagnosis",
        'rating': 4.8,
        'reviews': 5,
        'price': 149,
        'description':
            "Professional inspection and diagnosis of refrigerator door alignment issues",
        'imagePath': "assets/images/Refrigerator-Door.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Evaluation of door hinges and alignment',
              'Check of door gasket and seal integrity',
              'Inspection of leveling and stability',
              'Recommendations for proper alignment'
            ]
          }
        ],
      },
      {
        'title': "Refrigerator Door Handle Repair/Replacement – Inspection",
        'rating': 4.8,
        'reviews': 5,
        'price': 149,
        'description':
            "Inspection and repair service for damaged or loose refrigerator door handles",
        'imagePath': "assets/images/Refrierator-Handle.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Evaluation of handle damage',
              'Inspection of mounting brackets and screws',
              'Tightening of loose components',
              'Replacement recommendations if needed'
            ]
          }
        ],
      },
      {
        'title': "Refrigerator Ice Maker Repair – Inspection",
        'rating': 4.8,
        'reviews': 5,
        'price': 199,
        'description':
            "Professional diagnosis service for malfunctioning ice makers in refrigerators",
        'imagePath': "assets/images/Refrigerator-Ice.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Inspection of ice maker mechanism',
              'Check of water supply and filter',
              'Evaluation of freezer temperature',
              'Detailed repair recommendations'
            ]
          }
        ],
      },
      {
        'title': "Refrigerator Defrosting Issues Repair – Inspection",
        'rating': 4.8,
        'reviews': 5,
        'price': 199,
        'description':
            "Expert diagnosis of frost buildup and defrosting problems in refrigerators",
        'imagePath': "assets/images/Refrigerator-Defrosting.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Inspection of defrost timer and thermostat',
              'Check of heating element functionality',
              'Evaluation of drain system',
              'Recommendations for defrost system repair'
            ]
          }
        ],
      },
      {
        'title': "Refrigerator Door Seal/Gasket Replacement – Inspection",
        'rating': 4.8,
        'reviews': 5,
        'price': 249,
        'description':
            "Professional inspection for damaged or worn refrigerator door seals",
        'imagePath': "assets/images/Refrigerator-Gasket.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Evaluation of gasket condition and sealing',
              'Inspection for mold and damage',
              'Measurement for proper replacement',
              'Recommendations for seal improvement'
            ]
          }
        ],
      },
      {
        'title': "Refrigerator Gas Refilling – Inspection",
        'rating': 4.8,
        'reviews': 5,
        'price': 1499,
        'description':
            "Professional refrigerant gas refilling service for refrigerators",
        'imagePath': "assets/images/Refrigerator-Gas.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Leak detection and repair if necessary',
              'System evacuation and cleaning',
              'Proper refrigerant charging',
              'Performance testing after refill'
            ]
          }
        ],
      },
      {
        'title': "Single Door Refrigerator Repair – Inspection",
        'rating': 4.8,
        'reviews': 5,
        'price': 499,
        'description':
            "Comprehensive repair service for single door refrigerators",
        'imagePath': "assets/images/Single-Door-Refrigerator.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Thorough diagnosis of all components',
              'Repair of cooling system issues',
              'Thermostat and electrical repair',
              'Performance testing after repair'
            ]
          }
        ],
      },
      {
        'title': "Double Door Refrigerator Repair – Inspection",
        'rating': 4.8,
        'reviews': 5,
        'price': 699,
        'description':
            "Comprehensive repair service for double door refrigerators",
        'imagePath': "assets/images/Refrigerator-Double-Door.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Diagnosis of frost-free and inverter systems',
              'Repair of dual cooling mechanisms',
              'Digital control panel troubleshooting',
              'Full performance testing after repair'
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Microwave",
    'id': 5,
    'imagePath': "assets/images/Red-Color-Microwave.jpeg",
    'data': [
      {
        'title': "Microwave Heating Issue - Professional Inspection & Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 149,
        'description':
            "Expert diagnosis and repair service for microwave heating problems",
        'imagePath': "assets/images/Microwave-Heating.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Inspection of magnetron and high voltage components',
              'Diagnosis of power supply issues',
              'Check of control board functionality',
              'Performance testing after repair'
            ]
          }
        ],
      },
      {
        'title':
            "Microwave Overheating Issue - Professional Inspection & Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 149,
        'description':
            "Expert diagnosis and repair service for microwave overheating issues",
        'imagePath': "assets/images/Microwave-Overheating.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Inspection of cooling system and vents',
              'Check of thermal fuse and sensors',
              'Diagnosis of control circuit problems',
              'Safety testing after repair'
            ]
          }
        ],
      },
      {
        'title': "Microwave Power Issue - Professional Inspection & Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 149,
        'description':
            "Expert diagnosis and repair for microwave power and startup issues",
        'imagePath': "assets/images/Microwave-Power.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Inspection of power cord and internal wiring',
              'Diagnosis of fuse and circuit board issues',
              'Check of door switches and safety interlocks',
              'Comprehensive electrical testing'
            ]
          }
        ],
      },
      {
        'title':
            "Microwave Button/Touchpad Issue - Professional Inspection & Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 199,
        'description':
            "Expert repair service for malfunctioning microwave buttons or touchpads",
        'imagePath': "assets/images/Microwave-Touchpad.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Diagnosis of touchpad membrane and buttons',
              'Control panel circuit testing',
              'Cleaning of contacts and connections',
              'Replacement recommendations if needed'
            ]
          }
        ],
      },
      {
        'title':
            "Microwave Display/Screen Repair - Professional Inspection & Service",
        'rating': 4.8,
        'reviews': 5,
        'price': 249,
        'description':
            "Expert repair service for microwave display and screen issues",
        'imagePath': "assets/images/Microwave-Display.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Diagnosis of display panel problems',
              'Check of LED/LCD connections',
              'Control board inspection',
              'Replacement of faulty display components'
            ]
          }
        ],
      },
      {
        'title':
            "Microwave Timer/Clock Repair - Professional Inspection & Service",
        'rating': 4.8,
        'reviews': 5,
        'price': 199,
        'description':
            "Expert repair service for malfunctioning microwave timers and clocks",
        'imagePath': "assets/images/MIcrowave-Timer.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Diagnosis of timer mechanism issues',
              'Control board and circuit testing',
              'Repair of clock display problems',
              'Functionality testing after repair'
            ]
          }
        ],
      },
      {
        'title':
            "Microwave Turntable Not Rotating - Professional Inspection & Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 199,
        'description':
            "Expert diagnosis and repair service for non-rotating microwave turntables",
        'imagePath': "assets/images/Microwave-Fault.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Inspection of turntable motor and coupling',
              'Check of drive components and tray',
              'Diagnosis of mechanical obstructions',
              'Repair or replacement of faulty parts'
            ]
          }
        ],
      },
      {
        'title':
            "Microwave Sparking or Arcing - Professional Inspection & Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 249,
        'description':
            "Expert diagnosis and repair service for dangerous microwave sparking issues",
        'imagePath': "assets/images/Microwave-Shock.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Safety inspection of waveguide and cavity',
              'Check for damaged paint or metal surfaces',
              'Inspection of magnetron and high voltage components',
              'Comprehensive safety testing after repair'
            ]
          }
        ],
      },
      {
        'title': "Microwave Noise Repair - Professional Inspection & Service",
        'rating': 4.8,
        'reviews': 5,
        'price': 199,
        'description':
            "Expert diagnosis and repair service for unusual noises from your microwave",
        'imagePath': "assets/images/Microwave-Noise.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Identification of noise sources',
              'Inspection of fan, motor, and turntable',
              'Diagnosis of magnetron and transformer noise',
              'Repair or replacement of noisy components'
            ]
          }
        ],
      },
      {
        'title': "Microwave Fan Repair - Inspection",
        'rating': 4.8,
        'reviews': 5,
        'price': 199,
        'description':
            "Professional diagnosis and repair of microwave cooling fan issues",
        'imagePath': "assets/images/Microwave-Fan.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Inspection of fan motor and blades',
              'Check for obstructions and damage',
              'Diagnosis of electrical connections',
              'Lubrication or replacement as needed'
            ]
          }
        ],
      },
      {
        'title': "Microwave Door Repair - Professional Inspection & Service",
        'rating': 4.8,
        'reviews': 5,
        'price': 249,
        'description':
            "Expert repair service for microwave door issues and damage",
        'imagePath': "assets/images/Microwave-Door-Defect.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Inspection of door hinges and latches',
              'Check of safety interlocks and switches',
              'Diagnosis of door alignment issues',
              'Repair or replacement of damaged components'
            ]
          }
        ],
      },
      {
        'title':
            "Microwave Door Seal/Gasket Replacement - Professional Inspection & Service",
        'rating': 4.8,
        'reviews': 5,
        'price': 299,
        'description':
            "Expert diagnosis and replacement service for damaged microwave door seals",
        'imagePath': "assets/images/Microwave-Gasket.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Inspection of door seal condition',
              'Check for radiation leakage (if applicable)',
              'Removal of damaged seal',
              'Installation of new compatible gasket'
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Water-Purifier",
    'id': 6,
    'imagePath': "assets/images/Red-Color-Water-Purifier.jpeg",
    'data': [
      {
        'title': "Water Purifier Service - Keep Your Water Clean & Safe",
        'rating': 4.8,
        'reviews': 5,
        'price': 1799,
        'description':
            "Regular servicing improves water quality, maintains filtration efficiency, and extends the purifier's lifespan by preventing potential issues.",
        'imagePath': "assets/images/Water-Purifier-Service.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Comprehensive cleaning of all filter components',
              'Sediment filter replacement if necessary',
              'Sanitization of internal water pathways',
              'Performance and water quality testing'
            ]
          }
        ],
      },
      {
        'title':
            "Hassle-Free Water Purifier Uninstallation – Safe & Damage-Free",
        'rating': 4.8,
        'reviews': 5,
        'price': 405,
        'description':
            "Professional removal service for water purifiers with safe disconnection",
        'imagePath': "assets/images/Water-Unistallation.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Safe disconnection of water supply',
              'Careful removal of unit from wall/surface',
              'Proper handling of filters and tanks',
              'Basic water line capping if needed'
            ]
          }
        ],
      },
      {
        'title': "Water Purifier Installation - Hassle-Free & Professional",
        'rating': 4.8,
        'reviews': 5,
        'price': 449,
        'description':
            "Expert installation service for all types of water purifiers",
        'imagePath': "assets/images/Water-Installation.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Secure mounting and placement',
              'Proper water line connection',
              'Installation of all filters and components',
              'Performance testing and quality check'
            ]
          }
        ],
      },
      {
        'title': "Water Purifier Low Water Pressure? Get It Fixed!",
        'rating': 4.8,
        'reviews': 5,
        'price': 200,
        'description':
            "Professional diagnosis and repair service for water purifiers with low output pressure",
        'imagePath': "assets/images/Water-Low-Pressure.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Diagnosis of pressure issues and blockages',
              'Inspection of pump and pressure tank',
              'Check of filter condition and saturation',
              'Cleaning or replacement of clogged components'
            ]
          }
        ],
      },
      {
        'title': "Water Purifier Pump Repair/Replacement",
        'rating': 4.8,
        'reviews': 5,
        'price': 200,
        'description':
            "Expert repair or replacement service for faulty water purifier pumps",
        'imagePath': "assets/images/Water-Purifier-Pump.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Diagnosis of pump issues and failure',
              'Electrical testing of pump components',
              'Repair of minor pump problems',
              'Replacement with compatible pump if needed'
            ]
          }
        ],
      },
      {
        'title': "Water Purifier Taste and Odor Issues Service",
        'rating': 4.8,
        'reviews': 5,
        'price': 200,
        'description':
            "Expert diagnosis and solution for taste and odor problems in purified water",
        'imagePath': "assets/images/TDS Meter.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Water quality testing (TDS, pH if applicable)',
              'Inspection of carbon and other filters',
              'Check for bacterial growth and contamination',
              'Filter replacement or system sanitization'
            ]
          }
        ],
      },
      {
        'title': "Water Purifier UV Lamp Replacement Service",
        'rating': 4.8,
        'reviews': 5,
        'price': 200,
        'description':
            "Professional replacement service for water purifier UV lamps",
        'imagePath': "assets/images/Water-UV.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Safe removal of old UV lamp',
              'Installation of new compatible UV lamp',
              'Check of quartz sleeve condition',
              'Testing of UV system functionality'
            ]
          }
        ],
      },
      {
        'title': "Water Purifier Noise Issues Service",
        'rating': 4.8,
        'reviews': 5,
        'price': 200,
        'description':
            "Expert diagnosis and repair service for noisy water purifiers",
        'imagePath': "assets/images/Water-Noise.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Identification of noise sources',
              'Inspection of pump and motor',
              'Check for air in system and vibrations',
              'Repair or replacement of noisy components'
            ]
          }
        ],
      },
      {
        'title': "Water Purifier Error Diagnosis & Fix",
        'rating': 4.8,
        'reviews': 5,
        'price': 200,
        'description':
            "Professional diagnosis and repair service for water purifiers displaying error codes",
        'imagePath': "assets/images/Water-Professional.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Error code interpretation',
              'System diagnostic testing',
              'Control board inspection',
              'Resolution of error conditions'
            ]
          }
        ],
      },
      {
        'title': "Fix Water Purifier Leaks – Inlet/Outlet",
        'rating': 4.8,
        'reviews': 5,
        'price': 200,
        'description':
            "Expert repair service for water leaks in purifier connections",
        'imagePath': "assets/images/Water-Outlet.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Location of leak sources',
              'Repair of pipe and fitting connections',
              'Replacement of damaged O-rings and seals',
              'Pressure testing after repair'
            ]
          }
        ],
      },
      {
        'title': "Replace Water Purifier Filters – Keep Water Fresh & Pure",
        'rating': 4.8,
        'reviews': 5,
        'price': 200,
        'description':
            "Professional filter replacement service for all types of water purifiers",
        'imagePath': "assets/images/Purifier-Filter.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Removal of old saturated filters',
              'Installation of new compatible filters',
              'System sanitization if required',
              'Performance testing after replacement'
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Geyser",
    'id': 7,
    'imagePath': "assets/images/RED-GYSER.jpeg",
    'data': [
      {
        'title': "Geyser Deep Cleaning & Descaling",
        'rating': 4.8,
        'reviews': 5,
        'price': 599,
        'description':
            "Professional deep cleaning service to remove mineral deposits and scale from your geyser",
        'imagePath': "assets/images/Fan-Installation.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Removal of scale and mineral deposits',
              'Cleaning of heating element and tank',
              'Improved energy efficiency after service',
              'Extended geyser lifespan'
            ]
          }
        ],
      },
      {
        'title': "Geyser Not Heating Water – Repair Service",
        'rating': 4.8,
        'reviews': 5,
        'price': 249,
        'description':
            "Expert diagnosis and repair service for geysers that aren't heating water properly",
        'imagePath': "assets/images/Fan-Installation.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Diagnosis of heating element issues',
              'Thermostat testing and calibration',
              'Electrical connection inspection',
              'Replacement of faulty components'
            ]
          }
        ],
      },
      {
        'title': "Geyser Leakage Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 249,
        'description':
            "Professional repair service for water leaks from geyser tank or connections",
        'imagePath': "assets/images/Fan-Installation.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Location of leak sources',
              'Inspection of tank and connection points',
              'Repair of minor leaks',
              'Replacement recommendations for major issues'
            ]
          }
        ],
      },
      {
        'title': "Geyser Inlet/Outlet Pipe Leakage Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 249,
        'description':
            "Expert repair service for leaking pipes and connections on your geyser",
        'imagePath': "assets/images/Fan-Installation.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Identification of pipe leak locations',
              'Replacement of damaged washers and seals',
              'Tightening or replacement of connections',
              'Pressure testing after repair'
            ]
          }
        ],
      },
      {
        'title': "Geyser Water Pressure Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 249,
        'description':
            "Professional diagnosis and repair for low water pressure issues with your geyser",
        'imagePath': "assets/images/Fan-Installation.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Inspection of inlet pipes and strainers',
              'Check for blockages and mineral buildup',
              'Cleaning of affected components',
              'Adjustment of pressure settings if applicable'
            ]
          }
        ],
      },
      {
        'title': "Geyser Noise Issue Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 249,
        'description': "Expert diagnosis and repair service for noisy geysers",
        'imagePath': "assets/images/Fan-Installation.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Identification of noise sources',
              'Inspection of heating element and tank',
              'Check for scale buildup causing noise',
              'Resolution of water hammer issues'
            ]
          }
        ],
      },
      {
        'title': "Geyser Timer Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 249,
        'description':
            "Professional repair service for malfunctioning geyser timers and controls",
        'imagePath': "assets/images/Fan-Installation.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Diagnosis of timer mechanism issues',
              'Inspection of control panel and circuits',
              'Repair of electrical connections',
              'Replacement of faulty timer components'
            ]
          }
        ],
      },
      {
        'title': "Geyser Thermostat Repair & Replacement",
        'rating': 4.8,
        'reviews': 5,
        'price': 249,
        'description':
            "Expert repair or replacement service for faulty geyser thermostats",
        'imagePath': "assets/images/Fan-Installation.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Testing of thermostat functionality',
              'Calibration of temperature settings',
              'Repair of thermostat connections',
              'Replacement with compatible thermostat if needed'
            ]
          }
        ],
      },
      {
        'title': "Geyser Installation Service",
        'rating': 4.8,
        'reviews': 5,
        'price': 499,
        'description':
            "Professional installation service for all types of water geysers",
        'imagePath': "assets/images/Fan-Installation.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Proper wall mounting and placement',
              'Water inlet and outlet connections',
              'Electrical wiring and earthing',
              'Testing and temperature adjustment'
            ]
          }
        ],
      },
      {
        'title': "Geyser Uninstallation Service",
        'rating': 4.8,
        'reviews': 5,
        'price': 399,
        'description':
            "Safe and professional removal service for water geysers",
        'imagePath': "assets/images/Fan-Installation.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Safe drainage of water tank',
              'Disconnection of plumbing connections',
              'Proper electrical disconnection',
              'Careful removal from wall or location'
            ]
          }
        ],
      },
    ]
  },
];

class ElectronicAppliances extends StatefulWidget {
  static String tag = '/ElectronicAppliances';
  final String? serviceType;
  ElectronicAppliances({super.key, this.serviceType});

  @override
  State<ElectronicAppliances> createState() => _ElectronicAppliancesState();
}

class _ElectronicAppliancesState extends State<ElectronicAppliances> {

  @override
  Widget build(BuildContext context) {
    return BaseServiceScreen(
      title: "Electronic Appliances",
      serviceType: widget.serviceType,
      services: services, // Use the predefined services list
      serviceTypeList: ['basic Cleaning', 'deep Cleaning'],
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
  //     backgroundColor: AppColors.white,
  //     appBar: AppBar(
  //       title: const Text(
  //         "Electronic Appliances",
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
