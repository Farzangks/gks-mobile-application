// all_properties_screen.dart
import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/view/real_eastate/project_managment_details_screen.dart';
import 'package:ghar_ka_sathi/view/real_eastate/property_details_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class AllPropertiesScreen extends StatefulWidget {
  const AllPropertiesScreen({Key? key}) : super(key: key);

  @override
  State<AllPropertiesScreen> createState() => _AllPropertiesScreenState();
}

class _AllPropertiesScreenState extends State<AllPropertiesScreen> {
  // Sample property data
  final List<Property> properties = SampleData.getProperties();
  String _selectedFilter = 'All Properties';
  final List<String> _filters = ['All Properties', 'Occupied', 'Vacant', 'Maintenance'];

  @override
  Widget build(BuildContext context) {
    // Filter properties based on selection
    List<Property> filteredProperties = _selectedFilter == 'All Properties'
        ? properties
        : properties.where((property) {
      switch (_selectedFilter) {
        case 'Occupied':
          return property.status == PropertyStatus.occupied;
        case 'Vacant':
          return property.status == PropertyStatus.vacant;
        case 'Maintenance':
          return property.status == PropertyStatus.maintenance;
        default:
          return true;
      }
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Properties'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Search functionality coming soon')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _filters.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      label: Text(_filters[index]),
                      selected: _selectedFilter == _filters[index],
                      onSelected: (selected) {
                        setState(() {
                          _selectedFilter = _filters[index];
                        });
                      },
                      backgroundColor: Colors.grey[200],
                      selectedColor: AppColors.secondaryBtnLigRed,
                      checkmarkColor: AppColors.btnDarkRed,
                      labelStyle: TextStyle(
                        color: _selectedFilter == _filters[index]
                            ? AppColors.btnDarkRed
                            : Colors.black87,
                        fontWeight: _selectedFilter == _filters[index]
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Property count and sort option
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${filteredProperties.length} Properties',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                PopupMenuButton<String>(
                  icon: Row(
                    children: const [
                      Text(
                        'Sort',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.sort,
                        color: AppColors.appBarColor,
                      ),
                    ],
                  ),
                  onSelected: (value) {
                    // Implement sorting logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Sorting by $value')),
                    );
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'name',
                      child: Text('Name (A-Z)'),
                    ),
                    const PopupMenuItem(
                      value: 'date',
                      child: Text('Date Added'),
                    ),
                    const PopupMenuItem(
                      value: 'occupancy',
                      child: Text('Occupancy Rate'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Properties list
          Expanded(
            child: filteredProperties.isEmpty
                ? const Center(
              child: Text(
                'No properties found',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredProperties.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PropertyDetailsScreen(
                            property: filteredProperties[index],
                          ),
                        ),
                      );
                    },
                    child: PropertyCardss(
                      property: filteredProperties[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_property');
        },
        backgroundColor: AppColors.appBarColor,
        child: const Icon(Icons.add),
        tooltip: 'Add New Property',
      ),
    );
  }
}