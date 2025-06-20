// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ghar_ka_sathi/component/submit_query_form_component.dart';
// import 'package:ghar_ka_sathi/controller/property_service_controller.dart';
// import 'package:ghar_ka_sathi/utils/constant.dart';
// import 'package:ghar_ka_sathi/utils/custom_widget.dart';
//
// class ProjectManagmentDetailsScreen extends StatefulWidget {
//   const ProjectManagmentDetailsScreen({super.key});
//
//   @override
//   State<ProjectManagmentDetailsScreen> createState() =>
//       _ProjectManagmentDetailsScreenState();
// }
//
// class _ProjectManagmentDetailsScreenState extends State<ProjectManagmentDetailsScreen> {
//   TextEditingController serviceCategoryText = TextEditingController();
//   TextEditingController name = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController address = TextEditingController();
//   TextEditingController date = TextEditingController();
//   TextEditingController time = TextEditingController();
//   TextEditingController mobile = TextEditingController();
//   final controller = Get.put(PropertyServiceController());
//
//   DateTime? _selectedDate;
//   TimeOfDay? _selectedTime;
//
//   // Function to pick a date
//   Future<void> _pickDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (pickedDate != null && pickedDate != _selectedDate) {
//       setState(() {
//         _selectedDate = pickedDate;
//       });
//     }
//   }
//
//
//   // Function to pick a time
//   Future<void> _pickTime(BuildContext context) async {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: _selectedTime ?? TimeOfDay.now(),
//     );
//     if (pickedTime != null && pickedTime != _selectedTime) {
//       setState(() {
//         _selectedTime = pickedTime;
//       });
//     }
//     print(_selectedTime);
//   }
//
//   // Function to format TimeOfDay to HH:mm
//   String formatTimeOfDay(TimeOfDay time) {
//     final localizations = MaterialLocalizations.of(context);
//     return localizations.formatTimeOfDay(time, alwaysUse24HourFormat: true);
//   }
//   // Sample data for services
//   String _selectedPropertyType = 'Commercial';
//
//   final List<Map<String, String>> services = [
//     {
//       "title": "Project Planning & Coordination",
//       "description":
//       "Tailored plans, timelines, and budgets to keep your project on track.",
//     },
//     {
//       "title": "Design & Development Supervision",
//       "description":
//       "Collaborating with architects and designers to bring your vision to life.",
//     },
//     {
//       "title": "Contractor & Vendor Management",
//       "description":
//       "Managing contractors and vendors to ensure quality work and timely delivery.",
//     },
//     {
//       "title": "Budget & Financial Oversight",
//       "description":
//       "Transparent financial management to avoid cost overruns.",
//     },
//     {
//       "title": "Quality Control",
//       "description":
//       "Regular inspections to maintain high standards throughout the project.",
//     },
//     {
//       "title": "Risk Management",
//       "description":
//       "Identifying and addressing potential risks early for smooth execution.",
//     },
//     // Add more services...
//   ];
//
//   final List<Map<String, String>> expertise = [
//     {
//       "title": "Expertise",
//       "description":
//       "Years of experience in managing diverse real estate projects.",
//     },
//     {
//       "title": "Timely Delivery",
//       "description":
//       "Ensuring projects stay on schedule without unnecessary delays.",
//     },
//     {
//       "title": "Tailored Solutions",
//       "description":
//       "Custom solutions for residential, commercial, and renovation projects.",
//     },
//     {
//       "title": "Clear Communication",
//       "description":
//       "Stay updated with real-time progress via our website and app.",
//     },
//     {
//       "title": "Cost Efficiency",
//       "description":
//       "Optimizing resources to keep projects within budget.",
//     },
//     // Add more expertise...
//   ];
//
//   final List<Map<String, String>> keyServices = [
//     {
//       "title": "Photography & Videography of Property",
//     },
//     {
//       "title": "Tenant Verification & Management",
//     },
//     {
//       "title": "Property Maintenance & Repairs",
//     },
//     {
//       "title": "Rental Income Assurance",
//     },
//     {
//       "title": "Legal Documentation & Compliance",
//     },
//     // Add more expertise...
//   ];
//
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//           CustomHeader(
//           title: 'Real Estate Project Management Services',
//           subtitle:
//           'At Gharkasathi, we ensure your projects are executed smoothly, on time, and within budget.Our team provides expert guidance from concept to completion for both residential and commercial projects.',
//
//         ),
//
//           const SizedBox(height: 16),
//             SectionHeader(title: 'Register for our Services'),
//             // buildRegistrationForm(),
//           SubmitQueryFormComponent(
//             serviceType: 'Project Management',
//             propertyTypeList: ['Commercial', 'Residential',] ,
//           ),
//
//           // const SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Card(
//               // margin: const EdgeInsets.symmetric(vertical: 8.0),
//               child: ListTile(
//                 // leading: const Icon(Icons.verified, color:  AppColors.appBarColor),
//                 title: Text('Experience seamless property management and legal expertise all in one place! We provide a complete solution for property owners,from legal documentation to tenant management. Our services include professional photography and videography to showcase your property, meticulous property maintenance, and verified tenant searches to ensure your rental income is reliable and stress-free.',
//                   style: TextStyle(fontSize: contentSize),
//                   // textAlign: TextAlign.justify,
//                 ),
//                 // subtitle: Text(items[index]['description']!),
//               ),
//             ),
//           ),
//             SectionHeader(title: 'Our Services Include:'),
//             ServiceList(
//                 items:services),
//             const SizedBox(height: 16),
//             SectionHeader(title: 'Why Choose Us?'),
//             ServiceList(
//                 items:expertise),
//             const SizedBox(height: 16),
//             SectionHeader(title: 'Key Services:'),
//             KeyServicesListWidget(items: keyServices),
//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );
//   }
// }



