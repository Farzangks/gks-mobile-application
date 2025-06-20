import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:ghar_ka_sathi/view/in_home_services/base_service_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

import 'cleaning_details_screen.dart';


/// Data for carpentry services
final List<Map<String, dynamic>> services = [
  {
    'category': "Interior Painting",
    'id': 1,
    'imagePath': "assets/images/Red-Interior-painitng.jpeg",
    'data': [
      {
        'title': "Basic Interior Painting",
        'rating': 4.8,
        'reviews': 5,
        'price': 12,
        'description':
        "Transform your living spaces with a cost-effective, high-quality painting solution designed to give your home a refreshed and polished look effortlessly.",
        'imagePath': "assets/images/Basic-Interior-Painiting.jpeg",
        'serviceDetail':[
          {
            'header': 'Scope of Work',
            'data':[
              'Paint Application: Single coat for walls and ceilings, ensuring even and seamless coverage.',
              'Surface Preparation: Includes light sanding, basic crack repairs, and patching to create a smooth foundation.',
            ]
          },
          {
            'header': 'Premium Paint Options',
            'data':[
              'Asian Paints Tractor Emulsion: A budget-friendly choice offering smooth and consistent coverage.',
              'Berger Easy Clean Emulsion: Perfect for interiors, featuring an easy-to-clean, washable formula for lasting beauty.',
              'Nerolac Beauty Emulsion: Combines affordability with reliable durability and an attractive finish.',
            ]
          },
          {
            'header': 'Enhancements',
            'data':[
              'Wall Primer (Optional Add-on): Improves paint adherence and enhances the finish and durability of the application.', ]
          },
          {
            'header': 'Ideal For',
            'data':[
              'Homeowners seeking an affordable solution to refresh their interiors with minimal hassle, perfect for those on a budget yet unwilling to compromise on quality.',
              'Let us help you bring your vision to life with a fresh coat of elegance!', ]
          },
        ],
      },
      {
        'title': "Deluxe Interior Painting",
        'rating': 4.8,
        'reviews': 5,
        'price': 20,
        'description':
        "Elevate your home interiors with a premium painting service designed to deliver exceptional quality, long-lasting results, and a flawless finish.",
        'imagePath': "assets/images/Deluxe-Interior-Painiting.jpeg",
        'serviceDetail':[
          {
            'header': 'Scope of Work',
            'data':[
              'Paint Application: Two coats of high-grade paint on walls, ceilings, and trims for superior coverage and durability.',
              'Surface Preparation: Comprehensive preparation, including crack filling, leveling, and thorough sanding, to ensure a perfect foundation.',
            ]
          },
          {
            'header': 'Premium Paint Selections',
            'data':[
              'Asian Paints Royale Aspira: Offers a luxurious matte finish with anti-fungal, stain-resistant properties and excellent washability.',
              'Berger Silk Glamor: A high-sheen, durable paint ideal for creating a sophisticated and stain-resistant interior.',
              'Dulux Velvet Touch: Delivers a soft sheen finish, adding a modern and elegant touch to any space.',
            ]
          },
          {
            'header': 'Additional Services',
            'data':[
              'Color Consultation: Expert advice on selecting the ideal color schemes and combinations to match your vision and style.',
            ]
          },
          {
            'header': 'Ideal For',
            'data':[
              'Homeowners who prioritize luxury, aesthetics, and long-term protection. This package is perfect for those seeking to enhance their spaces with an impeccable, high-end finish.',
              'Transform your interiors into a masterpiece with our premium painting service!',
            ]
          },
        ],
      },
      {
        'title': "Rental Painting",
        'rating': 4.8,
        'reviews': 5,
        'price': 8,
        'description':
        "This package is tailored for rental properties requiring a quick and budget-friendly refresh, either before welcoming new tenants or vacating. It prioritizes speed and cost-effectiveness without compromising quality.",
        'imagePath': "assets/images/Rental-Interior-Painintg.jpeg",
        'serviceDetail':[
          {
            'header': 'Scope:',
            'data':[
              'Single coat of paint for walls and ceilings in neutral shades.',
              'Focused on affordability and fast turnaround.',
            ]
          },
          {
            'header': 'Surface Preparation:',
            'data':[
              'Basic wall cleaning, minor sanding, and patching before painting.',
            ]
          },
          {
            'header': 'Products Used:',
            'data':[
              'Berger Bison Distemper: Quick-drying and economical.',
              'Asian Paints Apcolite Premium Emulsion: Durable and provides good coverage at a reasonable price.',
              'Indigo Acrylic Laminate: Resistant to dirt and grime, offering excellent value.',
            ]
          },
          {
            'header': 'Add-ons:',
            'data':[
              'Quick-drying paint options for faster turnover.',
            ]
          },
          {
            'header': 'Best For:',
            'data':[
              'Landlords prepping a property for new tenants.',
              'Tenants restoring a home to its original condition before moving out.',
            ]
          },
        ],
      },
    ]
  },
  {
    'category': "Exterior Painting",
    'id': 2,
    'imagePath': "assets/images/Red-White-Exterior.jpeg",
    'data': [
      {
        'title': "Exterior Painting",
        'rating': 4.8,
        'reviews': 5,
        'price': 20,
        'description':
        "Safeguard and beautify your home's exterior with this comprehensive package. Designed to endure harsh weather conditions, it ensures lasting protection and enhances curb appeal.",
        'imagePath': "assets/images/Exterior-Painitng.jpeg",
        'serviceDetail':[
          {
            'header': 'Scope:',
            'data':[
              'Two coats of high-quality exterior-grade paint for walls, trims, and other exposed surfaces.',
            ]
          },
          {
            'header': 'Surface Preparation:',
            'data':[
              'Power washing, crack filling, and necessary surface repairs.',
            ]
          },
          {
            'header': 'Products Used:',
            'data':[
              'Asian Paints Apex Ultima: Superior protection against dirt, rain, and UV rays with a durable finish.',
              'Berger WeatherCoat Long Life: Highly durable, dirt-resistant, and UV-protective.',
              'Nerolac Excel Anti-Peel: Prevents peeling and shields against weather damage.',
            ]
          },
          {
            'header': 'Add-ons:',
            'data':[
              'Waterproofing treatments for enhanced protection.',
            ]
          },
          {
            'header': 'Best For:',
            'data':[
              'Homes facing extreme weather conditions.',
              'Those seeking a durable and visually appealing exterior.',
            ]
          },
        ],
      },
    ]
  },
  {
    'category': "Specialty & Decorative",
    'id': 3,
    'imagePath': "assets/images/Red-Decorative-Wall.jpeg",
    'data': [
      {
        'title': "Wall Stencil & Custom Designs",
        'rating': 4.8,
        'reviews': 5,
        'price': 60,
        'description':
        "Elevate your home’s interiors with bespoke designs that showcase your style. This service offers artistic wall treatments, featuring elegant stencils and refined finishes that breathe life into your living spaces.",
        'imagePath': "assets/images/Custom-Design-Painitng.jpeg",
        'serviceDetail':[
          {
            'header': 'Scope:',
            'data':[
              'Application of intricate stencil designs or custom finishes across one or more walls, tailored to your vision.',
            ]
          },
          {
            'header': 'Surface Preparation:',
            'data':[
              'Walls are carefully cleaned, primed, and leveled to ensure a seamless and polished result.',
            ]
          },
          {
            'header': 'Products Offered:',
            'data':[
              'Asian Paints Royale Play: Perfect for achieving artistic textures and creative elegance.',
              'Dulux Ambiance Velvet Touch: Known for its smooth finish and variety of design options.',
              'Berger Silk Illusions: Provides stunning decorative effects for a luxurious appeal.',
            ]
          },
          {
            'header': 'Additional Features:',
            'data':[
              'Custom color matching and exclusive stencil designs for a tailored look.',
            ]
          },
          {
            'header': 'Perfect For:',
            'data':[
              'Enhancing plain walls with eye-catching designs.',
              'Adding a stylish and personalized touch to bedrooms, living rooms, or office spaces.',
            ]
          },
        ],
      },
      {
        'title': "Textured Finishes & Wall Artwork",
        'rating': 4.8,
        'reviews': 5,
        'price': 100,
        'description':
        "Enhance your home with textured walls and custom art, transforming ordinary spaces into extraordinary works of art. This service offers a range of textures and unique murals, from luxurious marble finishes to intricate stucco and hand-painted designs, creating a personalized, artistic atmosphere.",
        'imagePath': "assets/images/Wall-Art-Painting.jpeg",
        'serviceDetail':[
          {
            'header': 'Scope:',
            'data':[
              'Application of customized textures or hand-painted art to walls, tailored to your aesthetic preferences.',
            ]
          },
          {
            'header': 'Surface Preparation:',
            'data':[
              'Thorough priming and surface treatment to ensure a smooth, flawless application of textures or artistic finishes.',
            ]
          },
          {
            'header': 'Products Used:',
            'data':[
              'Asian Paints Royale Play: Offers a variety of textures, including stucco, marble, and metallic finishes.',
              'Berger Silk Glamour Metallic: Provides a sophisticated metallic sheen for a modern, luxurious effect.',
              'Nerolac Impressions Art Effects: Perfect for creating intricate texture finishes and artistic wall effects.',
            ]
          },
          {
            'header': 'Add-ons:',
            'data':[
              'Custom hand-painted murals and designs crafted by skilled artists for a truly personalized touch.',
            ]
          },
          {
            'header': 'Ideal For:',
            'data':[
              'Homes looking to add an artistic, luxurious transformation, especially in living rooms, bedrooms, or entertainment spaces.',
            ]
          },
        ],
      },
      {
        'title': "Accent & Statement Wall Painting",
        'rating': 4.8,
        'reviews': 5,
        'price': 80,
        'description':
        "This package is crafted to create striking, bold accent walls that become the centerpiece of any room. Ideal for living rooms, bedrooms, or any space that needs a pop of personality, it transforms interiors with custom colors and textures.",
        'imagePath': "assets/images/Wall-Statement-Painting.jpeg",
        'serviceDetail':[
          {
            'header': 'Scope:',
            'data':[
              'Application of vibrant or textured paint to selected walls, designed to make a bold statement.',
            ]
          },
          {
            'header': 'Surface Preparation:',
            'data':[
              'Careful surface preparation to ensure a flawless application of vibrant or textured finishes.',
            ]
          },
          {
            'header': 'Products Used:',
            'data':[
              'Asian Paints Royale Touche: Delivers a luxurious high-gloss finish for an ultra-smooth, refined look.',
              'Dulux Velvet Touch Diamond Glo: A high-sheen finish that adds a touch of sophistication, perfect for accentuating walls.',
              'Indigo Metallic Paint: Rich metallic finishes that add depth and sparkle to your feature walls.',
            ]
          },
          {
            'header': 'Add-Ons:',
            'data':[
              'Custom wall treatments including textures and specialty finishes to create a truly unique effect.',
            ]
          },
          {
            'header': 'Ideal For:',
            'data':[
              'Rooms that need a striking, one-of-a-kind design, such as living rooms, dining areas, or entertainment spaces.',
            ]
          },
        ],
      },
    ]
  },
  {
    'category': "Woodwork & Cabinetry",
    'id': 4,
    'imagePath': "assets/images/Red-Wooden-Cabinet.jpeg",
    'data': [
      {
        'title': "Woodwork Polishing",
        'rating': 4.8,
        'reviews': 5,
        'price': 30,
        'description':
        "Restore and elevate the elegance of your wooden furniture, doors, and panels with a premium polishing service. This treatment enhances the natural shine of wood while offering lasting protection against wear and tear.",
        'imagePath': "assets/images/Wood-Work-Painting.jpeg",
        'serviceDetail':[
          {
            'header': 'Scope:',
            'data':[
              'Professional polishing of wooden surfaces, including furniture, doors, windows, and trims.',
            ]
          },
          {
            'header': 'Surface Preparation:',
            'data':[
              'Sanding to smooth out imperfections, minor repairs, and thorough cleaning to ensure a perfect finish.',
            ]
          },
          {
            'header': 'Products Used:',
            'data':[
              'Asian Paints Woodtech PU Polish: Delivers a rich, luxurious finish with enduring protection.',
              'Berger Imperia Gold: High-quality polish that provides a glossy, durable shine.',
              'Indigo Wood Stains and Polish: Available in various tones for enhancing the natural beauty of wood.',
            ]
          },
          {
            'header': 'Polish Options:',
            'data':[
              'Choose from matte, semi-gloss, or high-gloss finishes based on your preferred style.',
            ]
          },
          {
            'header': 'Ideal For:',
            'data':[
              'Homeowners who wish to rejuvenate the look and durability of wooden furnishings, doors, and panels.',
            ]
          },
        ],
      },
      {
        'title': "Cabinet Refinishing",
        'rating': 4.8,
        'reviews': 5,
        'price': 60,
        'description':
        "Give your kitchen or bathroom a stylish makeover by repainting cabinets, drawers, and shelves. This cost-effective service refreshes your space, offering a modern look without the expense of full replacements.",
        'imagePath': "assets/images/Wood-Cabinet-Painting.jpeg",
        'serviceDetail':[
          {
            'header': 'Scope:',
            'data':[
              'Repainting of kitchen and bathroom cabinets, drawers, and shelving units.',
            ]
          },
          {
            'header': 'Surface Preparation:',
            'data':[
              'Thorough cleaning, sanding, and priming to ensure smooth adhesion of paint.',
            ]
          },
          {
            'header': 'Products Used:',
            'data':[
              'Asian Paints Royale Touche for Cabinets: Provides a sleek, high-sheen finish that is easy to maintain.',
              'Nerolac Enamel for Cabinets: Durable and glossy, resistant to stains and wear.',
              'Indigo PU Super Gloss Enamel: Offers a high-gloss finish for wood with superior durability.',
            ]
          },
          {
            'header': 'Paint Options:',
            'data':[
              'Choose from high-gloss, semi-gloss, or matte finishes based on your desired look.',
            ]
          },
          {
            'header': 'Add-ons:',
            'data':[
              'Removal and reinstallation of hardware, plus minor repairs for a complete transformation.',
            ]
          },
          {
            'header': 'Ideal For:',
            'data':[
              'Homeowners who want a budget-friendly way to modernize their kitchen or bathroom cabinets and shelving.',
            ]
          },
        ],
      },
    ]
  },
];

