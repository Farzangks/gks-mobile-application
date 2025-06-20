import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Property Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),
      home: const MyPortfolioPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyPortfolioPage extends StatefulWidget {
  const MyPortfolioPage({Key? key}) : super(key: key);

  @override
  State<MyPortfolioPage> createState() => _MyPortfolioPageState();
}

class _MyPortfolioPageState extends State<MyPortfolioPage> {
  String _selectedFilter = 'All Properties';
  final List<String> _filters = ['All Properties', 'Rented', 'Available'];

  // Current page index for bottom navigation
  int _currentPageIndex = 0;

  // Pages to display based on bottom navigation selection
  final List<Widget> _pages = [
    const PortfolioDashboard(),
    const AddPropertyPage(),
    const ManageTenantsPage(),
    const SharePortfolioPage(),
    const DownloadReportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages[_currentPageIndex],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
    );
  }
}

// Main Portfolio Dashboard (previously the content of MyPortfolioPage)
class PortfolioDashboard extends StatefulWidget {
  const PortfolioDashboard({Key? key}) : super(key: key);

  @override
  State<PortfolioDashboard> createState() => _PortfolioDashboardState();
}

class _PortfolioDashboardState extends State<PortfolioDashboard> {
  String _selectedFilter = 'All Properties';
  final List<String> _filters = ['All Properties', 'Rented', 'Available'];

  // Create a list of all properties
  final List<Map<String, dynamic>> _allProperties = [
    {
      'title': 'Luxury Downtown Apartment',
      'address': '123 Main St, New York',
      'status': 'Rented',
      'price': '\$3,200',
      'imageAsset': 'assets/images/apartment.jpg',
      'bedrooms': 2,
      'bathrooms': 2,
      'area': '1,200 sq ft',
      'description': 'Modern luxury apartment in the heart of downtown with stunning city views. Features high-end appliances, hardwood floors, and a spacious balcony.',
    },
    {
      'title': 'Beachfront Villa',
      'address': '456 Ocean Dr, Miami',
      'status': 'Available',
      'price': '\$5,400',
      'imageAsset': 'assets/images/villa.jpg',
      'bedrooms': 4,
      'bathrooms': 3,
      'area': '2,800 sq ft',
      'description': 'Spectacular beachfront villa with direct access to the beach. Features a private pool, outdoor kitchen, and panoramic ocean views from every room.',
    },
    {
      'title': 'Modern Townhouse',
      'address': '789 Park Ave, Chicago',
      'status': 'Under Maintenance',
      'price': '\$2,800',
      'imageAsset': 'assets/images/townhouse.jpg',
      'bedrooms': 3,
      'bathrooms': 2.5,
      'area': '1,800 sq ft',
      'description': 'Contemporary townhouse in a quiet neighborhood with easy access to parks and shopping. Features an open floor plan, updated kitchen, and attached garage.',
    },
  ];

  // Filtered properties based on selected filter
  List<Map<String, dynamic>> _filteredProperties = [];

  @override
  void initState() {
    super.initState();
    // Initialize filtered properties with all properties
    _filteredProperties = List.from(_allProperties);
  }