// main.dart
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghar_ka_sathi/view/real_eastate/activity_details_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/add_property_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/all_property_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/collect_rent_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/document_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/maintanance_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/property_details_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/quick_action_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ProjectManagmentDetailsScreen());
}

class ProjectManagmentDetailsScreen extends StatelessWidget {
  const ProjectManagmentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PropManage',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
      routes: {
        '/add_property': (context) => const AddPropertyScreen(),
        '/collect_rent': (context) => const CollectRentScreen(),
        '/maintenance': (context) => const MaintenanceScreen(),
        '/documents': (context) => const DocumentsScreen(),
        '/properties': (context) => const PropertiesScreen(),
        '/tenants': (context) => const TenantsScreen(),
        '/services': (context) => const ServicesScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}

// theme/app_theme.dart

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFFE53935);
  static const Color accentColor = Color(0xFF4CAF50);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color cardColor = Colors.white;
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);

  // Status Colors
  static const Color occupiedColor = Color(0xFF4CAF50);
  static const Color vacantColor = Color(0xFFE53935);
  static const Color maintenanceColor = Color(0xFFFFB74D);

  // Icon Colors
  static const Color addIconColor = Color(0xFFFFCDD2);
  static const Color rentIconColor = Color(0xFFE8F5E9);
  static const Color maintenanceIconColor = Color(0xFFFFF8E1);
  static const Color documentsIconColor = Color(0xFFF5F5F5);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: textPrimary),
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: const CardThemeData(
        color: cardColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: textSecondary,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          color: textSecondary,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}

// models/property.dart
class Property {
  final String id;
  final String name;
  final String address;
  final String imageUrl;
  final PropertyStatus status;
  final int occupancyRate;
  final List<Unit> units;

  Property({
    required this.id,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.status,
    required this.occupancyRate,
    required this.units,
  });
}

enum PropertyStatus { occupied, vacant, maintenance }

class Unit {
  final String id;
  final String unitNumber;
  final PropertyStatus status;
  final double rent;
  final String? tenantName;

  Unit({
    required this.id,
    required this.unitNumber,
    required this.status,
    required this.rent,
    this.tenantName,
  });
}

// models/activity.dart
class Activity {
  final String id;
  final ActivityType type;
  final String description;
  final String propertyName;
  final String? unitNumber;
  final DateTime timestamp;

  Activity({
    required this.id,
    required this.type,
    required this.description,
    required this.propertyName,
    this.unitNumber,
    required this.timestamp,
  });
}

