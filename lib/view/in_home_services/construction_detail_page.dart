import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:ghar_ka_sathi/view/in_home_services/base_service_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/cleaning_details_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/constant.dart';
import 'package:itq_utils/itq_utils.dart';

/// Data for carpentry services
final List<Map<String, dynamic>> services = [
  {
    'category': "Turnkey Project",
    'id': 1,
    'imagePath': "assets/images/Trunkey-Project.jpeg",
    'data': [
      {
        'title': "Affordable Turnkey Home Construction",
        'rating': 4.8,
        'reviews': 5,
        'price': 1400,
        'description':
            "At GharKaSathi, we offer a comprehensive, cost-effective turnkey solution for building your ideal home. Our Budget-Friendly Turnkey Home Construction ensures that every aspect of the project, from design to handover, is managed with precision, keeping your budget and timeline in mind. We provide a seamless experience, delivering a fully finished, high-quality home ready for immediate occupancy.",
        'imagePath': "assets/images/Trunkey-2.jpeg",
        'serviceDetail': [
          {'header': 'Key Features', 'data': []},
          {
            'header': 'Consultation & Design',
            'data': [
              'Personalized consultation to understand your vision, budget, and lifestyle needs.',
              'Tailored architectural and interior design solutions that maximize value while maintaining style and functionality.',
            ]
          },
          {
            'header': 'Construction',
            'data': [
              'Complete Construction Services: From foundation to roofing, we handle all aspects of construction, ensuring a structurally sound and durable home.',
              'Interior Finishes: We carefully select affordable, high-quality finishes such as flooring, cabinetry, and fixtures that enhance both appearance and utility, all while staying within your budget.',
              'Exterior Enhancements: Cost-efficient siding, roofing, and landscaping are incorporated to boost curb appeal and ensure long-lasting performance.',
            ]
          },
          {
            'header': 'Systems & Installations',
            'data': [
              'Installation of dependable HVAC systems, plumbing, and electrical wiring, ensuring optimal comfort and functionality.',
              'Integration of energy-efficient technologies and optional smart home systems for added convenience and long-term savings.',
            ]
          },
          {
            'header': 'Quality Assurance',
            'data': [
              'Regular inspections throughout the construction process to ensure safety standards are met and that the materials used are properly implemented.',
              'Warranty coverage on workmanship, ensuring the home is built to last and meets basic quality standards within budget constraints.',
            ]
          },
          {'header': "What's Included", 'data': []},
          {
            'header': 'Simple Home Design',
            'data': [
              'A basic, functional home design that reflects your material choices and budget requirements, offering an efficient and affordable layout.',
            ]
          },
          {
            'header': 'Material Coordination',
            'data': [
              'Assistance with managing and ensuring the materials you provide are suitable for the construction process, helping you navigate cost-effective selections.',
            ]
          },
          {
            'header': 'Complete Construction',
            'data': [
              'We handle the entire construction journey, from the foundation to the final touches, all built with your selected materials and tailored to your specifications.',
            ]
          },
          {
            'header': 'Budget-Friendly Approach',
            'data': [
              'Emphasis on efficiency, ensuring the construction is completed within budget while still maintaining quality standards for durability and safety.',
            ]
          },
          {
            'header': 'Quality Control',
            'data': [
              'Regular inspections at each stage of the process to verify proper material use and adherence to safety codes and quality guidelines.',
            ]
          },
          {
            'header': 'Final Inspection & Handover',
            'data': [
              'A detailed final inspection ensures your home meets all necessary standards before the keys are handed over, ensuring readiness for immediate occupancy.',
            ],
            'data': [
              'Thorough inspections at each phase of construction to ensure exceptional craftsmanship and attention to detail.',
              'Warranty coverage on both workmanship and materials for peace of mind.'
            ]
          },
          {'header': "What's Included", 'data': []},
          {
            'header': 'Custom Home Design',
            'data': [
              'Select from a range of pre-designed floor plans or collaborate with our team to make minor customizations that reflect your personal style, without exceeding your budget.'
            ]
          },
          {
            'header': 'Building Permits & Approvals',
            'data': [
              'We handle all necessary paperwork, securing permits and approvals for a hassle-free experience.'
            ]
          },
          {
            'header': 'Cost-Effective Materials',
            'data': [
              'We source high-quality, durable materials that balance affordability with long-lasting performance, ensuring your home stands the test of time.'
            ]
          },
          {
            'header': 'Efficient Construction Process',
            'data': [
              'A streamlined approach ensures timely completion, avoiding delays and controlling costs related to labor and materials.'
            ]
          },
          {
            'header': 'Standard Finishes',
            'data': [
              'Choose from a curated selection of high-quality finishes for flooring, countertops, and cabinets, offering style, durability, and practicality at an affordable price.'
            ]
          },
          {
            'header': 'Energy Efficiency',
            'data': [
              'We incorporate energy-efficient solutions, including insulation, windows, and appliances, to reduce your energy bills from day one.'
            ]
          },
          {
            'header': 'Final Inspection & Handover',
            'data': [
              'Before handing over the keys, we conduct a comprehensive final inspection to ensure your new home meets our high standards.'
            ]
          },
          {
            'header': 'Optional Upgrades',
            'data': [
              'Premium finishes and fixtures for a personalized touch.',
              'Solar panel installations or advanced energy-saving features.',
              'Integration of cutting-edge smart home technology for enhanced convenience.',
              'With our Turnkey Home Construction services, you can enjoy a stress-free experience while staying within your budget and moving into a home that suits your lifestyle perfectly. Let us bring your dream home to life—affordably, efficiently, and beautifully.'
            ]
          },
        ],
      },
      {
        'title': "Complete Turnkey Home Construction Solution",
        'rating': 4.8,
        'reviews': 5,
        'price': 1800,
        'description':
            "Our Complete Turnkey Home Construction service provides an all-inclusive, streamlined approach to building your perfect home. From concept to completion, we manage every detail of the construction process, ensuring a smooth experience and delivering a high-quality, move-in-ready home—all within your budget.",
        'imagePath': "assets/images/Trunkey-3.jpeg",
        'serviceDetail': [
          {'header': 'Key Features', 'data': []},
          {
            'header': 'Consultation & Design',
            'data': [
              'A personalized consultation to understand your needs, preferences, and budget, laying the foundation for your ideal home.',
              'Professional design services that craft a unique, functional, and beautiful living space tailored to your lifestyle.',
            ]
          },
          {
            'header': 'Construction',
            'data': [
              'End-to-End Construction Services: We manage every phase of construction, from the foundation to the roof, ensuring structural integrity and aesthetic appeal.',
              'Interior Touches: Premium-quality flooring, cabinetry, countertops, and fixtures are chosen to create an elegant, cohesive home environment.',
              "Exterior Excellence: High-quality siding, roofing, and landscaping are implemented to boost your home's curb appeal and ensure lasting durability."
            ]
          },
          {
            'header': 'Systems & Installations',
            'data': [
              "Installation of efficient HVAC, plumbing, and electrical systems to ensure your home's comfort and functionality.",
              'Optional integration of smart home technology for added convenience and modern living.',
            ]
          },
          {
            'header': 'Quality Assurance',
            'data': [
              'Strict quality checks at every stage of construction, ensuring that each aspect of your home meets the highest standards.',
              'A comprehensive warranty on workmanship and materials, providing you with long-term peace of mind.',
            ]
          },
          {'header': "What's Included", 'data': []},
          {
            'header': 'Custom Home Design',
            'data': [
              'Collaborate with our expert team to design a home that meets your unique needs. You can choose from pre-designed options or customize features to suit your style.',
            ]
          },
          {
            'header': 'Permits & Approvals',
            'data': [
              'We handle the entire permitting and approval process, ensuring that your home complies with local regulations and building codes.',
            ]
          },
          {
            'header': 'Premium Materials',
            'data': [
              "Only high-quality, durable materials are used, ensuring both beauty and longevity in your home's construction.",
            ]
          },
          {
            'header': 'Efficient Construction Process',
            'data': [
              'Our streamlined construction timeline ensures timely delivery while maintaining exceptional standards of craftsmanship and quality.',
            ]
          },
          {
            'header': 'Luxury Finishes',
            'data': [
              'Select from a range of premium finishes that enhance the overall aesthetic and functionality of your home, from flooring to countertops.',
            ]
          },
          {
            'header': 'Energy Efficiency',
            'data': [
              'We incorporate energy-efficient windows, insulation, and appliances that lower your energy costs and contribute to a sustainable lifestyle.',
            ]
          },
          {
            'header': 'Final Inspection & Handover',
            'data': [
              'A thorough final inspection ensures your home is move-in ready, meeting all quality standards before handing you the keys.',
            ]
          },
          {
            'header': 'Optional Upgrades',
            'data': [
              'Custom interior and exterior enhancements to elevate your living space.',
              'Advanced energy-efficient options, including solar panels, to reduce environmental impact and lower energy bills.',
              'Full smart home technology integration for a modern, automated living experience.'
            ]
          }
        ],
      },
      {
        'title': "Luxury Turnkey Home Construction Solution",
        'rating': 4.8,
        'reviews': 5,
        'price': 2500,
        'description':
            "Our Luxury Turnkey Home Construction service provides an all-inclusive, streamlined approach to building your perfect home. From concept to completion, we manage every detail of the construction process, ensuring a smooth experience and delivering a high-quality, move-in-ready home—all within your budget.",
        'imagePath': "assets/images/Trunkey-4.jpeg",
        'serviceDetail': [
          {'header': 'Key Features', 'data': []},
          {
            'header': 'Consultation & Bespoke Design',
            'data': [
              "Comprehensive consultation to understand your vision, lifestyle, and specific design preferences, ensuring a home that's truly one-of-a-kind.",
              'Collaborate with top architects and designers to create a fully bespoke luxury home that seamlessly blends beauty, function, and sophistication.',
              "Expert assistance with selecting premium materials, finishes, and unique design elements to elevate your home's aesthetic appeal and luxury."
            ]
          },
          {
            'header': 'Construction',
            'data': [
              'High-End Construction Services: From foundation to roofing, we use only the finest materials and craftsmanship to create a structurally sound and visually stunning home.',
              'Interior Finishes: Indulge in luxurious flooring, custom cabinetry, designer fixtures, and exclusive finishes that exude elegance and comfort, making your home stand apart.',
              'Exterior Excellence: We incorporate premium exterior materials such as stone, marble, and custom landscaping to ensure timeless beauty and exceptional curb appeal.'
            ]
          },
          {
            'header': 'Systems & Installations',
            'data': [
              'State-of-the-Art Systems: Installation of top-tier HVAC systems, advanced smart home automation, and cutting-edge security systems to provide the utmost comfort and convenience.',
              'Sustainability at Its Best: Integration of eco-friendly technologies like solar power, geothermal systems, and sustainable materials to create an energy-efficient, modern luxury home.',
            ]
          },
          {
            'header': 'Quality Assurance',
            'data': [
              'Stringent quality checks at every stage of construction to ensure perfection and meet the highest standards of craftsmanship.',
              'Comprehensive warranty coverage on materials and workmanship, ensuring your investment is protected and your home stands the test of time.',
            ]
          },
          {'header': "What's Included", 'data': []},
          {
            'header': 'Bespoke Home Design',
            'data': [
              'Collaborate with our award-winning design team to create a fully custom luxury home that reflects your personal style and desires, including unique architectural features and tailored interior layouts.'
            ]
          },
          {
            'header': 'Building Permits & Approvals',
            'data': [
              'We manage all permitting and approval processes to ensure compliance with local regulations and building codes, while ensuring efficiency and smooth progress.'
            ]
          },
          {
            'header': 'Premium Materials',
            'data': [
              'The finest materials are selected, including imported marble, hardwood, custom lighting, and designer finishes, guaranteeing that every aspect of your home radiates luxury and sophistication.'
            ]
          },
          {
            'header': 'Elite Construction Process',
            'data': [
              'Our experienced team uses advanced construction techniques and a meticulous approach to deliver an unparalleled quality of build, on time and within scope.'
            ]
          },
          {
            'header': 'Luxury Finishes',
            'data': [
              'Choose from exclusive, custom finishes such as marble and exotic woods, bespoke cabinetry, and designer light fixtures to create a home that feels like a work of art.'
            ]
          },
          {
            'header': 'Energy Efficiency',
            'data': [
              'Integration of smart home features, such as automated lighting, climate control, security, and entertainment systems, designed for convenience and modern living. Energy-efficient features, including solar panels and high-performance insulation, ensure your home is as sustainable as it is luxurious.'
            ]
          },
          {
            'header': 'Final Inspection & Handover',
            'data': [
              'A comprehensive final inspection ensures every detail is flawless and meets our exceptional standards. We ensure a smooth and seamless handover so that you can start enjoying your dream home immediately.'
            ]
          },
          {
            'header': 'Optional Upgrades',
            'data': [
              'Personalized interior design consultations with renowned designers for a truly tailored experience.',
              'High-end amenities such as home theaters, wine cellars, and private fitness centers, designed to further elevate your living space.'
            ]
          }
        ],
      },
    ]
  },
  {
    'category': "Material Contract",
    'id': 2,
    'imagePath': "assets/images/Material-Contract.jpeg",
    'data': [
      {
        'title': "Budget-Friendly Material Contract Home Construction",
        'rating': 4.8,
        'reviews': 5,
        'price': 1000,
        'description':
            "Our Budget-Friendly Material Contract Home Construction service offers a cost-effective way to build your home by allowing you to choose and supply the materials, while we manage all aspects of the construction. This approach helps keep costs low without compromising quality, ensuring a functional and durable home that fits your budget.",
        'imagePath': "assets/images/Material-1.jpeg",
        'serviceDetail': [
          {'header': 'Key Features', 'data': []},
          {
            'header': 'Consultation & Basic Design',
            'data': [
              'Initial consultation to understand your vision, budget, and design preferences, ensuring a customized approach that aligns with your financial goals.',
              'Basic architectural design services focusing on simple, efficient layouts that maximize space and functionality within your budget and material choices.',
            ]
          },
          {
            'header': 'Material Contract',
            'data': [
              'Material Selection: You choose and supply affordable materials, such as lumber, roofing, and basic finishes, providing you with full control over your material expenses.',
              'Material Guidance: We offer expert advice on selecting materials that strike the perfect balance between affordability and quality, ensuring they meet construction standards and long-term durability.',
            ]
          },
          {
            'header': 'Construction Services',
            'data': [
              'Comprehensive Construction: We manage the entire construction process, from foundation to roofing, using the materials you provide to build a sturdy, functional home.',
              'Interior Finishes: Installation of basic flooring, paint, and cabinetry based on your material selections, ensuring a personalized yet budget-conscious finish.',
              'Exterior Features: Construction of siding, roofing, and basic landscaping, all tailored to the materials you supply.'
            ]
          },
          {
            'header': 'Systems & Installations',
            'data': [
              'Installation of standard HVAC systems, plumbing, and electrical wiring, utilizing cost-effective yet reliable options for essential systems.',
              'Integration of basic energy-efficient features, such as insulation and energy-saving appliances, to help lower long-term utility costs without adding significant upfront costs.',
            ]
          },
          {
            'header': 'Quality Assurance',
            'data': [
              'Regular inspections throughout the construction process to ensure safety standards are met and that the materials used are properly implemented.',
              'Warranty coverage on workmanship, ensuring the home is built to last and meets basic quality standards within budget constraints.',
            ]
          },
          {'header': "What's Included", 'data': []},
          {
            'header': 'Simple Home Design',
            'data': [
              'A basic, functional home design that reflects your material choices and budget requirements, offering an efficient and affordable layout.',
            ]
          },
          {
            'header': 'Material Coordination',
            'data': [
              'Assistance with managing and ensuring the materials you provide are suitable for the construction process, helping you navigate cost-effective selections.',
            ]
          },
          {
            'header': 'Complete Construction',
            'data': [
              'We handle the entire construction journey, from the foundation to the final touches, all built with your selected materials and tailored to your specifications.',
            ]
          },
          {
            'header': 'Budget-Friendly Approach',
            'data': [
              'Emphasis on efficiency, ensuring the construction is completed within budget while still maintaining quality standards for durability and safety.',
            ]
          },
          {
            'header': 'Quality Control',
            'data': [
              'Regular inspections at each stage of the process to verify proper material use and adherence to safety codes and quality guidelines.',
            ]
          },
          {
            'header': 'Final Inspection & Handover',
            'data': [
              'A detailed final inspection ensures your home meets all necessary standards before the keys are handed over, ensuring readiness for immediate occupancy.',
            ]
          },
          {
            'header': 'Optional Upgrades',
            'data': [
              'Energy-Efficient Upgrades: Improve insulation or add energy-saving appliances to enhance long-term savings on utilities.',
              'Design Enhancements: Customization options for additional design features or upgrades based on your preferences.',
            ]
          },
        ],
      },
      {
        'title': "Standard Material Contract Home Construction",
        'rating': 4.8,
        'reviews': 5,
        'price': 1300,
        'description':
            "Our Standard Material Contract Home Construction service offers a balanced approach for homeowners seeking a professionally built home at a reasonable cost. You provide mid-range materials, and we handle everything from construction to the finishing touches. Our team ensures efficient, high-quality work while adhering to industry standards, delivering a functional, durable, and aesthetically pleasing home.",
        'imagePath': "assets/images/Turnkey-1.jpeg",
        'serviceDetail': [
          {'header': 'Key Features', 'data': []},
          {
            'header': 'Consultation & Design',
            'data': [
              'Initial Consultation: We begin with a detailed discussion to understand your vision, needs, and budget, ensuring we create a plan that aligns with your goals.',
              'Architectural Design: Our design experts craft a plan that suits your lifestyle, balancing aesthetics with functionality, while taking your selected materials into account to maintain cost-effectiveness.',
            ]
          },
          {
            'header': 'Material Contract',
            'data': [
              'Material Selection: You provide mid-range materials like laminate or engineered hardwood flooring, standard cabinetry, durable countertops, basic lighting fixtures, roofing, and insulation. These materials offer a perfect balance of quality and affordability.',
              'Material Guidance: Our team helps you coordinate and manage the materials, ensuring timely sourcing and delivery. We guide you in selecting materials that meet construction standards and align with your project timeline.',
              'Vendor Coordination: We handle all logistics regarding the materials, including verifying quality, proper storage, and cost-efficient procurement without compromising performance.'
            ]
          },
          {
            'header': 'Construction Services',
            'data': [
              'Foundation to Roofing: Our skilled team oversees the full construction process, including site preparation, excavation, foundation pouring, framing, and roofing, ensuring a safe and structurally sound home based on your selected materials.',
              'Interior Finishes: We install the mid-range materials you choose, such as laminate or engineered hardwood flooring, standard cabinetry, countertops, and light fixtures, alongside standard painting, tiling, and finishing work.',
              'Exterior Features: Exterior work includes siding installation (vinyl, fiber cement, or composite), roofing (asphalt shingles or metal), and simple landscaping, ensuring durability and a neat appearance that can withstand the elements.'
            ]
          },
          {
            'header': 'Systems & Installations',
            'data': [
              'HVAC, Plumbing, Electrical: We install energy-efficient HVAC systems that provide optimal heating and cooling, mid-range plumbing fixtures like faucets, sinks, and toilets, and standard electrical wiring and fixtures to meet code requirements.',
              'Energy-Efficient Options: Where possible, we integrate basic energy-saving solutions, such as LED lighting, double-glazed windows, and fiberglass or foam board insulation, to enhance efficiency without additional costs.',
            ]
          },
          {
            'header': 'Quality Assurance',
            'data': [
              'Regular Inspections: We conduct thorough inspections at critical stages—foundation, framing, electrical, plumbing, roofing, and final finishes—to ensure the project meets all quality standards and complies with local building codes.',
              "Warranty Coverage: Our standard warranty covers workmanship-related issues, offering peace of mind that any construction defects will be addressed. However, material warranties are the homeowner's responsibility.",
            ]
          },
          {'header': "What's Included", 'data': []},
          {
            'header': 'Materials',
            'data': [
              'Flooring: Mid-range options like laminate, vinyl, or engineered hardwood, offering durability at a fraction of the cost of premium materials.',
              'Cabinetry: Standard cabinetry with finishes designed for both style and longevity, typically made from MDF or plywood.',
              'Countertops: Laminate, quartz, or solid surface countertops, combining affordability and visual appeal.',
              'Roofing: Durable options such as asphalt shingles or metal roofing, providing weather protection at a reasonable price point.',
              'Insulation: Energy-efficient fiberglass or foam board insulation to maintain comfort while keeping costs manageable.',
              'Windows & Doors: Double-glazed windows for efficiency, along with standard-grade doors that ensure security and insulation.',
            ]
          },
          {
            'header': 'Final Inspection & Handover',
            'data': [
              'A comprehensive final inspection ensures your home meets all quality standards and is ready for you to move in, ensuring everything is finished to your satisfaction before handing over the keys.',
            ]
          },
        ],
      },
      {
        'title': "Premium Material Contract Home Construction",
        'rating': 4.8,
        'reviews': 5,
        'price': 2000,
        'description':
            "The Premium Luxury Material Contract Home Construction is designed for those who want the finest quality in their home. You choose and supply premium, high-end materials, while we provide expert craftsmanship and meticulous attention to detail. Our team ensures that your luxury materials are incorporated into a beautifully constructed, sophisticated home.",
        'imagePath': "assets/images/Material-2.jpeg",
        'serviceDetail': [
          {'header': 'Key Features', 'data': []},
          {
            'header': 'Consultation & Bespoke Design',
            'data': [
              'Initial Consultation: A comprehensive consultation to understand your vision, lifestyle, and preferences.',
              'Architectural Design: Our expert designers will work with you to create bespoke architectural plans that incorporate high-end finishes and luxury features. The design is tailored to your material choices, ensuring a cohesive and stunning final product.',
              "Vendor's Effort: Our team collaborates with you on design choices, offering expert recommendations on layouts, structural enhancements, and optimizing the use of luxury materials. We handle the creation of detailed blueprints, permit applications, and cost evaluations to ensure your vision is realized."
            ]
          },
          {
            'header': 'Material Contract',
            'data': [
              'Material Selection: You source and supply premium materials such as exotic hardwood flooring, custom cabinetry, luxury stone countertops (like marble or granite), high-end fixtures, designer lighting, and architectural-grade roofing.',
              'Material Guidance: We provide expert consultation on selecting materials that meet the highest standards for luxury homes, including suggestions for suppliers and managing the logistics of material procurement.',
            ]
          },
          {
            'header': 'Construction Services',
            'data': [
              'Foundation to Roofing: Our skilled craftsmen bring your luxury home to life, from preparing and pouring the foundation to framing and installing premium roofing materials. Structural elements are carefully executed to support high-end finishes, ensuring stability and longevity.',
              'Interior Finishes: We install custom, luxury flooring, such as hardwood or natural stone, bespoke cabinetry, and high-end fixtures. We also ensure the highest quality in painting, tiling, and finish work, bringing elegance to every room.',
              'Exterior Features: Exterior work includes the installation of premium siding (such as stone veneer, high-quality brick, or stucco) and luxury roofing (such as slate or architectural shingles). We also offer advanced landscaping options, including custom pools, water features, or outdoor living spaces designed for opulence and sustainability.'
            ]
          },
          {
            'header': 'Systems & Installations',
            'data': [
              'State-of-the-Art Systems: We install advanced HVAC systems, customized for luxury homes, ensuring optimal climate control. Plumbing and electrical installations are done to the highest standards, using the finest fixtures and appliances available.',
              'Smart Home Integration: We offer full integration of smart home technologies, including automation systems for lighting, security, and climate control. Your home will be outfitted with top-tier energy-efficient appliances and systems.',
            ]
          },
          {
            'header': 'Quality Assurance',
            'data': [
              'Regular Inspections: Detailed inspections are conducted at every stage of construction to ensure the highest levels of quality and craftsmanship. We inspect for precision in all work, ensuring your luxury materials are installed perfectly.',
              'Warranty Coverage: We provide extended warranties on both workmanship and materials used, ensuring peace of mind and guaranteeing the performance and durability of your luxury home.',
            ]
          },
          {
            'header': 'Materials Used in Luxury Package',
            'data': [
              'Flooring: High-end options such as exotic hardwood, natural stone (marble, granite, travertine), or luxury vinyl plank, chosen for both beauty and durability.',
              'Cabinetry: Custom-built cabinetry crafted from premium materials like solid wood, with bespoke finishes and luxurious details such as soft-close mechanisms, glass inlays, and intricate woodwork.',
              'Countertops: Luxury stone countertops such as marble, granite, quartzite, or custom solid surfaces designed for aesthetics, durability, and luxury.',
              'Roofing: Architectural-grade options such as slate, copper, clay tiles, or high-end architectural shingles that provide both elegance and long-term weather protection.',
              'Windows & Doors: Custom, energy-efficient windows with high-end finishes (wood, aluminum, or composite), and bespoke doors made from premium wood or metal with decorative elements and superior security.',
              'Fixtures: Designer fixtures, including high-end lighting, faucets, and plumbing fixtures from luxury brands, with an emphasis on style and functionality.',
            ]
          },
          {
            'header': 'Optional Upgrades',
            'data': [
              'Additional luxury features such as wine cellars, home theaters, or spas.',
              'Custom pools, outdoor kitchens, or water features.',
            ]
          },
        ],
      },
    ]
  },
  {
    'category': "Eco Friendly Green House",
    'id': 3,
    'imagePath': "assets/images/Red-Ecofriendly.jpeg",
    'data': [
      {
        'title': "Affordable Green Home Construction",
        'rating': 4.8,
        'reviews': 5,
        'price': 1500,
        'description':
            "Affordable Green Home Construction: Building Your Dream with Sustainability in Mind",
        'imagePath': "assets/images/Green-House-1.jpeg",
        'serviceDetail': [
          {'header': 'Key Features:', 'data': []},
          {
            'header': 'Consultation & Sustainable Design',
            'data': [
              "Personalized Consultation: We start with a detailed consultation to understand your green home goals, budget, and preferred sustainable features. We'll guide you through the process, ensuring everything aligns with your vision and resources.",
              "Eco-Friendly Design: Our team works with you to create a layout that maximizes energy efficiency, natural light, and ventilation while keeping costs in check. We'll share expert tips on how to build sustainably within your budget, blending affordability with green principles."
            ]
          },
          {
            'header': 'Affordable Green Materials',
            'data': [
              'Smart Material Choices: We help you choose eco-friendly materials like recycled or locally sourced products, low-VOC paints, and energy-efficient insulation. These materials minimize environmental impact and ensure that your green home is both affordable and durable.',
              'Efficient Sourcing: Our team handles the sourcing of materials to keep everything on track. We take care of logistics to ensure that all materials arrive on time and meet quality standards.',
            ]
          },
          {
            'header': 'Construction Services',
            'data': [
              'From Foundation to Roof: Our expert team handles every step of construction using green building practices. From sustainable foundations to energy-efficient roofing, we ensure each element contributes to a greener, more sustainable home.',
              "Interior Finishes: We'll use budget-friendly sustainable materials like bamboo or cork flooring, low-VOC paints, and basic cabinetry made from eco-friendly materials, creating a healthy living space without the high cost.",
              "Exterior Features: We install environmentally friendly siding and energy-efficient roofing, along with drought-resistant landscaping that helps conserve water. Every element is selected to reduce your home's carbon footprint."
            ]
          },
          {
            'header': 'Energy-Efficient Systems',
            'data': [
              "Cost-Effective Systems: We install energy-saving systems like low-flow plumbing fixtures, efficient HVAC systems, and energy-saving electrical setups. Plus, we'll wire your home for future solar panels if you're looking to add renewable energy later.",
            ]
          },
          {
            'header': 'Water Conservation & Landscaping',
            'data': [
              'Water-Efficient Features: We incorporate simple water-saving technologies like low-flow faucets and toilets, alongside drought-resistant plants in your landscaping. These features reduce water usage and help preserve natural resources.',
            ]
          },
          {
            'header': 'Quality Assurance & Green Standards',
            'data': [
              'Regular Inspections: To ensure your home meets all green building standards, we perform regular inspections, focusing on energy efficiency, material quality, and overall sustainability.',
              "Standard Warranty Coverage: Enjoy peace of mind with our standard warranty, covering workmanship and materials to keep your home's green features intact over time.",
            ]
          },
          {
            'header': 'Materials We Use in Your Affordable Green Home:',
            'data': [
              'Flooring: Choose from durable, eco-friendly materials like bamboo, cork, or recycled options with a low environmental impact.',
              'Paints & Finishes: We use low-VOC, non-toxic paints that improve indoor air quality and offer an eco-friendly yet cost-efficient finish.',
              'Insulation: Our insulation choices, made from sustainable materials like recycled cotton or cellulose, offer great energy performance without compromising your budget.',
              'Roofing & Siding: We offer energy-efficient roofing options like metal or recycled asphalt shingles, along with sustainable siding made from fiber cement or responsibly sourced wood.',
              'Windows & Doors: We provide budget-friendly, double-glazed windows to boost energy efficiency and doors made from sustainable materials to reduce energy loss.',
            ]
          },
          {
            'header': 'Optional Upgrades',
            'data': [
              'Solar Panels: Add solar panels or a solar-ready setup for future energy savings.',
              'Rainwater Harvesting: Install a system for rainwater harvesting, reducing your water consumption and helping with irrigation.',
              'Upgraded Appliances: Choose from energy-efficient appliances to reduce your overall environmental impact.',
              'Smart Home Systems: Keep track of energy use and optimize efficiency with smart home technology.',
              "By choosing Affordable Green Home Construction, you're making a positive impact on both the environment and your wallet. Let us help you build a home that is sustainable, energy-efficient, and most importantly, yours.",
            ]
          },
        ],
      },
      {
        'title': "Standard Green Home Construction",
        'rating': 4.8,
        'reviews': 5,
        'price': 2000,
        'description':
            "The Standard Green Home Construction package is designed for homeowners who seek to create an energy-efficient, eco-friendly living space without sacrificing comfort or aesthetic appeal. This offering focuses on integrating sustainable building materials and techniques to reduce environmental impact, optimize home efficiency, and promote a healthier living environment.",
        'imagePath': "assets/images/GreenHouse-2.jpeg",
        'serviceDetail': [
          {'header': 'Key Features:', 'data': []},
          {
            'header': 'Consultation & Sustainable Design',
            'data': [
              'Personalized Consultation: We start with an in-depth consultation to understand your green home goals, sustainability priorities, energy efficiency needs, and budget.',
              'Green Architectural Design: Our expert design team develops a balanced home plan that incorporates passive solar design, energy-efficient layouts, and eco-friendly materials to enhance natural light, ventilation, and overall energy performance.',
            ]
          },
          {
            'header': 'Sustainable Materials & Resources',
            'data': [
              'Eco-Conscious Material Selection: We assist in choosing mid-range, environmentally responsible materials such as sustainably sourced wood, recycled materials, low-VOC finishes, and energy-efficient insulation. These materials are chosen for their durability, sustainability, and cost-effectiveness.',
            ]
          },
          {
            'header': 'Construction Services',
            'data': [
              'Comprehensive Build: Our skilled team employs green construction techniques from foundation to roofing, ensuring a seamless integration of eco-friendly materials and high-quality craftsmanship while prioritizing sustainability.',
              'Interior Finishes: We install sustainable flooring options like bamboo, cork, or recycled materials, low-VOC paints, and custom cabinetry made from responsibly sourced wood, creating a healthy and energy-efficient indoor environment.',
              'Exterior Features: We incorporate energy-efficient siding options such as fiber cement, sustainably sourced wood, or recycled materials, paired with durable roofing and water-efficient landscaping.'
            ]
          },
          {
            'header': 'Energy-Efficient Systems',
            'data': [
              'Mid-Range Energy Systems: Our package includes the installation of energy-efficient HVAC systems, energy-saving appliances, and sustainable lighting solutions, ensuring comfortable temperatures while minimizing energy consumption.',
              'Renewable Energy Integration: We offer solar-ready installation or the integration of small-scale renewable energy systems, such as solar panels or solar water heaters, to further reduce reliance on fossil fuels and lower utility costs.',
            ]
          },
          {
            'header': 'Water Conservation & Eco-Friendly Landscaping',
            'data': [
              'Water-Efficient Solutions: We incorporate low-flow faucets, toilets, and showerheads, along with a basic rainwater harvesting system for irrigation. Landscaping features drought-tolerant plants, reducing water consumption and promoting sustainability.',
            ]
          },
          {
            'header': 'Quality Assurance & Green Standards',
            'data': [
              'Ongoing Inspections: Regular inspections throughout the construction process ensure adherence to green building practices and compliance with energy efficiency and sustainability standards.',
              'Green Building Certification: The home is constructed to meet green certification standards (such as LEED or Energy Star, depending on local regulations), ensuring long-term sustainability, energy efficiency, and added value.',
            ]
          },
          {
            'header': 'Materials Used in the Standard Green Package:',
            'data': [
              'Flooring: Durable, eco-friendly materials such as bamboo, cork, or recycled wood, offering both sustainability and longevity.',
              'Paints & Finishes: Low-VOC, non-toxic paints and finishes that improve indoor air quality while reducing harmful emissions.',
              'Insulation: Energy-efficient insulation made from materials like recycled cotton or cellulose, offering excellent thermal performance and reducing heating and cooling needs.',
              'Roofing & Siding: Energy-efficient roofing options like metal or recycled asphalt shingles, along with eco-friendly siding materials like fiber cement or sustainably sourced wood.',
              'Windows & Doors: Energy-efficient double- or triple-glazed windows and doors designed to minimize heat loss and improve comfort while lowering energy consumption.',
            ]
          },
          {
            'header': 'Optional Upgrades:',
            'data': [
              'Full Solar Panel Installation: For complete renewable energy generation, we offer the installation of solar panels.',
              'Geothermal Heating & Cooling: Install an advanced, energy-efficient geothermal heating and cooling system to optimize comfort and sustainability.',
              'High-Performance Appliances: Choose from a range of energy-efficient, high-performance appliances to further reduce energy consumption.',
              'Smart Home Systems: Integrate smart technology to optimize energy usage, reduce waste, and improve overall home efficiency.',
              "With Standard Green Home Construction, you'll achieve a home that reflects your commitment to sustainability, delivers optimal energy efficiency, and maintains a high standard of comfort and style.",
            ]
          },
        ],
      },
      {
        'title': "Luxury Green Home Construction",
        'rating': 4.8,
        'reviews': 5,
        'price': 3000,
        'description':
            "The Luxury Green Home Construction package is crafted for discerning homeowners who seek the epitome of sustainable luxury. This offering blends cutting-edge eco-friendly technologies with exceptional craftsmanship and high-end materials to create a home that is both lavish and environmentally responsible. Every element is carefully curated to reduce environmental impact while ensuring unparalleled comfort, elegance, and energy efficiency.",
        'imagePath': "assets/images/GreenHouse-3.jpeg",
        'serviceDetail': [
          {'header': 'Key Features', 'data': []},
          {
            'header': 'Consultation & Bespoke Eco-Friendly Design',
            'data': [
              'Personalized Consultation: We begin with an in-depth consultation to understand your vision for a green luxury home, incorporating your sustainability priorities, aesthetic preferences, and desired energy efficiency levels.',
              'Architectural Design: Our expert design team will create a custom, eco-conscious design that blends sustainable architecture with luxurious finishes. The layout will incorporate passive solar design, natural ventilation, and energy-efficient systems, creating a harmonious balance of style and sustainability.',
            ]
          },
          {
            'header': 'Premium Sustainable Materials',
            'data': [
              'Material Selection: We help you choose the finest sustainable materials, including reclaimed wood, high-end recycled products, eco-friendly luxury finishes, and responsibly sourced stone. Each material is selected for its superior quality, minimal environmental footprint, and long-term durability.',
            ]
          },
          {
            'header': 'Luxury Green Construction Services',
            'data': [
              'Comprehensive Build: Our team provides full construction services, employing green building techniques at every stage. From foundations made with recycled or sustainable materials to framing with FSC-certified wood, we ensure that every part of your home reflects both luxury and sustainability. The use of eco-friendly insulation and roofing further enhances energy efficiency without compromising on aesthetic appeal.',
              'Interior Finishes: We install high-end, sustainable flooring options like reclaimed hardwood, polished concrete, and luxury cork. Custom cabinetry made from responsibly sourced wood or bamboo is used, ensuring a sophisticated yet environmentally mindful design. Every finish emphasizes both luxury and eco-consciousness.',
              'Exterior Features: For the exterior, we offer premium materials such as green roofs, natural stone facades, and energy-efficient siding made from reclaimed wood or composite materials. Landscaping is designed to blend seamlessly with nature, featuring native plants, rain gardens, and outdoor living spaces crafted with sustainable materials.'
            ]
          },
          {
            'header': 'Advanced Energy & Water Efficiency',
            'data': [
              'State-of-the-Art Systems: We install top-of-the-line energy-efficient systems, including high-performance HVAC with smart controls, solar panels, and geothermal heating and cooling systems. These technologies are selected to maximize energy savings and minimize your environmental impact.',
              'Renewable Energy Integration: Your luxury home will feature comprehensive renewable energy solutions, from solar panels to advanced energy storage systems, providing significant energy savings while reducing reliance on non-renewable sources.',
            ]
          },
          {
            'header': 'Water Conservation & Eco-Friendly Landscaping',
            'data': [
              "Water-Saving Technologies: We incorporate cutting-edge water-efficient systems such as greywater recycling, rainwater harvesting, and smart irrigation. Luxury low-flow fixtures in bathrooms and kitchens ensure that water conservation doesn't sacrifice design quality or functionality.",
              'Sustainable Landscaping: Landscaping is designed with both beauty and environmental responsibility in mind. We use drought-resistant plants, organic gardening techniques, and eco-friendly outdoor features such as permeable paving and green walls to create a sustainable outdoor oasis.',
            ]
          },
          {
            'header': 'Materials Used in Luxury Green Construction',
            'data': [
              'Flooring: Sustainable luxury options, including reclaimed hardwood, polished concrete, and natural stone, are chosen for their aesthetic beauty and eco-friendliness.',
              "Paints & Finishes: We use non-toxic, low-VOC paints and finishes that improve indoor air quality while contributing to the home's overall aesthetic appeal and sustainability.",
              'Insulation: We offer superior eco-friendly insulation options, such as wool, recycled denim, or advanced cellulose insulation, providing optimal thermal performance while supporting energy conservation.',
              'Roofing & Siding: Choose from luxury roofing options like green roofs, solar-integrated roofing, or sustainable metal roofing, paired with eco-friendly siding made from reclaimed wood, composite materials, or natural stone.',
              "Windows & Doors: Premium, energy-efficient triple-glazed windows with sustainable frames (wood, aluminum, or composite) enhance thermal performance and aesthetics. Custom luxury doors are made from eco-friendly materials to further elevate the home's design.",
              "With Luxury Green Home Construction, you'll experience the perfect fusion of luxurious living and sustainable design. Every detail is meticulously crafted to offer unmatched comfort, energy efficiency, and elegance, all while minimizing environmental impact.",
            ]
          },
        ],
      },
    ]
  },
  {
    'category': "Prefabricated House",
    'id': 4,
    'imagePath': "assets/images/Prefabricated-House.jpeg",
    'data': [
      {
        'title': "Budget-Friendly prefabricated Home Construction",
        'rating': 4.8,
        'reviews': 5,
        'price': 1200,
        'description':
            "The Budget-Friendly Prefabricated Home Construction package is designed for homeowners seeking an efficient and cost-effective way to bring their dream home to life. This approach utilizes the speed and affordability of prefabricated construction while maintaining high standards of quality and comfort. With a streamlined process from design to assembly, we ensure that your home is built to modern standards at a fraction of the cost of traditional construction methods.",
        'imagePath': "assets/images/Fabricated-1.jpeg",
        'serviceDetail': [
          {'header': 'Key Features', 'data': []},
          {
            'header': 'Consultation & Customization',
            'data': [
              'Initial Consultation: We begin with a consultation to understand your requirements, budget, and personal preferences.',
              'Basic Customization: Choose from a range of pre-designed floor plans and layouts, with options for customizing finishes and materials to align with your style and budget. Our team offers expert advice on material selections that balance aesthetics, functionality, and cost.',
            ]
          },
          {
            'header': 'Prefabricated Components',
            'data': [
              'Factory-Built Quality: Major home components, including walls, roofing, and floor panels, are pre-constructed in a factory setting, ensuring precision and consistent quality.',
              'Efficient Material Usage: The controlled factory environment minimizes material waste, ensuring a cost-effective and environmentally friendly construction process.',
              'On-Time Delivery: We coordinate the design and manufacturing of your prefabricated components to guarantee timely delivery and adherence to specifications.'
            ]
          },
          {
            'header': 'On-Site Assembly',
            'data': [
              'Expedited Construction Timeline: Once prefabricated components are delivered, our skilled team assembles the home quickly and efficiently, cutting down construction time compared to traditional methods.',
              'Structural Integrity: Our construction team meticulously assembles each section with a focus on structural stability and long-term durability.',
            ]
          },
          {
            'header': 'Interior & Exterior Finishes',
            'data': [
              'Budget-Friendly Finishes: Select from a variety of affordable yet stylish interior finishes, including flooring, cabinetry, and fixtures. For the exterior, we offer low-maintenance siding and roofing options that enhance curb appeal while ensuring durability.',
              'Functionality & Aesthetics: We carefully choose materials that provide both visual appeal and practicality, delivering a home that is both beautiful and budget-conscious.',
            ]
          },
          {
            'header': 'Basic Systems Installation',
            'data': [
              'Essential Systems: Installation of necessary HVAC, plumbing, and electrical systems, all optimized for efficiency and reliability. These systems meet all required building codes and contribute to overall energy efficiency.',
              'Safety & Compliance: Our team ensures all systems are installed correctly to meet the highest standards of safety and performance.',
            ]
          },
          {
            'header': 'Energy Efficiency',
            'data': [
              'Standard Energy Efficiency: Basic energy-saving features, including double-pane windows, adequate insulation, and energy-efficient lighting, are incorporated to help reduce utility costs and enhance comfort.',
              'Sustainable Features: We ensure proper installation and inspection of all energy-efficient systems, providing long-term savings on energy bills.',
            ]
          },
          {
            'header': 'Quality Assurance',
            'data': [
              'Rigorous Inspections: Regular inspections take place throughout both the manufacturing and on-site assembly stages to ensure quality and safety standards are met.',
              'End-to-End Oversight: From the factory to final assembly, we maintain strict oversight to ensure that your home meets budget expectations, quality requirements, and safety standards.',
            ]
          },
          {'header': 'Materials Used', 'data': []},
          {
            'header': 'Flooring',
            'data': [
              'Budget-friendly options such as laminate, vinyl, or affordable tile.',
            ]
          },
          {
            'header': 'Cabinetry & Fixtures',
            'data': [
              'Cost-effective yet durable materials, including prefabricated cabinetry and budget-conscious fixtures.',
            ]
          },
          {
            'header': 'Roofing & Siding',
            'data': [
              'Low-maintenance, affordable options such as asphalt shingles for roofing and vinyl siding for the exterior.',
            ]
          },
          {
            'header': 'Insulation',
            'data': [
              'Standard insulation that ensures basic energy efficiency at a low cost.',
            ]
          },
          {
            'header': 'Optional Upgrades',
            'data': [
              'Premium flooring options, such as engineered wood or upgraded tile.',
              'Energy-efficient appliances and smart home technology.',
              'Solar panel installations for renewable energy solutions.',
              'Water-saving plumbing fixtures to reduce consumption.',
            ]
          },
        ],
      },
      {
        'title': "Standard Prefabricated Home Construction",
        'rating': 4.8,
        'reviews': 5,
        'price': 1600,
        'description':
            "The Standard Prefabricated Home Construction package offers the ideal solution for homeowners seeking a balance between affordability, quality, and modern design. This option enhances the efficiency and speed of prefabricated construction while providing a higher level of customization and superior materials, ensuring that your home fulfills both functional and aesthetic requirements.",
        'imagePath': "assets/images/Fabricated-2.jpeg",
        'serviceDetail': [
          {'header': 'Key Features', 'data': []},
          {
            'header': 'Consultation & Design',
            'data': [
              'Personalized Consultation: Start with an in-depth consultation to assess your lifestyle, space needs, and design preferences.',
              'Expanded Customization: Select from a variety of customizable floor plans with options to modify layouts, materials, and finishes. Our team offers expert guidance to help you optimize your home design for comfort, functionality, and energy efficiency, all within your budget.',
            ]
          },
          {
            'header': 'High-Quality Prefabricated Components',
            'data': [
              'Factory-Precision Build: Core structural components, including walls, floors, and roof panels, are produced in a factory environment with stringent quality control measures.',
              'Improved Materials: Mid-tier materials are used, providing enhanced durability, energy efficiency, and aesthetics compared to basic options.',
              'Quality Assurance: We work closely with manufacturers to ensure the selection of high-quality materials and precise fabrication, coordinating timely delivery to the construction site.'
            ]
          },
          {
            'header': 'On-Site Assembly & Construction',
            'data': [
              'Streamlined Assembly: Once the prefabricated components are delivered, our skilled team assembles the home on-site, maintaining high standards of workmanship throughout the build.',
              'Expert Oversight: The construction team handles the assembly with care, ensuring compliance with building codes and quality expectations. We supervise the entire process to ensure seamless integration of all components.',
            ]
          },
          {
            'header': 'Enhanced Interior & Exterior Finishes',
            'data': [
              "Upgrade Options: Choose from a wider selection of interior and exterior finishes, including higher-quality flooring, cabinetry, and fixtures. Exterior enhancements include upgraded siding and roofing, designed to elevate your home's curb appeal.",
              'Quality Materials: Our team selects mid-range materials that offer durability and visual appeal, ensuring the finishes enhance the overall function and aesthetics of your home.',
            ]
          },
          {
            'header': 'Systems & Installations',
            'data': [
              'Efficient Systems: Installation of mid-range HVAC, plumbing, and electrical systems designed for reliability, comfort, and energy efficiency. These systems exceed basic building code requirements and provide enhanced performance.',
              'Collaborative Installation: We partner with experienced contractors to ensure systems are installed efficiently, meet energy efficiency standards, and deliver long-term reliability.',
            ]
          },
          {
            'header': 'Energy Efficiency',
            'data': [
              'Improved Energy Savings: Features such as enhanced insulation, double or triple-pane windows, and energy-efficient lighting are incorporated for greater energy savings and comfort.',
              'Sustainability Focus: We ensure proper integration of energy-efficient features to provide a sustainable and comfortable living environment.',
            ]
          },
          {
            'header': 'Quality Assurance & Inspections',
            'data': [
              'Rigorous Inspections: Inspections are conducted throughout both the manufacturing and on-site assembly phases to ensure the highest standards of quality and safety.',
              'End-to-End Supervision: We supervise every phase of construction to maintain exceptional quality, durability, and safety throughout the process.',
            ]
          },
          {'header': 'Materials Used', 'data': []},
          {
            'header': 'Flooring',
            'data': [
              'Mid-range options such as engineered wood, ceramic tile, or upgraded vinyl.',
            ]
          },
          {
            'header': 'Cabinetry & Fixtures',
            'data': [
              'Solid wood or premium composite cabinetry, with mid-range hardware and fixtures selected for durability and aesthetic appeal.',
            ]
          },
          {
            'header': 'Roofing & Siding',
            'data': [
              'Upgraded materials, including architectural asphalt shingles or metal roofing, and durable exterior siding options such as fiber cement or upgraded vinyl.',
            ]
          },
          {
            'header': 'Insulation',
            'data': [
              'Improved insulation materials for enhanced energy efficiency and comfort.',
            ]
          },
          {
            'header': 'Optional Upgrades',
            'data': [
              'Integration of smart home technology, including lighting, security, and climate control systems.',
              'Premium appliance packages for the kitchen and laundry areas.',
              'Solar energy systems with energy storage options.',
              'Advanced water filtration and energy recovery systems.',
            ]
          },
        ],
      },
      {
        'title': "Luxury prefabricated Home Construction",
        'rating': 4.8,
        'reviews': 5,
        'price': 2500,
        'description':
            "The Luxury Prefabricated Home Construction package is tailored for those who desire the epitome of luxury living in a prefabricated home. By combining premium materials, cutting-edge technology, and exceptional craftsmanship, this offering delivers a sophisticated living experience while maintaining the efficiency and precision of prefabricated construction. Every element is carefully curated to meet the highest standards of style, comfort, and sustainability.",
        'imagePath': "assets/images/Fabricated-3.jpeg",
        'serviceDetail': [
          {'header': 'Key Features', 'data': []},
          {
            'header': 'Exclusive Consultation & Custom Design',
            'data': [
              'Personalized Consultation: Begin with an in-depth consultation to discuss your vision, lifestyle needs, and luxury preferences.',
              'Bespoke Design Solutions: Our expert design team creates a fully custom home plan tailored to your specifications, including premium materials, advanced features, and distinctive architectural elements.',
              'Expert Guidance: We provide expert advice throughout the design process, ensuring every detail reflects your vision and meets the highest luxury standards. Our team manages the design to balance both aesthetic appeal and functional requirements.'
            ]
          },
          {
            'header': 'Premium Prefabricated Components',
            'data': [
              'High-End Factory-Built Elements: Structural components such as walls, floors, and roof panels are constructed in a state-of-the-art factory, utilizing only the finest materials.',
              'Luxurious Materials: Components are crafted with top-tier materials, including high-end finishes, advanced insulation, and enhanced structural elements for exceptional durability and comfort.',
              'Precision Oversight: We oversee the production process to ensure all components meet the strictest quality standards. Delivery and installation are meticulously coordinated to preserve the integrity of your luxury home.'
            ]
          },
          {
            'header': 'Exquisite On-Site Assembly & Construction',
            'data': [
              'Efficient Assembly: Once delivered, prefabricated components are assembled with precision and care, utilizing advanced techniques to ensure flawless integration and a high-quality finish.',
              'Unmatched Craftsmanship: Our skilled construction team ensures each stage of the assembly process is executed flawlessly, maintaining the highest levels of craftsmanship and attention to detail.',
            ]
          },
          {
            'header': 'Luxurious Interior & Exterior Finishes',
            'data': [
              'Premium Finishes: Choose from an extensive selection of luxury interior and exterior finishes, including high-end flooring (e.g., hardwood, marble), custom cabinetry, designer fixtures, and top-tier countertops. Exterior features include upscale siding, roofing, and custom landscaping.',
              'Flawless Installation: We source and install only the finest materials, ensuring that every finish enhances both the elegance and functionality of your home. Our team ensures flawless installation for a perfect result.',
            ]
          },
          {
            'header': 'Advanced Systems & Technology',
            'data': [
              'State-of-the-Art Systems: The home is equipped with high-performance HVAC, advanced plumbing, and electrical systems, along with integrated smart home technology, including automation, security, and climate control systems.',
              'Energy Efficiency & Sustainability: We incorporate cutting-edge, energy-efficient systems such as solar panels, advanced insulation, and green building technologies to ensure superior energy performance and environmental responsibility.',
              'Seamless Integration: Collaborating with leading technology providers, we ensure all systems are seamlessly integrated into the home, offering the latest in comfort, convenience, and sustainability.'
            ]
          },
          {
            'header': 'Exceptional Quality Assurance & Certification',
            'data': [
              'Rigorous Inspections: Every phase of the manufacturing and assembly process undergoes comprehensive quality checks to ensure that the home meets luxury standards.',
              'Luxury Green Certification: Your home is built to meet the highest green building certifications (such as LEED Platinum or Living Building Challenge), guaranteeing exceptional sustainability and performance.',
              'Ongoing Oversight: We manage the inspection and certification process to ensure your home adheres to the highest quality and sustainability standards.'
            ]
          },
          {'header': 'Materials Used', 'data': []},
          {
            'header': 'Flooring',
            'data': [
              'Premium options such as hardwood, natural stone, or high-end porcelain tile.',
            ]
          },
          {
            'header': 'Cabinetry & Fixtures',
            'data': [
              'Custom cabinetry with luxury finishes, top-grade fixtures, and designer hardware.',
            ]
          },
          {
            'header': 'Roofing & Siding',
            'data': [
              'High-quality materials, including slate or metal roofing and premium siding options such as natural stone or high-end composite materials.',
            ]
          },
          {
            'header': 'Insulation',
            'data': [
              'Advanced insulation materials that provide superior energy efficiency and enhanced comfort.',
            ]
          },
        ],
      },
    ]
  },
];