  // Filter properties based on selected filter
  void _filterProperties(String filter) {
    setState(() {
      _selectedFilter = filter;

      if (filter == 'All Properties') {
        _filteredProperties = List.from(_allProperties);
      } else {
        _filteredProperties = _allProperties
            .where((property) => property['status'] == filter)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        const DashboardHeader(
          title: 'Portfolio Dashboard',
          propertyCount: 12,
        ),

        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              // Stats Cards
              const SizedBox(height: 16),
              const Row(
                children: [
                  Expanded(
                    child: StatsCard(
                      icon: Icons.attach_money,
                      iconColor: Colors.red,
                      value: '\$45,320',
                      label: 'Total Revenue',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: StatsCard(
                      icon: Icons.home,
                      iconColor: Colors.red,
                      value: '8',
                      label: 'Active Properties',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: StatsCard(
                      icon: Icons.people,
                      iconColor: Colors.red,
                      value: '15',
                      label: 'Active Tenants',
                    ),
                  ),
                ],
              ),

              // Monthly Earnings Chart
              const SizedBox(height: 24),
              const CustomBarChart(),

              // Filter Tabs
              const SizedBox(height: 16),
              FilterTabs(
                tabs: _filters,
                selectedTab: _selectedFilter,
                onTabSelected: (value) {
                  _filterProperties(value);
                },
              ),

              // Property Cards (now using filtered properties)
              const SizedBox(height: 16),

              // Display the filtered properties
              if (_filteredProperties.isEmpty)
                SizedBox(
                  height: 200,
                  child: Center(
                    child: Text(
                      'No properties found for the selected filter',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                )
              else
                ..._filteredProperties.map((property) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: PropertyCards(
                      title: property['title'],
                      address: property['address'],
                      status: property['status'],
                      price: property['price'],
                      imageAsset: property['imageAsset'],
                      // Add onTap to navigate to the property details page
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PropertyDetailsPage(property: property),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}

// Add Property Page
class AddPropertyPage extends StatelessWidget {
  const AddPropertyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                'Add New Property',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const PropertyForm(),
        ],
      ),
    );
  }
}

// Property Form Widget
class PropertyForm extends StatefulWidget {
  const PropertyForm({Key? key}) : super(key: key);

  @override
  State<PropertyForm> createState() => _PropertyFormState();
}

class _PropertyFormState extends State<PropertyForm> {
  final _formKey = GlobalKey<FormState>();
  String _propertyType = 'Residential';
  final List<String> _propertyTypes = ['Residential', 'Commercial', 'Industrial'];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Type Dropdown
          const Text(
            'Property Type',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: _propertyType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            ),
            items: _propertyTypes.map((type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _propertyType = value!;
              });
            },
          ),

          const SizedBox(height: 16),

          // Property Title
          const Text(
            'Property Title',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter property title',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter property title';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // Property Address
          const Text(
            'Property Address',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter property address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter property address';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // Monthly Price
          const Text(
            'Monthly Price',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter monthly price',
              prefixText: '\$ ',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter monthly price';
              }
              return null;
            },
          ),

          const SizedBox(height: 16),

          // Property Status
          const Text(
            'Property Status',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: 'Available',
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            ),
            items: const [
              DropdownMenuItem<String>(
                value: 'Available',
                child: Text('Available'),
              ),
              DropdownMenuItem<String>(
                value: 'Rented',
                child: Text('Rented'),
              ),
              DropdownMenuItem<String>(
                value: 'Under Maintenance',
                child: Text('Under Maintenance'),
              ),
            ],
            onChanged: (value) {},
          ),

          const SizedBox(height: 24),

          // Add Property Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Process form data
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Property added successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Add Property',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Manage Tenants Page
class ManageTenantsPage extends StatelessWidget {
  const ManageTenantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Manage Tenants',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D3D3D),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.red),
                onPressed: () {
                  // Add new tenant action
                },
              ),
            ],
          ),
        ),

        // Search Bar
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search tenants...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),

        // Tenant List
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              TenantCard(
                name: 'John Smith',
                property: 'Luxury Downtown Apartment',
                leaseEnd: '12/31/2025',
                imageAsset: 'assets/images/tenant1.jpg',
              ),
              SizedBox(height: 16),
              TenantCard(
                name: 'Sarah Johnson',
                property: 'Modern Townhouse',
                leaseEnd: '06/15/2026',
                imageAsset: 'assets/images/tenant2.jpg',
              ),
              SizedBox(height: 16),
              TenantCard(
                name: 'Michael Brown',
                property: 'Beachfront Villa',
                leaseEnd: '03/22/2026',
                imageAsset: 'assets/images/tenant3.jpg',
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}

// Tenant Card Widget
class TenantCard extends StatelessWidget {
  final String name;
  final String property;
  final String leaseEnd;
  final String imageAsset;