enum ActivityType { rentCollected, maintenanceRequest, newTenant }

// data/sample_data.dart

class SampleData {
  static List<Property> getProperties() {
    return [
      Property(
        id: '1',
        name: 'Skyline Apartments',
        address: '123 Main Street',
        imageUrl: 'assets/images/skyline.jpg',
        status: PropertyStatus.occupied,
        occupancyRate: 85,
        units: [
          Unit(
            id: '101',
            unitNumber: '304',
            status: PropertyStatus.occupied,
            rent: 1200,
            tenantName: 'John Doe',
          ),
          // Add more units as needed
        ],
      ),
      Property(
        id: '2',
        name: 'Riverside Complex',
        address: '456 River Road',
        imageUrl: 'assets/images/riverside.jpg',
        status: PropertyStatus.maintenance,
        occupancyRate: 60,
        units: [
          Unit(
            id: '201',
            unitNumber: '201',
            status: PropertyStatus.maintenance,
            rent: 950,
            tenantName: 'Alice Smith',
          ),
          // Add more units as needed
        ],
      ),
      // Add more properties as needed
    ];
  }

  static List<Activity> getActivities() {
    return [
      Activity(
        id: '1',
        type: ActivityType.rentCollected,
        description: 'Rent Collected',
        propertyName: 'Skyline Apartments',
        unitNumber: 'Unit 304',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Activity(
        id: '2',
        type: ActivityType.maintenanceRequest,
        description: 'Maintenance Request',
        propertyName: 'Riverside Complex',
        unitNumber: 'Unit 201',
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      Activity(
        id: '3',
        type: ActivityType.newTenant,
        description: 'Sarah Johnson signed lease',
        propertyName: 'Skyline Apartments',
        unitNumber: null,
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }

  static Map<PropertyStatus, int> getPropertyStatusCount() {
    final properties = getProperties();

    int occupied = 0;
    int vacant = 0;
    int maintenance = 0;

    for (var property in properties) {
      switch (property.status) {
        case PropertyStatus.occupied:
          occupied++;
          break;
        case PropertyStatus.vacant:
          vacant++;
          break;
        case PropertyStatus.maintenance:
          maintenance++;
          break;
      }
    }

    return {
      PropertyStatus.occupied: 8,
      PropertyStatus.vacant: 3,
      PropertyStatus.maintenance: 1,
    };
  }

  static double getMonthlyRevenue() {
    return 24000.0;
  }
}

// screens/home_screen.dart

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final properties = SampleData.getProperties();
  final activities = SampleData.getActivities();
  final statusCounts = SampleData.getPropertyStatusCount();
  final monthlyRevenue = SampleData.getMonthlyRevenue();

  // List of screens for bottom navigation
  final List<Widget> _screens = [
    const HomeContent(),
    const PropertiesScreen(),
    const TenantsScreen(),
    const ServicesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ? _screens[_currentIndex]
          : IndexedStack(
        index: _currentIndex - 1,
        children: _screens.sublist(1),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apartment),
          label: 'Properties',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Tenants',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_repair_service),
          label: 'Services',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.settings),
        //   label: 'Settings',
        // ),
      ],
    );
  }
}