class PaintingDetailsScreen extends StatefulWidget {
  static String tag = '/Painting';
  final String? serviceType;
  PaintingDetailsScreen({super.key, this.serviceType});

  @override
  State<PaintingDetailsScreen> createState() => _PaintingDetailsScreenState();
}

class _PaintingDetailsScreenState extends State<PaintingDetailsScreen> {
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
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     extendBody: true,
  //     backgroundColor: AppColors.grey,
  //     appBar: AppBar(
  //       title: const Text(
  //         "Painting Services",
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
  //           serviceTypeList: ['Basic', 'Standard','Premium','Rental'],
  //           serviceSubTypeList:
  //           ['1 BHK', '2 BHK', '3 BHK', '4 BHK',],
  //           sectionKeys: _sectionKeys,
  //         ),
  //           //     const SectionHeader(title: 'Professional Painting Services'),
  //           // Padding(
  //           //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //           //   child: Text(
  //           //     'Experience top-notch painting for your home or office. Our expert painters ensure every corner is vibrant. Book your service today and enjoy a beautifully painted environment.',
  //           //
  //           //     style: TextStyle(fontSize: contentSize, height: 1.4),
  //           //   ),
  //           // ),
  //           //     CustomWidgets.buildCustomListSection('Services Offered:', [
  //           //     'Interior painting',
  //           //     'Exterior painting',
  //           //     'Wallpaper installation and removal',
  //           //     'Cabinet painting',
  //           //     'Texture painting',
  //           //   ]),
  //           //   CustomWidgets.buildCustomListSection('Quality of Materials:', [
  //           //       'High-Quality Paints: A reputable painter will use high-quality paints to ensure a durable and long-lasting finish.',
  //           //       'Eco-Friendly Options: Consider companies that offer eco-friendly and low-VOC paints.',
  //           //   ]),
  //           //   CustomWidgets.buildCustomListSection('Preparation and Protection:', [
  //           //       'Thorough Preparation: A good painter will properly prepare the surfaces by cleaning, sanding, and priming to ensure a smooth and even finish.',
  //           //       'Protection of Surfaces: The painter should protect floors, furniture, and other surfaces from paint spills and splatters.',
  //           //
  //           //       ]),
  //           //   CustomWidgets.buildCustomListSection('Additional Benefits:', [
  //           //     "Free Estimates: No-obligation quotes for all painting services.",
  //           //     "Satisfaction Guarantee: We're committed to your satisfaction.",
  //           //     "Ask Questions: Dont hesitate to ask questions about the companys experience, materials, and pricing.",
  //           //
  //           //     ]),
  //           //     SizedBox(height: 10),
  //           //     // Center(
  //           //     //   child: ElevatedButton(
  //           //     //     onPressed: () {},
  //           //     //     style: ElevatedButton.styleFrom(
  //           //     //       backgroundColor: Colors.red,
  //           //     //       padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
  //           //     //     ),
  //           //     //     child: Text('Book Now',
  //           //     //         style: TextStyle(
  //           //     //             color: Colors.white, fontWeight: FontWeight.bold)),
  //           //     //   ),
  //           //     // ),
  //           //     Divider(),
  //           //     CustomWidgets.cardSection( 'Reasons to Hire Professional House Cleaning Service: ',
  //           //        [
  //           //     'Ease & Convenience: No need to take on the hard work yourself. Let interior painters handle it!',
  //           //     'Professional Finish: Get a sleek look only professional painting services can provide.',
  //           //     'Cost-Effective: Know the house painting cost upfront and save on unexpected expenses.',
  //           //       ],
  //           //     ),
  //           //     const SizedBox(height: 20),
  //           //     const SectionHeader(title:
  //           //       'All About House Painting',
  //           //     ),
  //           //     const SectionHeader(title:'Refresh Your Space with GharKaSathis Painting Services'),
  //           //     const SizedBox(height: 8),
  //           //     Padding(
  //           //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //           //       child: const Text(
  //           //         'If youre thinking of refreshing your space, our painting services for home are just what you need. Make your home feel new again with GharKaSathis top-notch house painting services',
  //           //         style: TextStyle(fontSize: contentSize, color: Colors.black87),
  //           //       ),
  //           //     ),
  //           //     CustomWidgets.buildCustomListSection('Painting Services Offered by GharKaSathi', [
  //           //         'Residential Painting:',
  //           //         '1BHK to 3BHK+: Whether you have a cozy apartment or a spacious home, weve got you covered.',
  //           //         'Villa: Exclusive exterior and interior painting tailored for luxurious living.',
  //           //         'Commercial Painting:',
  //           //         'Retail Spaces & Stores: Make your shop stand out.',
  //           //         'Offices: Boost employee morale with fresh walls.',
  //           //         'Hotels & Hospitals: Ensure a welcoming environment for guests and patients.',
  //           //     ]),
  //           //     CustomWidgets.buildCustomListSection('What is Involved in the House Painting Process?', [
  //           //         'Consultation: Discuss your needs and get a quote.',
  //           //         'Preparation: Clean walls and protect furniture.',
  //           //         'Painting: Professionals get to work, whether its wall painting services or exterior jobs.',
  //           //         'Clean-Up: Leave your space tidy and fresh.',
  //           //         ]),
  //           //     CustomWidgets.buildCustomListSection('Paint Brands Available with GharKaSathi', [
  //           //         'Asian Paint',
  //           //         'Berger Paint',
  //           //         'Nippon Paint',
  //           //         'Indigo Paint',
  //           //         'Dulux Paint',
  //           //         'Nerolac Paint',
  //           //         'More Brands',
  //           //         'To guarantee longevity and vivid finishes, ensuring top-tier wall painting services.',
  //           //     ]),
  //           //     CustomWidgets.buildCustomListSection('Optimal Paint Choices for Each Room in Your Home', [
  //           //         'Living Room:',
  //           //         'Colors: Neutral shades like beige, taupe, and gray allow for versatile decor. Warmer shades like olive, muted blue, or coral can make the room feel inviting.',
  //           //         'Finish: Satin or eggshell finish, as these are durable and slightly shiny, making the room look lively.',
  //           //         'Kitchen:',
  //           //         'Colors: Bright and cheerful colors like light yellow, sky blue, or soft green can make the space feel clean and energetic. Whites and off-whites are classic and give a sense of cleanliness.',
  //           //         'Finish: Semi-gloss or satin finish as they are easy to wipe and resist moisture and stains.',
  //           //         'Bedroom:',
  //           //         'Colors: Calming and restful colors like lavender, soft gray, pale blue, or even muted greens and pinks. For a bolder look, navy blue or deep green can create a cozy environment.',
  //           //         'Finish: Eggshell or matte finish to give a calm and soft appearance.',
  //           //         'Bathroom:',
  //           //         'Colors: Light blues, greens, or even neutral tones can make the space feel clean and spa-like. Brighter colors like turquoise or coral can make the space pop.',
  //           //         'Finish: Semi-gloss or gloss finish, as they resist humidity and are easy to clean.',
  //           //         'Home Office:',
  //           //         'Colors: Colors that stimulate productivity and focus like blues, greens, or even energetic colors like orange in softer tones. Light browns and grays can also create a serious and focused ambiance.',
  //           //         'Finish: Eggshell or satin finish for durability without too much shine.',
  //           //         'Dining Room:',
  //           //         'Colors: Reds have traditionally been chosen for dining areas as they stimulate appetite. However, modern dining rooms also look great in deep blues, greens, or even charcoal.',
  //           //         'Finish: Satin finish for a slightly elegant shine.',
  //           //         'Childrens Room:',
  //           //         'Colors: Depending on age and preference, anything from pastels like baby blue and pink to vibrant colors like bright yellow, red, or green. Wall murals or patterns are also popular.',
  //           //         'Finish: Eggshell or satin finish as theyre durable against scuffs but not too shiny.',
  //           //         'Hallways & Stairs:',
  //           //         'Colors: Neutrals like beige, gray, or taupe. Light colors can open up the space, making it feel larger and brighter.',
  //           //         'Finish: Eggshell or semi-gloss, as these areas tend to have more traffic and might need more frequent cleaning.',
  //           //         'Ready to transform your space? With GharKaSathis professional painting services, its never been easier. Contact us now and find the best painters near me to make your painting dreams come true.',
  //           //         ]),
  //           //     SizedBox(height: 30),
  //             ],
  //           ),
  //         );
  // }

  @override
  Widget build(BuildContext context) {
    return BaseServiceScreen(
      title: "Painting Services",
      serviceType: widget.serviceType,
      services: services, // Use the predefined services list
                serviceTypeList: ['Basic', 'Standard','Premium','Rental'],
                serviceSubTypeList:
                ['1 BHK', '2 BHK', '3 BHK', '4 BHK',],
    );
  }
}