class ConstructionDetailPage extends StatefulWidget {
  static String tag = '/Construction';
  final String? serviceType;
  ConstructionDetailPage({super.key, this.serviceType});

  @override
  State<ConstructionDetailPage> createState() => _ConstructionDetailPageState();
}

class _ConstructionDetailPageState extends State<ConstructionDetailPage> {

  @override
  Widget build(BuildContext context) {
    return BaseServiceScreen(
      title: "Construction",
      serviceType: widget.serviceType,
      services: services, // Use the predefined services list
      serviceTypeList: ['basic', 'Standard', 'Premium', 'Custom'],
      serviceSubTypeList: ['Small', 'Medium', 'Large'],
    );
  }
}

class ConstructionTable extends StatelessWidget {
  const ConstructionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          border: TableBorder.all(color: Colors.black),
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(3),
          },
          children: const [
            TableRow(
              decoration: BoxDecoration(color: Colors.grey),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Type Of Construction',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: contentTitleSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Cost (Per Sq.Ft)',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: contentTitleSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Inclusions',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: contentTitleSize),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Basic Residential',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '₹1,800 - ₹2,200',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Standard materials, plumbing, electrical, basic flooring, paint, and structural design',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Premium Residential',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '₹2,500 - ₹3,500',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'High-end materials, modular kitchen, false ceilings, premium flooring, and smart home features',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Commercial Spaces',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '₹2,000 - ₹4,000',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Tailored designs, high-durability materials, and optimized layouts',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Luxury & Custom Builds',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '₹4,500+',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Bespoke designs, imported materials, advanced automation, and landscaping',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
              ],
            ),
          ],
        ),
        15.height,
        Table(
          border: TableBorder.all(color: Colors.black),
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(2),
            3: FlexColumnWidth(2),
          },
          children: const [
            TableRow(
              decoration: BoxDecoration(color: Colors.grey),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Area',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: contentTitleSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Residential (₹/Sq. Ft.)',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: contentTitleSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Commercial (₹/Sq. Ft.)',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: contentTitleSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Land (₹/Sq. Ft.)',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: contentTitleSize),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Shankarnagar',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '₹5,000 - ₹7,500',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '₹8,000 - ₹12,000',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '₹3,500 - ₹6,000',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Shamta Colony',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '₹4,000 - ₹6,500',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '₹7,000 - ₹10,000',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '₹2,500 - ₹5,000',
                    style: TextStyle(fontSize: contentSize),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