// Create a separate widget for the home content
class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final properties = SampleData.getProperties();
    final activities = SampleData.getActivities();
    final statusCounts = SampleData.getPropertyStatusCount();
    final monthlyRevenue = SampleData.getMonthlyRevenue();

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildHeader(context),
            const SizedBox(height: 24),

            DashboardCardsCarousel(
              totalProperties: statusCounts.values.reduce((a, b) => a + b),
              occupiedCount: statusCounts[PropertyStatus.occupied] ?? 0,
              vacantCount: statusCounts[PropertyStatus.vacant] ?? 0,
              maintenanceCount: statusCounts[PropertyStatus.maintenance] ?? 0,
              revenue: monthlyRevenue,
              expense: monthlyRevenue * 0.6, // Example value
              profit: monthlyRevenue * 0.4, // Example value
            ),

            const SizedBox(height: 24),
            _buildQuickActions(context),

            const SizedBox(height: 24),
            _buildPropertiesSection(context, properties),

            const SizedBox(height: 24),
            _buildRecentActivities(context, activities),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.appBarColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.apartment,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'PropManage',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        // Row(
        //   children: [
        //     Stack(
        //       alignment: Alignment.topRight,
        //       children: [
        //         Container(
        //           decoration: BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.circular(12),
        //             boxShadow: [
        //               BoxShadow(
        //                 color: Colors.black.withOpacity(0.1),
        //                 blurRadius: 8,
        //                 offset: const Offset(0, 2),
        //               ),
        //             ],
        //           ),
        //           child: IconButton(
        //             icon: const Icon(Icons.notifications_outlined),
        //             onPressed: () {},
        //             color: AppColors.primaryColor,
        //           ),
        //         ),
        //         Positioned(
        //           right: 10,
        //           top: 10,
        //           child: Container(
        //             width: 10,
        //             height: 10,
        //             decoration: const BoxDecoration(
        //               color: AppColors.appBarColor,
        //               shape: BoxShape.circle,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //     const SizedBox(width: 12),
        //     Container(
        //       decoration: BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.circular(12),
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.black.withOpacity(0.1),
        //             blurRadius: 8,
        //             offset: const Offset(0, 2),
        //           ),
        //         ],
        //       ),
        //       child: GestureDetector(
        //         onTap: () {},
        //         child: const Padding(
        //           padding: EdgeInsets.all(8.0),
        //           child: CircleAvatar(
        //             radius: 14,
        //             backgroundColor: AppColors.bgColor,
        //             child: Icon(Icons.person, color: AppColors.appBarColor, size: 18),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.secondaryBtnLigRed.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child:  GestureDetector(
                onTap: () {
                  // Navigate to the QuickActionsScreen when "More" is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuickActionsScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBtnLigRed.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: const [
                      Text(
                        'More',
                        style: TextStyle(
                          color: AppColors.btnDarkRed,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.btnDarkRed,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),
            )],
            ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: QuickActionButton(
                icon: Icons.add,
                label: 'Add Property',
                backgroundColor: AppColors.secondaryBtnLigRed,
                iconColor: AppColors.btnDarkRed,
                onTap: () {
                  Navigator.pushNamed(context, '/add_property');
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: QuickActionButton(
                icon: Icons.payments_outlined,
                label: 'Collect Rent',
                backgroundColor: AppColors.secondaryBtnLigGreen,
                iconColor: AppColors.btnDarkGreen,
                onTap: () {
                  Navigator.pushNamed(context, '/collect_rent');
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: QuickActionButton(
                icon: Icons.build_outlined,
                label: 'Maintenance',
                backgroundColor: Color(0xFFFFF8E1),
                iconColor: Colors.amber[700]!,
                onTap: () {
                  Navigator.pushNamed(context, '/maintenance');
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: QuickActionButton(
                icon: Icons.description_outlined,
                label: 'Documents',
                backgroundColor: Color(0xFFE3F2FD),
                iconColor: Colors.blue[700]!,
                onTap: () {
                  Navigator.pushNamed(context, '/documents');
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPropertiesSection(BuildContext context, List<Property> properties) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Your Properties',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/all_properties');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBtnLigRed.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children:  [
 GestureDetector(
                      onTap: () {
                        // Navigate to the QuickActionsScreen when "More" is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AllPropertiesScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBtnLigRed.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              'More',
                              style: TextStyle(
                                color: AppColors.btnDarkRed,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward,
                              color: AppColors.btnDarkRed,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColors.btnDarkRed,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          // scrollDirection: Axis.horizontal,
          itemCount: properties.length > 3 ? 3 : properties.length,
          itemBuilder: (context, index) {
            return Container(
              width: 280,
              margin: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PropertyDetailsScreen(
                        property: properties[index],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: PropertyCardss(
                    property: properties[index],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildRecentActivities(BuildContext context, List<Activity> activities) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Activities',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to All Activities screen
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const AllActivitiesScreen(),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.secondaryBtnLigRed.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: const [
                    Text(
                      'View All',
                      style: TextStyle(
                        color: AppColors.btnDarkRed,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColors.btnDarkRed,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: activities.length > 4 ? 4 : activities.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () { Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActivityDetailsScreen(
                      activity: activities[index],
                    ),
                  ),
                );
                },
                child: ActivityItem(activity: activities[index]),
              ),
            );
          },
        ),
      ],
    );
  }
}

// widgets/property_summary_card.dart
class PropertySummaryCard extends StatelessWidget {
  final int totalProperties;
  final int occupiedCount;
  final int vacantCount;
  final int maintenanceCount;

  const PropertySummaryCard({
    Key? key,
    required this.totalProperties,
    required this.occupiedCount,
    required this.vacantCount,
    required this.maintenanceCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$totalProperties',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Properties',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            _buildStatusItem(
              context,
              count: occupiedCount,
              label: 'Occupied',
              color: AppTheme.occupiedColor,
            ),
            const SizedBox(height: 8),
            _buildStatusItem(
              context,
              count: vacantCount,
              label: 'Vacant',
              color: AppTheme.vacantColor,
            ),
            const SizedBox(height: 8),
            _buildStatusItem(
              context,
              count: maintenanceCount,
              label: 'Maintenance',
              color: AppTheme.maintenanceColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem(
      BuildContext context, {
        required int count,
        required String label,
        required Color color,
      }) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '$count $label',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

// widgets/revenue_card.dart

class RevenueCard extends StatelessWidget {
  final double revenue;

  const RevenueCard({
    Key? key,
    required this.revenue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: const Color(0xFF4CAF50),
      child: Container(
        height: 156,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Monthly',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '\$${revenue.toStringAsFixed(0)}k',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Divider(
              color: Colors.white,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}

// widgets/quick_action_button.dart

class QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onTap;

  const QuickActionButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.iconColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// widgets/property_card.dart

class PropertyCardss extends StatelessWidget {
  final Property property;

  const PropertyCardss({
    Key? key,
    required this.property,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                property.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, size: 50),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      property.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    _buildStatusChip(property.status),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: AppTheme.textSecondary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      property.address,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                LinearProgressIndicator(
                  value: property.occupancyRate / 100,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(_getStatusColor(property.status)),
                ),
                const SizedBox(height: 8),
                Text(
                  '${property.occupancyRate}% Occupied',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(PropertyStatus status) {
    String label;
    Color color;

    switch (status) {
      case PropertyStatus.occupied:
        label = 'Occupied';
        color = AppTheme.occupiedColor;
        break;
      case PropertyStatus.vacant:
        label = 'Vacant';
        color = AppTheme.vacantColor;
        break;
      case PropertyStatus.maintenance:
        label = 'Maintenance';
        color = AppTheme.maintenanceColor;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Color _getStatusColor(PropertyStatus status) {
    switch (status) {
      case PropertyStatus.occupied:
        return AppTheme.occupiedColor;
      case PropertyStatus.vacant:
        return AppTheme.vacantColor;
      case PropertyStatus.maintenance:
        return AppTheme.maintenanceColor;
    }
  }
}

// widgets/activity_item.dart
class ActivityItem extends StatelessWidget {
  final Activity activity;

  const ActivityItem({
    Key? key,
    required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: _buildActivityIcon(activity.type),
        title: Text(
          activity.description,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              activity.unitNumber != null
                  ? '${activity.propertyName} - ${activity.unitNumber}'
                  : activity.propertyName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              _formatTimeAgo(activity.timestamp),
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }

  Widget _buildActivityIcon(ActivityType type) {
    IconData iconData;
    Color backgroundColor;
    Color iconColor;

    switch (type) {
      case ActivityType.rentCollected:
        iconData = Icons.payments_outlined;
        backgroundColor = AppTheme.rentIconColor;
        iconColor = AppTheme.accentColor;
        break;
      case ActivityType.maintenanceRequest:
        iconData = Icons.build_outlined;
        backgroundColor = AppTheme.maintenanceIconColor;
        iconColor = AppTheme.maintenanceColor;
        break;
      case ActivityType.newTenant:
        iconData = Icons.person_add_outlined;
        backgroundColor = Colors.red[50]!;
        iconColor = AppTheme.primaryColor;
        break;
    }

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        color: iconColor,
        size: 20,
      ),
    );
  }

  String _formatTimeAgo(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'Just now';
    }
  }
}

// screens/properties_screen.dart

class PropertiesScreen extends StatelessWidget {
  const PropertiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final properties = SampleData.getProperties();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Properties'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: properties.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: PropertyCardss(property: properties[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// screens/tenants_screen.dart


class TenantsScreen extends StatelessWidget {
  const TenantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tenants'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tenant Management',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'This screen will allow you to manage tenants, view tenant profiles, track lease details, and handle tenant communications.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.people_outline,
                    size: 120,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Tenant Management Coming Soon',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new tenant action
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Add Tenant functionality coming soon')),
          );
        },
        backgroundColor: const Color(0xFFE53935),
        child: const Icon(Icons.person_add),
      ),
    );
  }
}

// screens/services_screen.dart

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample service categories
    final List<Map<String, String>> serviceCategories = [
      {
        'title': 'Cleaning Services',
        'icon': 'cleaning',
      },
      {
        'title': 'Plumbing Services',
        'icon': 'plumbing',
      },
      {
        'title': 'Electrical Services',
        'icon': 'electrical',
      },
      {
        'title': 'HVAC Services',
        'icon': 'hvac',
      },
      {
        'title': 'Landscaping',
        'icon': 'landscaping',
      },
      {
        'title': 'Security Services',
        'icon': 'security',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Property Services',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Find and schedule services for your properties. Manage service providers and track service history.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.2,
                ),
                itemCount: serviceCategories.length,
                itemBuilder: (context, index) {
                  final category = serviceCategories[index];

                  IconData iconData;
                  switch (category['icon']) {
                    case 'cleaning':
                      iconData = Icons.cleaning_services;
                      break;
                    case 'plumbing':
                      iconData = Icons.plumbing;
                      break;
                    case 'electrical':
                      iconData = Icons.electrical_services;
                      break;
                    case 'hvac':
                      iconData = Icons.hvac;
                      break;
                    case 'landscaping':
                      iconData = Icons.grass;
                      break;
                    case 'security':
                      iconData = Icons.security;
                      break;
                    default:
                      iconData = Icons.handyman;
                  }

                  return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${category['title']} coming soon')),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              iconData,
                              size: 48,
                              color: const Color(0xFFFFB74D),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              category['title']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// screens/settings_screen.dart

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          _buildProfileSection(),
          const Divider(height: 32),
          _buildSettingsGroup(
            title: 'Account Settings',
            settings: [
              _buildSettingItem(
                icon: Icons.account_circle_outlined,
                title: 'Profile Information',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profile settings coming soon')),
                  );
                },
              ),
              _buildSettingItem(
                icon: Icons.lock_outline,
                title: 'Security & Password',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Security settings coming soon')),
                  );
                },
              ),
              _buildSettingItem(
                icon: Icons.payment_outlined,
                title: 'Payment Methods',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Payment methods coming soon')),
                  );
                },
              ),
            ],
          ),
          const Divider(height: 32),
          _buildSettingsGroup(
            title: 'App Settings',
            settings: [
              _buildSettingItem(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Notification settings coming soon')),
                  );
                },
              ),
              _buildSettingItem(
                icon: Icons.language_outlined,
                title: 'Language',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Language settings coming soon')),
                  );
                },
              ),
              _buildSettingItem(
                icon: Icons.dark_mode_outlined,
                title: 'Theme',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Theme settings coming soon')),
                  );
                },
              ),
            ],
          ),
          const Divider(height: 32),
          _buildSettingsGroup(
            title: 'Support',
            settings: [
              _buildSettingItem(
                icon: Icons.help_outline,
                title: 'Help Center',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Help center coming soon')),
                  );
                },
              ),
              _buildSettingItem(
                icon: Icons.chat_bubble_outline,
                title: 'Contact Support',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Contact support coming soon')),
                  );
                },
              ),
              _buildSettingItem(
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy Policy',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Privacy policy coming soon')),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logout functionality coming soon')),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: const BorderSide(color: Colors.red),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Logout'),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              'App Version 1.0.0',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
            child: Icon(
              Icons.person,
              size: 36,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'John Smith',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'john.smith@example.com',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsGroup({
    required String title,
    required List<Widget> settings,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFFE53935),
            ),
          ),
        ),
        const SizedBox(height: 8),
        ...settings,
      ],
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    String? subtitle,
    Widget? trailing,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

