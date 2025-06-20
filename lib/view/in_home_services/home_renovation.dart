import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/view/in_home_services/base_service_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:itq_utils/itq_utils.dart';

import 'cleaning_details_screen.dart';

/// Data for carpentry services
final List<Map<String, dynamic>> services = [
  {
    'category': "Complete Home Renovation",
    'id': 1,
    'imagePath': "assets/images/Red-Home-Renovation.jpeg",
    'data': [
      {
        'title': "Standard Home Renovation",
        'rating': 4.8,
        'reviews': 5,
        'price': 1100,
        'description':
            "Complete home renovation with quality materials and expert craftsmanship.",
        'imagePath': "assets/images/Home-Renovation-1.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Comprehensive home renovation solution',
              'Quality materials and professional workmanship',
              'Complete project management from start to finish'
            ]
          }
        ],
      },
      {
        'title': "Family Centric Renovation",
        'rating': 4.8,
        'reviews': 5,
        'price': 1540,
        'description':
            "Home renovation designed specifically for family needs and comfort.",
        'imagePath': "assets/images/Happy-Family-Renovation.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Family-friendly design considerations',
              'Child-safe materials and features',
              'Functional spaces for all family members'
            ]
          }
        ],
      },
      {
        'title': "Contemporary Home Makeover",
        'rating': 4.8,
        'reviews': 5,
        'price': 1980,
        'description':
            "Modern design and renovation to transform your home with contemporary style.",
        'imagePath': "assets/images/Home-Renovation-3.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Contemporary design elements',
              'Modern materials and finishes',
              'Sleek and stylish transformations'
            ]
          }
        ],
      },
      {
        'title': "Luxury Home Overhaul",
        'rating': 4.8,
        'reviews': 5,
        'price': 2750,
        'description':
            "Premium home renovation with high-end materials and luxury finishes.",
        'imagePath': "assets/images/Home-Renovation-4.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Premium materials and luxury finishes',
              'High-end appliances and fixtures',
              'Custom design elements and craftsmanship'
            ]
          }
        ],
      },
      {
        'title': "Investment Property Enhancement",
        'rating': 4.8,
        'reviews': 5,
        'price': 880,
        'description':
            "Cost-effective renovation solutions to increase property value for investors.",
        'imagePath': "assets/images/Home-Renovation-5.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Cost-effective renovation solutions',
              'Value-adding improvements',
              'Durable materials for rental properties'
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Exterior Renovation",
    'id': 2,
    'imagePath': "assets/images/Red-Exterior-Renovation.jpeg",
    'data': [
      {
        'title': "Basic Exterior Upgrade",
        'rating': 4.8,
        'reviews': 5,
        'price': 110,
        'description':
            "Essential exterior renovation to refresh your home's curb appeal.",
        'imagePath': "assets/images/Home-Renovation-6.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Fresh exterior paint and finishes',
              'Basic landscaping improvements',
              'Repair of visible exterior damage'
            ]
          }
        ],
      },
      {
        'title': "Comprehensive Exterior Revamp",
        'rating': 4.8,
        'reviews': 5,
        'price': 330,
        'description':
            "Complete exterior transformation with structural and aesthetic improvements.",
        'imagePath': "assets/images/Home-Renovation-7.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Siding repair or replacement',
              'Window and door upgrades',
              'Enhanced landscaping and hardscaping'
            ]
          }
        ],
      },
      {
        'title': "Premium Exterior Transformation",
        'rating': 4.8,
        'reviews': 5,
        'price': 660,
        'description':
            "Luxury exterior renovation with high-end materials and custom features.",
        'imagePath': "assets/images/Home-Renovation-8.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Custom exterior architectural elements',
              'Premium materials and finishes',
              'Designer landscaping and outdoor living spaces'
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Structural Renovation",
    'id': 3,
    'imagePath': "assets/images/Renovation-3.jpeg",
    'data': [
      {
        'title': "Foundation Stabilization & Repair",
        'rating': 4.8,
        'reviews': 5,
        'price': 550,
        'description':
            "Expert foundation repair and stabilization for structural integrity.",
        'imagePath': "assets/images/Home-Renovation-9.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Foundation assessment and repair',
              'Stabilization of settling or shifting foundations',
              'Waterproofing and drainage solutions'
            ]
          }
        ],
      },
      {
        'title': "Structural Strengthening & Reinforcement",
        'rating': 4.8,
        'reviews': 5,
        'price': 880,
        'description':
            "Comprehensive structural reinforcement for older or damaged homes.",
        'imagePath': "assets/images/Home-Renovation-10.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Beam and joist reinforcement',
              'Wall and floor structural improvements',
              'Seismic retrofitting (where applicable)'
            ]
          }
        ],
      },
      {
        'title': "Customized Structural Modifications",
        'rating': 4.8,
        'reviews': 5,
        'price': 1430,
        'description':
            "Tailored structural changes to reconfigure spaces and improve functionality.",
        'imagePath': "assets/images/Home-Renovation-11.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Wall removal for open floor plans',
              'Room additions and extensions',
              'Custom architectural modifications'
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Room Specific Renovation",
    'id': 4,
    'imagePath': "assets/images/Red-Specfic-Renovation.jpeg",
    'data': [
      {
        'title': "Living Room Redesign",
        'rating': 4.8,
        'reviews': 5,
        'price': 770,
        'description':
            "Complete living room transformation for style and comfort.",
        'imagePath': "assets/images/Home-Renovation-12.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Updated flooring and wall treatments',
              'Lighting improvements and fixture upgrades',
              'Built-in features and custom storage solutions'
            ]
          }
        ],
      },
      {
        'title': "Bedroom Renovation",
        'rating': 4.8,
        'reviews': 5,
        'price': 770,
        'description':
            "Transform your bedroom into a peaceful retreat with custom features.",
        'imagePath': "assets/images/Home-Renovation-13.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Comfortable and functional layout design',
              'Custom closet and storage solutions',
              'Lighting and electrical upgrades'
            ]
          }
        ],
      },
      {
        'title': "Home Office Transformation",
        'rating': 4.8,
        'reviews': 5,
        'price': 770,
        'description': "Create a productive and comfortable home office space.",
        'imagePath': "assets/images/Home-Renovation-15.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Ergonomic workspace design',
              'Custom storage and organization solutions',
              'Proper lighting and technology integration'
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Bathroom Renovation",
    'id': 5,
    'imagePath': "assets/images/Red-Bathroom-Renovation.jpeg",
    'data': [
      {
        'title': "Smart Budget Makeover: Affordable Bathroom Upgrade",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Cost-effective bathroom renovation with quality fixtures and finishes.",
        'imagePath': "assets/images/Renovation-16.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Affordable fixture upgrades',
              'Basic tile and flooring improvements',
              'Fresh paint and lighting enhancements'
            ]
          }
        ],
      },
      {
        'title': "Smart Elegance: Mid-Range Bathroom Upgrade",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Enhanced bathroom renovation with quality materials and modern designs.",
        'imagePath': "assets/images/Renovation-17.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Modern fixture and vanity upgrades',
              'Premium tile and flooring options',
              'Custom storage solutions'
            ]
          }
        ],
      },
      {
        'title': "Luxury Escape: High-End Bathroom Redesign",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Luxurious bathroom transformation with premium features and spa-like amenities.",
        'imagePath': "assets/images/Renovation-18.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'High-end fixtures and fittings',
              'Luxury tile and stone materials',
              'Custom shower systems and spa features'
            ]
          }
        ],
      },
      {
        'title': "Budget Refresh: Affordable Shower & Tub Makeover",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Economical shower and tub renovation with quality materials.",
        'imagePath': "assets/images/Renovation-19.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Tub reglazing or replacement',
              'New shower fixtures and hardware',
              'Fresh caulking and waterproofing'
            ]
          }
        ],
      },
      {
        'title': "Smart Upgrade: Mid-Range Shower & Tub Transformation",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Enhanced shower and tub remodel with quality features and modern design.",
        'imagePath': "assets/images/Renovation-20.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Custom shower systems',
              'Premium tub options',
              'Quality tile and glass enclosures'
            ]
          }
        ],
      },
      {
        'title': "Luxury Escape: High-End Shower & Tub Redesign",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Luxury shower and tub renovation with premium materials and spa features.",
        'imagePath': "assets/images/Renovation-21.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Rainfall and body spray shower systems',
              'Soaking or jetted tubs',
              'Custom glass and stone work'
            ]
          }
        ],
      },
      {
        'title': "Budget Fix: Affordable Plumbing & Fixture Update",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description': "Cost-effective bathroom plumbing and fixture upgrades.",
        'imagePath': "assets/images/Renovation-22.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Basic fixture replacements',
              'Minor plumbing repairs',
              'Faucet and hardware updates'
            ]
          }
        ],
      },
      {
        'title': "Smart Upgrade: Mid-Range Plumbing & Fixture Transformation",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Quality plumbing and fixture upgrades with modern options.",
        'imagePath': "assets/images/Renovation-23.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Modern faucets and showerheads',
              'Water-efficient toilets and fixtures',
              'Quality valve and pipe upgrades'
            ]
          }
        ],
      },
      {
        'title': "High-End Plumbing & Fixture Redesign",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Premium bathroom plumbing and fixture renovation with luxury features.",
        'imagePath': "assets/images/Renovation-24.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Designer faucets and fixtures',
              'Smart plumbing technologies',
              'Luxury shower and bath systems'
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Kitchen Renovation",
    'id': 6,
    'imagePath': "assets/images/Red-Kitchen-Renovation.jpeg",
    'data': [
      {
        'title': "Smart Refresh: Essential Kitchen Upgrade",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Basic kitchen renovation with essential updates and improvements.",
        'imagePath': "assets/images/Renovation-25.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Cabinet refacing or painting',
              'New countertops and backsplash',
              'Updated fixtures and hardware'
            ]
          }
        ],
      },
      {
        'title': "Tailored Elegance: Lifestyle Kitchen Makeover",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Custom kitchen renovation tailored to your lifestyle and preferences.",
        'imagePath': "assets/images/Renovation-26.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Custom cabinet solutions',
              'Quality appliance upgrades',
              'Personalized layout improvements'
            ]
          }
        ],
      },
      {
        'title': "Elite Gourmet Kitchen Makeover",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "High-end kitchen renovation with premium materials and gourmet features.",
        'imagePath': "assets/images/Renovation-27.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Luxury cabinetry and finishes',
              'Professional-grade appliances',
              'Designer lighting and fixtures'
            ]
          }
        ],
      },
      {
        'title': "Effortless Kitchen Upgrade",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Quick and easy kitchen aesthetic improvements without major construction.",
        'imagePath': "assets/images/Renovation-28.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'New paint and hardware',
              'Simple backsplash updates',
              'Lighting and fixture improvements'
            ]
          }
        ],
      },
      {
        'title': "Tailor-Made Kitchen Upgrade",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Custom kitchen aesthetic enhancements designed for your taste and needs.",
        'imagePath': "assets/images/Renovation-29.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Custom color and finish selections',
              'Personalized storage solutions',
              'Tailored design elements'
            ]
          }
        ],
      },
      {
        'title': "Elite Kitchen Transformation",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Luxury kitchen aesthetic renovation with high-end finishes and details.",
        'imagePath': "assets/images/Renovation-30.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Premium finishes and materials',
              'Designer lighting and accessories',
              'Custom architectural details'
            ]
          }
        ],
      },
      {
        'title': "Effortless Countertop Revamp",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Affordable countertop replacement with quality materials.",
        'imagePath': "assets/images/Renovation-31.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Laminate or solid surface options',
              'New sink and faucet installation',
              'Basic edge profiles and finishes'
            ]
          }
        ],
      },
      {
        'title': "Stylish & Durable Countertop Upgrade",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Mid-range countertop renovation with quality stone or engineered materials.",
        'imagePath': "assets/images/Renovation-32.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Quartz or granite options',
              'Custom edge profiles',
              'Premium sink and faucet installation'
            ]
          }
        ],
      },
      {
        'title': "Elegant & Timeless Countertop Upgrade",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Luxury countertop installation with premium materials and custom features.",
        'imagePath': "assets/images/Renovation-33.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Premium natural stone selections',
              'Custom edge and finish details',
              'Designer sink and fixture integrations'
            ]
          }
        ],
      },
      {
        'title': "Affordable Kitchen Cabinet Makeover",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Budget-friendly cabinet renovation with quality updates.",
        'imagePath': "assets/images/Renovation-34.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Cabinet refacing or repainting',
              'New hardware and hinges',
              'Basic organizational improvements'
            ]
          }
        ],
      },
      {
        'title': "Mid-Range Kitchen Cabinet Upgrade",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Quality cabinet renovation with semi-custom options and improvements.",
        'imagePath': "assets/images/Renovation-35.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Semi-custom cabinet replacement',
              'Enhanced storage solutions',
              'Soft-close hardware and premium finishes'
            ]
          }
        ],
      },
      {
        'title': "Elite Custom Kitchen Cabinets",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Luxury custom cabinet installation with premium materials and features.",
        'imagePath': "assets/images/Renovation-36.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Fully custom cabinet design',
              'Premium materials and finishes',
              'Advanced organizational features'
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Waterproofing",
    'id': 7,
    'imagePath': "assets/images/Red-WaterProofing.jpeg",
    'data': [
      {
        'title': "Ultimate Roof & Terrace Protection",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Complete waterproofing solution for roofs and terraces.",
        'imagePath': "assets/images/Renovation-37.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Premium waterproofing membrane application',
              'Drainage improvements',
              'Sealing of cracks and vulnerable areas'
            ]
          }
        ],
      },
      {
        'title': "Ultimate Exterior Wall Protection",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Comprehensive exterior wall waterproofing to prevent water damage.",
        'imagePath': "assets/images/Renovation-38.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Exterior wall sealing and treatment',
              'Crack repair and filling',
              'Water-resistant coating application'
            ]
          }
        ],
      },
      {
        'title': "Interior Wall Waterproofing",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Effective moisture protection for interior walls and surfaces.",
        'imagePath': "assets/images/Renovation-39.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Interior waterproofing treatments',
              'Anti-dampness solutions',
              'Mold prevention measures'
            ]
          }
        ],
      },
      {
        'title': "Bathroom Leak-Proofing Solution",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Specialized waterproofing for bathroom floors, walls, and fixtures.",
        'imagePath': "assets/images/Renovation-40.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Shower and bath area sealing',
              'Tile and grout waterproofing',
              'Fixture and pipe leak prevention'
            ]
          }
        ],
      },
      {
        'title': "Water Tank & Sump Waterproofing Solution",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Professional waterproofing for water storage tanks and sump areas.",
        'imagePath': "assets/images/Renovation-41.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Food-grade waterproof coating for tanks',
              'Leak repair and prevention',
              'Sump pit and pump area protection'
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Fabrication",
    'id': 8,
    'imagePath': "assets/images/Red-fabrication.jpeg",
    'data': [
      {
        'title': "Steel Fabrication for Security & Safety",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Custom steel fabrication for gates, grills, and security features.",
        'imagePath': "assets/images/Renovation-42.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Custom security gates and grills',
              'Safety railings and barriers',
              'Durable steel fabrication with protective finishes'
            ]
          }
        ],
      },
      {
        'title': "Artistic & Decorative Steel Fabrication",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Decorative steel work with artistic designs for home enhancement.",
        'imagePath': "assets/images/Renovation-43.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Custom decorative railings and gates',
              'Ornamental steel features',
              'Artistic metalwork with premium finishes'
            ]
          }
        ],
      },
      {
        'title': "Steel Carports & Garage Frame Solutions",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Sturdy steel structures for vehicle protection and storage.",
        'imagePath': "assets/images/Renovation-44.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Custom carport designs and sizes',
              'Durable garage framing solutions',
              'Weather-resistant steel structures'
            ]
          }
        ],
      },
      {
        'title': "Tailor-Made Steel Furniture Fabrication",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Custom steel furniture designed for your specific needs and style.",
        'imagePath': "assets/images/Renovation-45.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Custom tables, chairs, and shelving',
              'Indoor and outdoor steel furniture',
              'Modern or industrial design options'
            ]
          }
        ],
      },
      {
        'title': "Premium Custom Glass Door Solutions",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description': "High-quality glass door fabrication and installation.",
        'imagePath': "assets/images/Renovation-46.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Custom glass door designs',
              'Tempered or laminated safety glass options',
              'Premium hardware and framing'
            ]
          }
        ],
      },
      {
        'title': "Exquisite Window Solutions: Crafted for Style & Efficiency",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Custom glass window fabrication with energy-efficient options.",
        'imagePath': "assets/images/Renovation-47.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Custom window designs and sizes',
              'Energy-efficient glass options',
              'Quality framing and hardware'
            ]
          }
        ],
      },
      {
        'title': "Modern Glass Partition & Wall Systems",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Sleek glass partitions for elegant space division and design.",
        'imagePath': "assets/images/Renovation-48.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Custom glass partition designs',
              'Frameless or minimally framed options',
              'Privacy and decorative glass choices'
            ]
          }
        ],
      },
      {
        'title': "Contemporary Glass Balustrade & Railing Systems",
        'rating': 4,
        'reviews': 5,
        'price': 1500,
        'description':
            "Modern glass railing systems for staircases, balconies, and terraces.",
        'imagePath': "assets/images/Renovation-49.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Custom glass balustrade design',
              'Tempered or laminated safety glass',
              'Premium hardware and mounting systems'
            ]
          }
        ],
      },
      {
        'title': "Luminous Roof Innovations: Custom Skylights & Roof Windows",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Custom skylight and roof window solutions for natural lighting.",
        'imagePath': "assets/images/Renovation-50.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Custom skylight design and installation',
              'Energy-efficient glass options',
              'Weatherproof sealing and insulation'
            ]
          }
        ],
      },
      {
        'title': "Reflective Elegance: Custom Mirror Crafting & Installation",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Custom mirror solutions for home enhancement and decoration.",
        'imagePath': "assets/images/Renovation-51.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Custom mirror sizes and shapes',
              'Decorative edge and finish options',
              'Secure mounting and installation'
            ]
          }
        ],
      },
      {
        'title': "Contemporary Glass Backsplash & Countertop Solutions",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Modern glass surfaces for kitchen and bathroom enhancements.",
        'imagePath': "assets/images/Renovation-52.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Custom glass backsplash designs',
              'Tempered glass countertop options',
              'Color and texture customization'
            ]
          }
        ],
      },
      {
        'title': "Glass Restoration & Replacement Solutions",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Professional glass repair, restoration, and replacement services.",
        'imagePath': "assets/images/Renovation-53.jpeg",
        'serviceDetail': [
          {
            'header': 'Key Features',
            'data': [
              'Glass repair and chip correction',
              'Foggy window restoration',
              'Complete glass replacement services'
            ]
          }
        ],
      },
    ]
  },
];

class HomeRenovation extends StatefulWidget {
  static String tag = '/HomeRenovation';
  final String? serviceType;
  HomeRenovation({super.key, this.serviceType});

  @override
  State<HomeRenovation> createState() => _HomeRenovationState();
}

class _HomeRenovationState extends State<HomeRenovation> {

  @override
  Widget build(BuildContext context) {
    return BaseServiceScreen(
      title: "Home Renovation",
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
  //     // extendBody: true,
  //     backgroundColor: Colors.white,
  //     appBar: AppBar(
  //       title: const Text(
  //         "Home Renovation",
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
