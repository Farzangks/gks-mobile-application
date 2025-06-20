import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/view/in_home_services/base_service_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

import 'cleaning_details_screen.dart';


/// Data for carpentry services
final List<Map<String, dynamic>> services = [
  {
    'category': "Door",
    'id': 1,
    'imagePath': "assets/images/Door-Main.jpeg",
    'data': [
      {
        'title': "Door Accessories Setup",
        'rating': 4.5,
        'reviews': 1566,
        'price': 219,
        'description':
        "Enhance your door’s functionality and security with our professional installation service. We ensure seamless setup of essential door accessories for a smooth and secure experience.",
        'imagePath': "assets/images/Door-Acessories.jpeg",
        'serviceDetail':[
          {
            'header': 'What’s Covered?',
            'data':[
              'Installation of door chains, hinges, latches, and closers',
              'Proper alignment for effortless operation',
              'Quick testing to ensure everything works perfectly'
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data':[
              'Cost of accessories (to be provided by the customer or arranged separately)',
              'Structural modifications to the door',
            ]
          }
        ],
      },
      {
        'title': "Lock Replacement Services",
        'rating': 4.5,
        'reviews': 1618,
        'price': 384,
        'description':
        "Keep your home secure with our expert lock replacement service. We ensure a hassle-free swap of old or faulty locks, giving you peace of mind with a smooth and secure locking system.",
        'imagePath': "assets/images/Door-Lock.jpeg",
        'serviceDetail':[
          {
            'header': 'Service Includes:',
            'data':[
              'Safe removal of the existing lock',
              'Precise installation of the new lock (provided by the customer or sourced separately)',
              'Alignment check and functionality testing'
            ]
          }, {
            'header': 'What’s Not Covered?',
            'data':[
              'Cost of the new lock',
              'Major alterations to the door or frame',
            ]
          },
        ],
      },
      {
        'title': "Lock Repair Solutions",
        'rating': 4.5,
        'reviews': 1618,
        'price': 274,
        'description':
        "Is your lock jammed, stiff, or not working properly? Our expert repair service ensures smooth operation and restores security without the need for a full replacement.",
        'imagePath': "assets/images/Door-Lock-Repair.jpeg",
        'serviceDetail':[
          {
            'header': 'What’s Included?',
            'data':[
              'Diagnosis and repair of lock issues',
              'Lubrication and fine-tuning of internal components',
              'Testing to ensure secure and hassle-free locking'
            ]
          },
          {
            'header': 'What’s Not Covered?',
            'data':[
              'Cost of replacement parts (if required, additional charges apply)',
              'Full lock replacement',
            ]
          },
        ],
      },
      {
        'title': "Lock Installation Services",
        'rating': 4.5,
        'reviews': 1618,
        'price': 659,
        'description':
        "Need a secure lock on a door without one? Our expert installation service ensures a precise fit and smooth operation for enhanced safety.",
        'imagePath': "assets/images/Door-Lock-Repair-Solution.jpeg",
        'serviceDetail':[
          {
            'header': 'What’s Included?',
            'data':[
              'Professional installation of a new lock on standard or pre-drilled doors',
              'Alignment and adjustments for seamless functionality',
              'Complete testing to ensure proper locking'
            ]
          },
          {
            'header': 'What’s Not Included?/Important Information',
            'data':[
              'Cost of the lock (to be provided by the customer or arranged separately)',
              'Custom modifications for non-standard doors',
            ]
          },
        ],
      },
      {
        'title': "Door Maintenance and Repair",
        'rating': 4.5,
        'reviews': 1618,
        'price': 329,
        'description':
        "Revive your door’s functionality and appearance with our expert repair service—no need for a full replacement!",
        'imagePath': "assets/images/Door-Repairing.jpeg",
        'serviceDetail':[
          {
            'header': 'What’s Included?',
            'data':[
              'Fixing cracks, scratches, and minor surface damage',
              'Adjusting and aligning the door for smooth operation',
              'Minor repairs to hinges, handles, and locks as needed'
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data':[
              'Replacement of major door components (available at an extra cost)',
              'Extensive door frame repairs',
            ]
          },
        ],
      },
      {
        'title': "Sliding Door Repairs",
        'rating': 4.5,
        'reviews': 1618,
        'price': 384,
        'description':
        "Struggling with a stuck or noisy sliding door? We’ll restore its smooth and effortless movement with expert repairs and adjustments.",
        'imagePath': "assets/images/Sliding-Door-Repair.jpeg",
        'serviceDetail':[
          {
            'header': 'What’s Included?',
            'data':[
              'Cleaning and realignment of the door track',
              'Roller repair or replacement for easy gliding',
              'Lubrication of the sliding mechanism for smooth operation'
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data':[
              'Replacement of the sliding door frame',
              'Glass repair or replacement',
            ]
          },
        ],
      },
      {
        'title': "Hinge Installation Services",
        'rating': 4.5,
        'reviews': 1618,
        'price': 384,
        'description':
        "Ensure your doors open and close effortlessly with our professional hinge installation service, providing stability and smooth movement.",
        'imagePath': "assets/images/Door-Hinge.jpeg",
        'serviceDetail':[
          {
            'header': 'What’s Included?',
            'data':[
              'Removal of old hinges (if applicable) ',
              'Precise installation of new hinges with proper alignment',
              'Adjustments for seamless door operation'
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data':[
              'Cost of new hinges (to be provided by the customer or arranged separately)',
              'Major modifications to the door',
            ]
          },
        ],
      },
      {
        'title': "Professional Door Installation",
        'rating': 4.5,
        'reviews': 1618,
        'price': 824,
        'description':
        "Upgrade your space with our expert door installation, ensuring a perfect fit and seamless functionality.",
        'imagePath': "assets/images/Door-Installation.jpeg",
        'serviceDetail':[
          {
            'header': 'What’s Included?',
            'data':[
              'Accurate placement and alignment of the new door',
              'Installation of hinges and primary lock (if provided)',
              'Fine-tuning for smooth and effortless operation'
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data':[
              'Cost of the door and frame (to be supplied by the customer or arranged separately)',
              'Finishing or painting of the door',
            ]
          },
        ],
      },
      {
        'title': "Door Closer Setup",
        'rating': 4.5,
        'reviews': 1618,
        'price': 219,
        'description':
        "Ensure smooth, automatic door closing with our professional installation—perfect for entryways and busy areas.",
        'imagePath': "assets/images/Door-Closer.jpeg",
        'serviceDetail':[
          {
            'header': 'What’s Included?',
            'data':[
              'Secure installation of the door closer (supplied by the customer or arranged separately)',
              'Adjustment of speed and tension for optimal performance',
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data':[
              'Cost of the door closer',
              'Modifications to the door frame',
            ]
          },
        ],
      },
      {
        'title': "Mesh Grill Door Installation & Replacement Service",
        'rating': 4.5,
        'reviews': 1618,
        'price': 494,
        'description':
        "Enhance security and airflow with our expert mesh grill door installation or replacement service.",
        'imagePath': "assets/images/Mesh-Grill.jpeg",
        'serviceDetail':[
          {
            'header': 'What’s Included?',
            'data':[
              'Removal of the old mesh grill door (if applicable)',
              'Precise installation of the new mesh grill door with alignment check',
              'Minor adjustments for a perfect fit'
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data':[
              'Cost of the new mesh grill door',
              'Painting or finishing services',
            ]
          },
        ],
      },
      {
        'title': "Latch Installation Services",
        'rating': 4.5,
        'reviews': 1618,
        'price': 219,
        'description':
        "Boost the security of your doors with our expert latch installation, perfect for both interior and exterior doors.",
        'imagePath': "assets/images/Door-Latch.jpeg",
        'serviceDetail':[
          {
            'header': 'What’s Included?',
            'data':[
              'Professional installation of the door latch',
              'Adjustment and testing for secure functionality',
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data':[
              'Cost of the latch (to be supplied by the customer or arranged separately)',
              'Modifications for non-standard door latches',
            ]
          },
        ],
      },
    ]
  },
  {
    'category': "Window and Curtains",
    'id': 2,
    'imagePath': "assets/images/Window-Curtain-Red.jpeg",
    'data': [
      {
        'title': "Curtain Rod Installation Service",
        'rating': 4.5,
        'reviews': 1566,
        'price': 219,
        'description':
        "Transform your space with our professional curtain rod installation service, ensuring a secure and stylish setup for your curtains.",
        'imagePath': "assets/images/Curtain-Rod.jpeg",
        'serviceDetail':[
          {
            'header': 'What’s Included?',
            'data':[
              'Precise measurement and alignment for optimal curtain rod placement',
              'Installation of brackets and curtain rod',
              'Basic adjustments for proper support and alignment'
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data':[
              'Cost of curtain rod and mounting hardware',
              'Wall repairs or reinforcements for non-standard installations',
            ]
          },
        ],
      },
      {
        'title': "Professional Window Grill Installation",
        'rating': 4.5,
        'reviews': 1566,
        'price': 219,
        'description':
        "Enhance both the security and aesthetic of your windows with our expert window grill installation service.",
        'imagePath': "assets/images/Window-Grill.jpeg",
        'serviceDetail':[
          {
            'header': 'What’s Included?',
            'data':[
              'Accurate measurement and alignment for proper grill placement',
              'Secure installation of window grills',
              'Stability check and alignment adjustments for maximum safety'
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data':[
              'Cost of the window grill (to be provided by the customer or arranged separately)',
              'Extensive structural modifications or reinforcements',
            ]
          },
        ],
      },
      {
        'title': "Window Hinge Fitting",
        'rating': 4.5,
        'reviews': 1566,
        'price': 274,
        'description':
        "Ensure smooth and stable window operation with our professional window hinge installation, perfect for new installations or replacements.",
        'imagePath': "assets/images/Window-Hinge.jpeg",
        'serviceDetail':[
          {
            'header': 'What’s Included?',
            'data':[
              'Removal of old hinges (if applicable)',
              'Installation of new hinges with precise alignment',
              'Testing for smooth opening and closing'
            ]
          },
          {
            'header': 'What’s Not Included?',
            'data':[
              'Cost of the hinges (to be provided by the customer or arranged separately)',
              'Window frame repairs beyond hinge installation',
            ]
          },
        ],
      },
      {
        'title': "Curtain Blinds Repair & Maintenance",
        'rating': 4.5,
        'reviews': 1566,
        'price': 200,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Curtain-Blinds.jpeg",
        'serviceDetail':[
          {
            'header': 'Whats included',
            'data':[
              'Our partner will visit your home to assess the issue with your curtain blinds.',
              'After the diagnosis, we’ll provide you with a detailed estimate for the necessary repairs.',
              'If spare parts are needed, our partner will handle the procurement, which will be billed separately.',
              'The entire repair process will be managed by our partner, ensuring all necessary work is completed efficiently.',
              'Once the service is done, a thorough clean-up will be carried out to ensure your space is spotless.',
            ]
          },
        ],
      },
      {
        'title': "Installation of Curtain Rod with Dual Brackets",
        'rating': 4.5,
        'reviews': 1566,
        'price': 142,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Curtain-Rods.jpeg",
        'serviceDetail':[
          {
            'header': 'Whats included',
            'data':[
              'Our partner will visit your home to assess the issue with your curtain blinds.',
              'After the diagnosis, we’ll provide you with a detailed estimate for the necessary repairs.',
              'If spare parts are needed, our partner will handle the procurement, which will be billed separately.',
              'The entire repair process will be managed by our partner, ensuring all necessary work is completed efficiently.',
              'Once the service is done, a thorough clean-up will be carried out to ensure your space is spotless.',
            ]
          }
        ],
      },
      {
        'title': "Shower Curtain Rod Installation with Two Brackets",
        'rating': 4.5,
        'reviews': 1566,
        'price': 153,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Shower-Curtain.jpeg",
        'serviceDetail':[
          {
            'header': 'Whats included',
            'data':[
              'Our partner will visit your home to assess the issue with your curtain blinds.',
              'After the diagnosis, we’ll provide you with a detailed estimate for the necessary repairs.',
              'If spare parts are needed, our partner will handle the procurement, which will be billed separately.',
              'The entire repair process will be managed by our partner, ensuring all necessary work is completed efficiently.',
              'Once the service is done, a thorough clean-up will be carried out to ensure your space is spotless.',
            ]
          }
        ],
      },
      {
        'title': "Installation of Motorized Blinds (Up to 5 Feet)",
        'rating': 4.5,
        'reviews': 1566,
        'price': 230,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Motorized-Blinds.jpeg",
        'serviceDetail':[
          {
            'header': 'Whats included',
            'data':[
              'Our partner will visit your home to assess the issue with your curtain blinds.',
              'After the diagnosis, we’ll provide you with a detailed estimate for the necessary repairs.',
              'If spare parts are needed, our partner will handle the procurement, which will be billed separately.',
              'The entire repair process will be managed by our partner, ensuring all necessary work is completed efficiently.',
              'Once the service is done, a thorough clean-up will be carried out to ensure your space is spotless.',
            ]
          }
        ],
      },
      {
        'title': "Installation Non-Motorized Blinds (up to 5 ft)",
        'rating': 4.5,
        'reviews': 1566,
        'price': 175,
        'description':
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        'imagePath': "assets/images/Non-Motorized.jpeg",
        'serviceDetail':[
          {
            'header': 'Whats included',
            'data':[
              'Our partner will visit your home to assess the issue with your curtain blinds.',
              'After the diagnosis, we’ll provide you with a detailed estimate for the necessary repairs.',
              'If spare parts are needed, our partner will handle the procurement, which will be billed separately.',
              'The entire repair process will be managed by our partner, ensuring all necessary work is completed efficiently.',
              'Once the service is done, a thorough clean-up will be carried out to ensure your space is spotless.',
            ]
          }
        ],
      },
    ]
  },
  {
    "category": "Bed",
    "id": 3,
    "imagePath": "assets/images/RED-Wood-Bed.jpeg",
    "data": [
      {
        "title": "Bed Frame Support Restoration Service",
        "rating": 4.5,
        "reviews": 1618,
        "price": 219,
        "description":
        "Our Bed Support Repair Service focuses on restoring the strength and stability of your bed's foundation, providing improved comfort and extending the lifespan of your bed. This service is perfect for addressing issues like sagging or damaged support structures.",
        "imagePath": "assets/images/Bed-Support-Frame.jpeg",
        "serviceDetail":[
          {
            "header": "What’s Included:",
            "data":[
              "Thorough inspection of the bed support structure",
              "Reinforcement or repair of weakened or broken support slats",
              "Replacement of damaged support beams (if provided by the customer)"
            ]
          },
          {
            "header": "What’s Not Included:",
            "data":[
              "Cost of replacement parts (additional charges may apply, or parts can be provided by the customer)",
              "Repairs to non-structural components (such as headboards or side rails)",
            ]
          },
        ],
      },
      {
        "title": "Bed Leg Stabilization Service",
        "rating": 4.5,
        "reviews": 1618,
        "price": 219,
        "description":
        "Our Bed Leg Stabilization Service ensures your bed remains sturdy and balanced by addressing issues with loose, damaged, or missing bed legs. This service is ideal for restoring the bed's stability and overall safety.",
        "imagePath": "assets/images/Bed-Legs.jpeg",
        "serviceDetail":[
          {
            "header": "What’s Included:",
            "data":[
              "Inspection and tightening of loose bed legs",
              "Repair or replacement of damaged legs (if parts are provided by the customer)",
              "Adjustment for proper balance and alignment"
            ]
          },
          {
            "header": "What’s Not Included:",
            "data":[
              "Cost of new legs (if needed, parts can be provided by the customer or arranged separately)",
              "Structural repairs beyond the bed legs",
            ]
          },
        ],
      },
      {
        "title": "Headboard Restoration",
        "rating": 4.5,
        "reviews": 1618,
        "price": 219,
        "description":
        "Our Bed Headboard Repair Service is designed to restore both the appearance and stability of your headboard, tackling issues like loose fittings, scratches, and structural damage to enhance both the aesthetic and comfort of your bed.",
        "imagePath": "assets/images/Bed-HeadBoard.jpeg",
        "serviceDetail":[
          {
            "header": "What’s Included:",
            "data":[
              "Repair or reattachment of loose headboard",
              "Fixing minor scratches and cosmetic damage",
              "Tightening or reinforcing headboard supports"
            ]
          },
          {
            "header": "What’s Not Included:",
            "data":[
              "Cost of replacement materials (for extensive damage, if required)",
              "Upholstery work for fabric-covered headboards (available for an additional charge)",
            ]
          },
        ],
      },
    ]
  },
  {
    "category": "Drill And Hang",
    "id": 3,
    "imagePath": "assets/images/Red-Drill.jpeg",
    "data": [
      {
        "title": "Drilling and Mounting Services",
        "rating": 4.5,
        "reviews": 1618,
        "price": 54,
        "description":
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        "imagePath": "assets/images/Drill-Mounting.jpeg",
        "serviceDetail":[
          {
            "header": "Whats included",
            "data":[
              "Our partner will visit your home to assess the issue with your curtain blinds.",
              "After the diagnosis, we’ll provide you with a detailed estimate for the necessary repairs.",
              "If spare parts are needed, our partner will handle the procurement, which will be billed separately.",
              "The entire repair process will be managed by our partner, ensuring all necessary work is completed efficiently.",
              "Once the service is done, a thorough clean-up will be carried out to ensure your space is spotless."
            ]
          }
        ],
      },
      {
        "title": "Bathroom Holder and Hanger Installations",
        "rating": 4.5,
        "reviews": 1618,
        "price": 76,
        "description":
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        "imagePath": "assets/images/Holder-Hanger.jpeg",
        "serviceDetail":[
          {
            "header": "Whats included",
            "data":[
              "Our partner will visit your home to assess the issue with your curtain blinds.",
              "After the diagnosis, we’ll provide you with a detailed estimate for the necessary repairs.",
              "If spare parts are needed, our partner will handle the procurement, which will be billed separately.",
              "The entire repair process will be managed by our partner, ensuring all necessary work is completed efficiently.",
              "Once the service is done, a thorough clean-up will be carried out to ensure your space is spotless."
            ]
          }
        ],
      },
      {
        "title": "Wall Decor Mounting",
        "rating": 4.5,
        "reviews": 1618,
        "price": 87,
        "description":
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        "imagePath": "assets/images/Wall-Decor-Mounting.jpeg",
        "serviceDetail":[
          {
            "header": "Whats included",
            "data":[
              "Our partner will visit your home to assess the issue with your curtain blinds.",
              "After the diagnosis, we’ll provide you with a detailed estimate for the necessary repairs.",
              "If spare parts are needed, our partner will handle the procurement, which will be billed separately.",
              "The entire repair process will be managed by our partner, ensuring all necessary work is completed efficiently.",
              "Once the service is done, a thorough clean-up will be carried out to ensure your space is spotless."
            ]
          }
        ],
      },
      {
        "title": "Bathroom Mirror Setup",
        "rating": 4.5,
        "reviews": 1618,
        "price": 87,
        "description":
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        "imagePath": "assets/images/Bathroom-Mirror.jpeg",
        "serviceDetail":[
          {
            "header": "Whats included",
            "data":[
              "Our partner will visit your home to assess the issue with your curtain blinds.",
              "After the diagnosis, we’ll provide you with a detailed estimate for the necessary repairs.",
              "If spare parts are needed, our partner will handle the procurement, which will be billed separately.",
              "The entire repair process will be managed by our partner, ensuring all necessary work is completed efficiently.",
              "Once the service is done, a thorough clean-up will be carried out to ensure your space is spotless."
            ]
          }
        ],
      },
      {
        "title": "Glass Shelf Mounting",
        "rating": 4.5,
        "reviews": 1618,
        "price": 98,
        "description":
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        "imagePath": "assets/images/Glass-Shelving.jpeg",
        "serviceDetail":[
          {
            "header": "Whats included",
            "data":[
              "Our partner will visit your home to assess the issue with your curtain blinds.",
              "After the diagnosis, we’ll provide you with a detailed estimate for the necessary repairs.",
              "If spare parts are needed, our partner will handle the procurement, which will be billed separately.",
              "The entire repair process will be managed by our partner, ensuring all necessary work is completed efficiently.",
              "Once the service is done, a thorough clean-up will be carried out to ensure your space is spotless."
            ]
          }
        ],
      },
      {
        "title": "Wooden Shelf Setup",
        "rating": 4.5,
        "reviews": 1618,
        "price": 197,
        "description":
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        "imagePath": "assets/images/Wooden-Shelf.jpeg",
        "serviceDetail":[
          {
            "header": "Whats included",
            "data":[
              "Our partner will visit your home to assess the issue with your curtain blinds.",
              "After the diagnosis, we’ll provide you with a detailed estimate for the necessary repairs.",
              "If spare parts are needed, our partner will handle the procurement, which will be billed separately.",
              "The entire repair process will be managed by our partner, ensuring all necessary work is completed efficiently.",
              "Once the service is done, a thorough clean-up will be carried out to ensure your space is spotless."
            ]
          }
        ],
      },
      {
        "title": "Corner Guard and Safety Lock Installation",
        "rating": 4.5,
        "reviews": 1618,
        "price": 329,
        "description":
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        "imagePath": "assets/images/Corner-Guard.jpeg",
        "serviceDetail":[
          {
            "header": "Whats included",
            "data":[
              "Our partner will visit your home to assess the issue with your curtain blinds.",
              "After the diagnosis, we’ll provide you with a detailed estimate for the necessary repairs.",
              "If spare parts are needed, our partner will handle the procurement, which will be billed separately.",
              "The entire repair process will be managed by our partner, ensuring all necessary work is completed efficiently.",
              "Once the service is done, a thorough clean-up will be carried out to ensure your space is spotless."
            ]
          }
        ],
      },
      {
        "title": "Bed Fence Installation",
        "rating": 4.5,
        "reviews": 1618,
        "price": 329,
        "description":
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        "imagePath": "assets/images/Bed-Fence.jpeg",
        "serviceDetail":[
          {
            "header": "Whats included",
            "data":[
              "Our partner will visit your home to assess the issue with your curtain blinds.",
              "After the diagnosis, we’ll provide you with a detailed estimate for the necessary repairs.",
              "If spare parts are needed, our partner will handle the procurement, which will be billed separately.",
              "The entire repair process will be managed by our partner, ensuring all necessary work is completed efficiently.",
              "Once the service is done, a thorough clean-up will be carried out to ensure your space is spotless."
            ]
          }
        ],
      },
      {
        "title": "Safety Gate Installation",
        "rating": 4.5,
        "reviews": 1618,
        "price": 769,
        "description":
        "Regular upkeep of unfurnished spaces; includes sweeping, mopping, dusting, and surface cleaning",
        "imagePath": "assets/images/Safty-Gate-Door.jpeg",
        "serviceDetail":[
          {
            "header": "Whats included",
            "data":[
              "Our partner will visit your home to assess the issue with your curtain blinds.",
              "After the diagnosis, we’ll provide you with a detailed estimate for the necessary repairs.",
              "If spare parts are needed, our partner will handle the procurement, which will be billed separately.",
              "The entire repair process will be managed by our partner, ensuring all necessary work is completed efficiently.",
              "Once the service is done, a thorough clean-up will be carried out to ensure your space is spotless."
            ]
          }
        ],
      },
    ]
  },
  {
    "category": "Cabinets & Cupboards",
    "id": 4,
    "imagePath": "assets/images/Wooden-Red-Cabinet.jpeg",
    "data": [
      {
        "title": "Channel Repair for Cupboards",
        "rating": 4.5,
        "reviews": 1566,
        "price": 219,
        "description":
        "Our Cupboard Channel Repair Service ensures the smooth and effortless operation of sliding or pull-out channels, perfect for cupboards with jammed or malfunctioning drawers and sliding mechanisms.",
        "imagePath": "assets/images/Channel.jpeg",
        "serviceDetail":[
          {
            "header": "What’s Included:",
            "data":[
              "Inspection of cupboard channels for wear and damage",
              "Minor repairs and adjustments to restore smooth movement",
              "Lubrication and alignment for optimal performance"
            ]
          },
          {
            "header": "What’s Not Included:",
            "data":[
              "Replacement of channels (available as a separate service if needed)",
              "Major structural repairs to the cupboard or drawers",
            ]
          },
        ],
      },
      {
        "title": "Channel Replacement for Cupboards",
        "rating": 4.5,
        "reviews": 1566,
        "price": 274,
        "description":
        "Our Cupboard Channel Replacement Service replaces worn-out or broken channels, ensuring your drawers and sliding panels glide smoothly and securely.",
        "imagePath": "assets/images/Channel-Repair.jpeg",
        "serviceDetail":[
          {
            "header": "What’s Included:",
            "data":[
              "Removal of old or damaged channels",
              "Installation of new channels (provided by the customer or arranged separately)",
              "Alignment and testing to ensure smooth functionality"
            ]
          },
          {
            "header": "What’s Not Included:",
            "data":[
              "Cost of new channels (can be provided by the customer or arranged separately)",
              "Additional adjustments to the cupboard frame or structure",
            ]
          },
        ],
      },
      {
        "title": "Hinge Installation for Cupboards",
        "rating": 4.5,
        "reviews": 1566,
        "price": 219,
        "description":
        "Our Cupboard Hinge Installation Service guarantees that your cupboard doors are securely mounted and aligned for smooth and easy operation.",
        "imagePath": "assets/images/Cabinet-Hinges.jpeg",
        "serviceDetail":[
          {
            "header": "What’s Included:",
            "data":[
              "Installation of new hinges (provided by the customer or arranged separately)",
              "Alignment and adjustment to ensure proper door movement",
              "Tightening and securing of hinge screws"
            ]
          },
          {
            "header": "What’s Not Included:",
            "data":[
              "Cost of new hinges",
              "Structural modifications to the cupboard door or frame",
            ]
          },
        ],
      },
      {
        "title": "Lock Repair for Cupboards",
        "rating": 4.5,
        "reviews": 1566,
        "price": 274,
        "description":
        "Our Cupboard Lock Replacement Service ensures the secure and efficient replacement of old or damaged locks, enhancing the safety and functionality of your storage spaces.",
        "imagePath": "assets/images/Lock-Cupboards.jpeg",
        "serviceDetail":[
          {
            "header": "What’s Included:",
            "data":[
              "Removal of the existing lock",
              "Installation of a new lock (provided by the customer or arranged separately)",
              "Alignment and testing to ensure proper operation"
            ]
          },
          {
            "header": "What’s Not Included:",
            "data":[
              "Cost of the new lock",
              "Structural modifications to fit a different lock size or style",
            ]
          },
        ],
      },
      {
        "title": "Lock Replacement for Cupboards",
        "rating": 4.5,
        "reviews": 1566,
        "price": 329,
        "description":
        "Our Cupboard Lock Replacement Service ensures your storage spaces are more secure by replacing old or damaged locks, enhancing both safety and functionality.",
        "imagePath": "assets/images/Lock-Replacment.jpeg",
        "serviceDetail":[
          {
            "header": "What’s Included:",
            "data":[
              "Removal of the old lock",
              "Installation of a new lock (either provided by the customer or arranged separately)",
              "Alignment and testing to ensure smooth operation"
            ]
          },
          {
            "header": "What’s Not Included:",
            "data":[
              "Cost of the new lock",
              "Any structural adjustments needed to accommodate a different lock size or style",
            ]
          },
        ],
      },
      {
        "title": "Lock Installation for Cupboards",
        "rating": 4.5,
        "reviews": 1566,
        "price": 274,
        "description":
        "Our Cupboard Lock Installation Service provides expert installation of new locks in cupboards without existing lock mechanisms, ensuring enhanced security for your valuable or sensitive items.",
        "imagePath": "assets/images/Lock-Replacement.jpeg",
        "serviceDetail":[
          {
            "header": "What’s Included:",
            "data":[
              "Installation of a new lock in pre-drilled or standard cupboard doors",
              "Alignment and adjustment for a secure and reliable lock",
              "Functional testing after installation to ensure proper operation"
            ]
          },
          {
            "header": "What’s Not Included:",
            "data":[
              "Cost of the lock",
              "Modifications for custom or oversized locks",
            ]
          },
        ],
      },
    ]
  },
  {
    'category': "Shelving & Storage",
    'id': 5,
    'imagePath': "assets/images/Red-Shelving.jpeg",
    'data': [
      {
        'title': "Glass Shelf Mounting",
        'rating': 4.5,
        'reviews': 1618,
        'price': 274,
        'description':
        "Our Glass Shelf Installation Service ensures secure, stylish placement of glass shelves, adding both functional storage and an aesthetic touch to your space. We provide precise installation to safely support various items and enhance your room’s look.",
        'imagePath': "assets/images/Glass-Shelving.jpeg",
        'serviceDetail':[
          {
            'header': 'What’s Included:',
            'data':[
              'Accurate measurement and alignment for optimal shelf placement',
              'Installation of mounting brackets and secure attachment of the glass shelf',
              'Basic cleaning and safety check after installation'
            ]
          },
          {
            'header': 'What’s Not Included:',
            'data':[
              'Cost of the glass shelf and mounting hardware (can be provided by the customer or arranged separately)',
              'Wall reinforcements for non-standard or heavy-duty installations',
            ]
          }
        ],
      },
      {
        'title': "Custom Wooden Shelf Installation",
        'rating': 4.5,
        'reviews': 1618,
        'price': 329,
        'description':
        "Our Custom Storage Shelf Installation Service offers personalized solutions to meet your unique storage needs, whether it’s open shelving, corner units, or specialized configurations. We provide flexible design options to help you maximize your available space.",
        'imagePath': "assets/images/Wooden-Shelf.jpeg",
        'serviceDetail':[
          {
            'header': 'What’s Included:',
            'data':[
              'Accurate measurement and alignment for optimal shelf positioning',
              'Installation of mounting brackets and secure attachment of the wooden shelf',
              'Stability check and adjustments to ensure the shelf supports the intended weight'
            ]
          },
          {
            'header': 'What’s Not Included:',
            'data':[
              'Cost of the wooden shelf and mounting brackets (can be provided by the customer or arranged separately)',
              'Reinforcement for weak walls or heavy-load requirements',
            ]
          },
        ],
      },
      {
        'title': "Tailored Shelf Installation for Custom Storage Solutions",
        'rating': 4.5,
        'reviews': 1618,
        'price': 200,
        'description':
        "Our Custom Storage Shelf Installation Service offers personalized solutions to meet your unique storage needs, whether it’s open shelving, corner units, or specialized configurations. We provide flexible design options to help you maximize your available space.",
        'imagePath': "assets/images/Custom-Storage.jpeg",
        'serviceDetail':[
          {
            'header': 'What’s Included:',
            'data':[
              'Consultation on placement and design for the best use of your space',
              'Installation of custom or pre-fabricated shelves with secure mounting',
              'Alignment adjustments to ensure stability and optimal functionality'
            ]
          },
          {
            'header': 'What’s Not Included:',
            'data':[
              'Custom-made shelves (can be arranged separately if needed)',
              'Structural modifications for heavy-duty or oversized installations',
            ]
          },
        ],
      },
    ]
  },
  {
    'category': "Carpenter Consultation",
    'id': 6,
    'imagePath': "assets/images/Red-Drill.jpeg",
    'data': [
      {
        'title': "General Carpenter Consultation",
        'rating': 4.5,
        'reviews': 1566,
        'price': 200,
        'description':
        "Looking to get custom furniture or need a carpentry fix? Book a consultation with our expert carpenters at GharKaSathi! Whether it's designing unique pieces or repairing old ones, our skilled team is here to bring your vision to life. Click to schedule your consultation now!",
        'imagePath': "assets/images/Door-Main.jpeg",
        'serviceDetail':[
          {
            'header': 'Key Features',
            'data':[
              'djdfjkf',
              'gtdfhf',
              '1223123'
            ]
          }
        ],
      },
    ]
  },
];

class CarpenterDetailsScreen extends StatefulWidget {
  static String tag = '/Carpenter';
  final String? serviceType;

  const CarpenterDetailsScreen({Key? key, this.serviceType}) : super(key: key);

  @override
  State<CarpenterDetailsScreen> createState() => _CarpenterDetailsScreenState();
}

class _CarpenterDetailsScreenState extends State<CarpenterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseServiceScreen(
      title: "Carpenter Services",
      serviceType: widget.serviceType,
      services: services, // Use the predefined services list
      serviceTypeList: ['Replacement', 'Installation', 'Repair'],
      serviceSubTypeList: ['Residential', 'Commercial'],
    );
  }
}