// widgets/dashboard_cards_carousel.dart

class DashboardCardsCarousel extends StatefulWidget {
  final int totalProperties;
  final int occupiedCount;
  final int vacantCount;
  final int maintenanceCount;
  final double revenue;
  final double expense;
  final double profit;

  const DashboardCardsCarousel({
    Key? key,
    required this.totalProperties,
    required this.occupiedCount,
    required this.vacantCount,
    required this.maintenanceCount,
    required this.revenue,
    required this.expense,
    required this.profit,
  }) : super(key: key);

  @override
  State<DashboardCardsCarousel> createState() => _DashboardCardsCarouselState();
}

class _DashboardCardsCarouselState extends State<DashboardCardsCarousel> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    // Create a list of cards to display in the carousel
    final List<Widget> cards = [
      _buildPropertySummaryCard(context),
      _buildRevenueCard(context),
      _buildProfitCard(context),
    ];

    return Column(
      children: [
        CarouselSlider(
          items: cards,
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 230,
            viewportFraction: 0.92,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 12),
        _buildCarouselIndicator(),
      ],
    );
  }

  Widget _buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return GestureDetector(
          onTap: () {
            _carouselController.animateToPage(index);
          },
          child: Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == index
                  ? AppColors.appBarColor
                  : AppColors.secondaryBtnLigRed,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildPropertySummaryCard(BuildContext context) {
    // Calculate the occupancy rate
    final totalUnits = widget.occupiedCount + widget.vacantCount + widget.maintenanceCount;
    final occupancyRate = totalUnits > 0
        ? (widget.occupiedCount / totalUnits * 100).toInt()
        : 0;

    return Card(
      elevation: 4,
      shadowColor: AppColors.btnDarkRed.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, AppColors.bgColor],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Property Summary',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.appBarColor,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBtnLigRed,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${widget.totalProperties} Properties',
                    style: const TextStyle(
                      color: AppColors.btnDarkRed,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Occupancy Rate Indicator
            Row(
              children: [
                Text(
                  '$occupancyRate%',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.appBarColor,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Occupancy Rate',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Stack(
                        children: [
                          Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: occupancyRate / 100,
                            child: Container(
                              height: 6,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: AppColors.redGradient,
                                ),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            Row(
              children: [
                _buildStatusItem(
                  color: AppColors.btnDarkGreen,
                  icon: Icons.check_circle_outline,
                  count: widget.occupiedCount,
                  label: 'Occupied',
                ),
                const SizedBox(width: 8),
                _buildStatusItem(
                  color: AppColors.btnDarkRed,
                  icon: Icons.do_not_disturb_on_outlined,
                  count: widget.vacantCount,
                  label: 'Vacant',
                ),
                const SizedBox(width: 8),
                _buildStatusItem(
                  color: Colors.amber,
                  icon: Icons.construction_outlined,
                  count: widget.maintenanceCount,
                  label: 'Maintenance',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem({
    required Color color,
    required IconData icon,
    required int count,
    required String label,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 4),
            Text(
              count.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueCard(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: AppColors.btnDarkRed.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.redGradient,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Monthly Revenue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.trending_up,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              '\$${widget.revenue.toStringAsFixed(0)}k',
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  '+8.2% from last month',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Divider(
              color: Colors.white38,
              thickness: 1,
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'View Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfitCard(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: AppColors.btnDarkGreen.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.greenGradient,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Net Profit',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.bar_chart,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              '\$${widget.profit.toStringAsFixed(0)}k',
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.payments_outlined,
                  color: Colors.white,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  'Expenses: \$${widget.expense.toStringAsFixed(0)}k',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Divider(
              color: Colors.white38,
              thickness: 1,
            ),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Financial Report',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AllActivitiesScreen extends StatelessWidget {
  const AllActivitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activities = SampleData.getActivities();

    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'All Activities',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: activities.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(
                            context,
                            '/activity_details',
                            arguments: activities[index],
                          );
                        },
                        child: ActivityItem(activity: activities[index]),
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
}