  const TenantCard({
    Key? key,
    required this.name,
    required this.property,
    required this.leaseEnd,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Tenant Image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Tenant Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3D3D3D),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    property,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Lease Ends: $leaseEnd',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            // Action Buttons
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.phone, color: Colors.green),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.message, color: Colors.blue),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Share Portfolio Page
class SharePortfolioPage extends StatelessWidget {
  const SharePortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: const Row(
            children: [
              Text(
                'Share Portfolio',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D3D3D),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // QR Code
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.qr_code,
                      size: 160,
                      color: Colors.grey[800],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Portfolio Link
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'portfolio.gharKaSathi.com/user12345',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy, color: Colors.red),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Link copied to clipboard!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Share Options
                const Text(
                  'Share via',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3D3D3D),
                  ),
                ),

                const SizedBox(height: 24),

                // Share Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShareOptionButton(
                      icon: Icons.email,
                      label: 'Email',
                      color: Colors.red,
                      onTap: () {},
                    ),
                    ShareOptionButton(
                      icon: Icons.message,
                      label: 'SMS',
                      color: Colors.green,
                      onTap: () {},
                    ),
                    ShareOptionButton(
                      icon: Icons.call,
                      label: 'WhatsApp',
                      color: Colors.green.shade700,
                      onTap: () {},
                    ),
                    ShareOptionButton(
                      icon: Icons.share,
                      label: 'More',
                      color: Colors.blue,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Share Option Button Widget
class ShareOptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const ShareOptionButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 30,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

// Download Report Page
class DownloadReportPage extends StatelessWidget {
  const DownloadReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: const Row(
            children: [
              Text(
                'Download Reports',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D3D3D),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: const [
                ReportCard(
                  title: 'Monthly Income Statement',
                  description: 'A detailed report of all income and expenses for the current month',
                  fileSize: '2.4 MB',
                  fileType: 'PDF',
                  iconData: Icons.description,
                ),
                SizedBox(height: 16),
                ReportCard(
                  title: 'Property Performance Analysis',
                  description: 'Analysis of how each property is performing in terms of ROI and occupancy',
                  fileSize: '3.8 MB',
                  fileType: 'PDF',
                  iconData: Icons.analytics,
                ),
                SizedBox(height: 16),
                ReportCard(
                  title: 'Tenant Payment History',
                  description: 'Record of all tenant payments and outstanding amounts',
                  fileSize: '1.2 MB',
                  fileType: 'XLS',
                  iconData: Icons.history,
                ),
                SizedBox(height: 16),
                ReportCard(
                  title: 'Maintenance Schedule',
                  description: 'Upcoming and completed maintenance activities for all properties',
                  fileSize: '0.9 MB',
                  fileType: 'PDF',
                  iconData: Icons.build,
                ),
                SizedBox(height: 16),
                ReportCard(
                  title: 'Annual Tax Report',
                  description: 'Summary of all income and expenses for tax purposes',
                  fileSize: '4.5 MB',
                  fileType: 'PDF',
                  iconData: Icons.receipt_long,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Report Card Widget
class ReportCard extends StatelessWidget {
  final String title;
  final String description;
  final String fileSize;
  final String fileType;
  final IconData iconData;

  const ReportCard({
    Key? key,
    required this.title,
    required this.description,
    required this.fileSize,
    required this.fileType,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color iconColor;
    switch (fileType) {
      case 'PDF':
        iconColor = Colors.red;
        break;
      case 'XLS':
        iconColor = Colors.green;
        break;
      default:
        iconColor = Colors.blue;
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Report Icon
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                iconData,
                color: iconColor,
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            // Report Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3D3D3D),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: iconColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          fileType,
                          style: TextStyle(
                            fontSize: 12,
                            color: iconColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        fileSize,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Download Button
            IconButton(
              icon: const Icon(Icons.download, color: Colors.red),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Downloading $title...'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Bottom Navigation Bar Component (Updated to be functional)
class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavItem(
            icon: Icons.dashboard,
            label: 'Dashboard',
            isSelected: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          NavItem(
            icon: Icons.add,
            label: 'Add Property',
            isSelected: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          NavItem(
            icon: Icons.people,
            label: 'Manage Tenants',
            isSelected: currentIndex == 2,
            onTap: () => onTap(2),
          ),
          // NavItem(
          //   icon: Icons.share,
          //   label: 'Share Portfolio',
          //   isSelected: currentIndex == 3,
          //   onTap: () => onTap(3),
          // ),
          // NavItem(
          //   icon: Icons.download,
          //   label: 'Download Report',
          //   isSelected: currentIndex == 4,
          //   onTap: () => onTap(4),
          // ),
        ],
      ),
    );
  }
}





// Navigation Item Component (Updated to be functional)
class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.red : Colors.grey[600],
            size: isSelected ? 28 : 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.red : Colors.grey[600],
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

// Header Component
class DashboardHeader extends StatelessWidget {
  final String title;
  final int propertyCount;

  const DashboardHeader({
    Key? key,
    required this.title,
    required this.propertyCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D3D3D),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '$propertyCount Properties',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          // CircleAvatar(
          //   backgroundColor: Colors.red,
          //   child: IconButton(
          //     icon: const Icon(Icons.person, color: Colors.white),
          //     onPressed: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}

// Stats Card Component
class StatsCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const StatsCard({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3D3D3D),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

// Filter Tabs Component
class FilterTabs extends StatelessWidget {
  final List<String> tabs;
  final String selectedTab;
  final Function(String) onTabSelected;

  const FilterTabs({
    Key? key,
    required this.tabs,
    required this.selectedTab,
    required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: tabs.map((tab) {
          final isSelected = tab == selectedTab;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected(tab),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.red : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.center,
                child: Text(
                  tab,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey[600],
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// Custom Bar Chart Component (simplified version)
class CustomBarChart extends StatelessWidget {
  const CustomBarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data for the chart
    final List<Map<String, dynamic>> monthlyData = [
      {'month': 'Jul', 'revenue': 38000, 'expenses': 28000},
      {'month': 'Aug', 'revenue': 42000, 'expenses': 30000},
      {'month': 'Sep', 'revenue': 45000, 'expenses': 32000},
      {'month': 'Oct', 'revenue': 47000, 'expenses': 32000},
      {'month': 'Nov', 'revenue': 50000, 'expenses': 34000},
      {'month': 'Dec', 'revenue': 52000, 'expenses': 36000},
    ];

    // Find the maximum value for scaling
    double maxValue = 0;
    for (var data in monthlyData) {
      if (data['revenue'] > maxValue) maxValue = data['revenue'].toDouble();
    }
    maxValue = ((maxValue / 10000).ceil() * 10000).toDouble();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Monthly Earnings',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3D3D3D),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 200,
            padding: const EdgeInsets.only(top: 20, right: 10, bottom: 10),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Y-axis labels
                      SizedBox(
                        width: 30,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${(maxValue / 1000).toInt()}k',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '${(maxValue * 2 / 3 / 1000).toInt()}k',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '${(maxValue * 1 / 3 / 1000).toInt()}k',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '0',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Chart bars
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: monthlyData.map((data) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4),
                              child: BarGroup(
                                revenue: data['revenue'].toDouble(),
                                expenses: data['expenses'].toDouble(),
                                maxValue: maxValue,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // X-axis labels
                Row(
                  children: [
                    const SizedBox(width: 30), // Space for y-axis
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: monthlyData.map((data) {
                          return Text(
                            data['month'],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Revenue',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Expenses',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Bar Group Component for the chart
class BarGroup extends StatelessWidget {
  final double revenue;
  final double expenses;
  final double maxValue;

  const BarGroup({
    Key? key,
    required this.revenue,
    required this.expenses,
    required this.maxValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Revenue bar
        Container(
          width: 16,
          height: (revenue / maxValue * 150),
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ),
        const SizedBox(width: 4),
        // Expenses bar
        Container(
          width: 16,
          height: (expenses / maxValue * 150),
          decoration: BoxDecoration(
            color: Colors.grey[600],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ),
      ],
    );
  }
}

// Property Card Component
class PropertyCards extends StatelessWidget {
  final String title;
  final String address;
  final String status;
  final String price;
  final String imageAsset;
  final VoidCallback? onTap; // Add onTap callback

  const PropertyCards({
    Key? key,
    required this.title,
    required this.address,
    required this.status,
    required this.price,
    required this.imageAsset,
    this.onTap, // Make it optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (status.toLowerCase()) {
      case 'rented':
        statusColor = Colors.green;
        break;
      case 'available':
        statusColor = Colors.orange;
        break;
      default:
        statusColor = Colors.purple;
    }

    return GestureDetector(
      onTap: onTap, // Add onTap handler
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                // Use a placeholder color container for demo purposes
                child: Container(
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(
                      Icons.home,
                      size: 50,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ),
            // Property Details
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3D3D3D),
                          ),
                        ),
                      ),
                      // const Icon(Icons.more_vert),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    address,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: statusColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            status,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '$price /mo',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class PropertyDetailsPage extends StatefulWidget {
  final Map<String, dynamic> property;

  const PropertyDetailsPage({
    Key? key,
    required this.property,
  }) : super(key: key);

  @override
  State<PropertyDetailsPage> createState() => _PropertyDetailsPageState();
}

class _PropertyDetailsPageState extends State<PropertyDetailsPage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (widget.property['status'].toLowerCase()) {
      case 'rented':
        statusColor = Colors.green;
        break;
      case 'available':
        statusColor = Colors.orange;
        break;
      default:
        statusColor = Colors.purple;
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Property Image with Back Button and Like Button
            Stack(
              children: [
                // Property Image
                Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(
                      Icons.home,
                      size: 80,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                // Back Button
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                // Favorite Button
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                    ),
                  ),
                ),
                // Status badge
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.property['status'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Property Details
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Title and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.property['title'],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3D3D3D),
                          ),
                        ),
                      ),
                      Text(
                        '${widget.property['price']} /mo',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),

                  // Address
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.grey,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.property['address'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),

                  // Property Features
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PropertyFeature(
                        icon: Icons.king_bed,
                        label: '${widget.property['bedrooms']} Beds',
                      ),
                      PropertyFeature(
                        icon: Icons.bathtub,
                        label: '${widget.property['bathrooms']} Baths',
                      ),
                      PropertyFeature(
                        icon: Icons.square_foot,
                        label: widget.property['area'],
                      ),
                    ],
                  ),

                  // Description Title
                  const SizedBox(height: 24),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3D3D3D),
                    ),
                  ),

                  // Description
                  const SizedBox(height: 8),
                  Text(
                    widget.property['description'],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),

                  // Amenities Title
                  const SizedBox(height: 24),
                  const Text(
                    'Amenities',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3D3D3D),
                    ),
                  ),

                  // Amenities List
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: const [
                      AmenityChip(label: 'Air Conditioning'),
                      AmenityChip(label: 'High-Speed Internet'),
                      AmenityChip(label: 'Parking Space'),
                      AmenityChip(label: 'Security System'),
                      AmenityChip(label: 'Swimming Pool'),
                      AmenityChip(label: 'Fitness Center'),
                      AmenityChip(label: 'Laundry Room'),
                      AmenityChip(label: 'Balcony'),
                    ],
                  ),

                  // Location Title
                  const SizedBox(height: 24),
                  const Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3D3D3D),
                    ),
                  ),

                  // Map Placeholder
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.map,
                            size: 60,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Map View',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Contact Agent Title
                  const SizedBox(height: 24),
                  const Text(
                    'Contact Agent',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3D3D3D),
                    ),
                  ),

                  // Agent Card
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Agent Image
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.person,
                              size: 30,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Agent Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Alex Johnson',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3D3D3D),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Property Manager',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Contact Buttons
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.green.withOpacity(0.1),
                              child: IconButton(
                                icon: const Icon(Icons.phone, color: Colors.green),
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(width: 8),
                            CircleAvatar(
                              backgroundColor: Colors.blue.withOpacity(0.1),
                              child: IconButton(
                                icon: const Icon(Icons.message, color: Colors.blue),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),

            // Action Buttons
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Schedule Tour Button
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        // Schedule Tour action
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Property tour scheduled!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Schedule Tour',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Apply Now Button
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // Apply Now action
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Application started!'),
                            backgroundColor: Colors.blue,
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Apply',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Property Feature Widget for details page
class PropertyFeature extends StatelessWidget {
  final IconData icon;
  final String label;

  const PropertyFeature({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: Colors.red,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3D3D3D),
          ),
        ),
      ],
    );
  }
}

// Amenity Chip Widget for details page
class AmenityChip extends StatelessWidget {
  final String label;

  const AmenityChip({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}