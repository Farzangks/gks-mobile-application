import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class MaintenanceScreen extends StatefulWidget {
  const MaintenanceScreen({Key? key}) : super(key: key);

  @override
  State<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();

  // Tabs
  int _currentTabIndex = 0;

  // Form controllers for new request
  String? _selectedPropertyId;
  String? _selectedUnitId;
  final TextEditingController _issueController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String _priority = 'Medium';
  final List<String> _priorities = ['Low', 'Medium', 'High', 'Emergency'];
  List<File> _selectedImages = [];

  // Sample properties and units data
  final List<Map<String, dynamic>> _properties = [
    {
      'id': '1',
      'name': 'Skyline Apartments',
      'units': [
        {'id': '101', 'number': '304', 'tenant': 'John Doe'},
        {'id': '102', 'number': '305', 'tenant': 'Jane Smith'},
      ]
    },
    {
      'id': '2',
      'name': 'Riverside Complex',
      'units': [
        {'id': '201', 'number': '201', 'tenant': 'Alice Smith'},
        {'id': '202', 'number': '202', 'tenant': 'Bob Johnson'},
      ]
    },
  ];

  // Sample maintenance requests data
  final List<Map<String, dynamic>> _maintenanceRequests = [
    {
      'id': '1',
      'property': 'Skyline Apartments',
      'unit': '304',
      'issue': 'Leaking Faucet',
      'priority': 'Medium',
      'status': 'Open',
      'date': '2025-04-25',
      'tenant': 'John Doe',
    },
    {
      'id': '2',
      'property': 'Riverside Complex',
      'unit': '201',
      'issue': 'AC Not Working',
      'priority': 'High',
      'status': 'In Progress',
      'date': '2025-04-23',
      'tenant': 'Alice Smith',
    },
    {
      'id': '3',
      'property': 'Skyline Apartments',
      'unit': '305',
      'issue': 'Broken Window',
      'priority': 'Medium',
      'status': 'Open',
      'date': '2025-04-20',
      'tenant': 'Jane Smith',
    },
    {
      'id': '4',
      'property': 'Riverside Complex',
      'unit': '202',
      'issue': 'Pest Control',
      'priority': 'Low',
      'status': 'Completed',
      'date': '2025-04-15',
      'tenant': 'Bob Johnson',
    },
  ];

  List<Map<String, dynamic>> _units = [];
  Map<String, dynamic>? _selectedUnit;
  List<Map<String, dynamic>> _filteredRequests = [];

  @override
  void initState() {
    super.initState();
    // Set today's date as default
    _dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    _filteredRequests = List.from(_maintenanceRequests);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _issueController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void _filterRequests(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredRequests = List.from(_maintenanceRequests);
      } else {
        _filteredRequests = _maintenanceRequests
            .where((request) =>
        request['issue'].toLowerCase().contains(query.toLowerCase()) ||
            request['property'].toLowerCase().contains(query.toLowerCase()) ||
            request['unit'].toLowerCase().contains(query.toLowerCase()) ||
            request['tenant'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _onPropertyChanged(String? propertyId) {
    setState(() {
      _selectedPropertyId = propertyId;
      _selectedUnitId = null;
      _selectedUnit = null;

      if (propertyId != null) {
        final property = _properties.firstWhere((p) => p['id'] == propertyId);
        _units = List<Map<String, dynamic>>.from(property['units']);
      } else {
        _units = [];
      }
    });
  }

  void _onUnitChanged(String? unitId) {
    setState(() {
      _selectedUnitId = unitId;

      if (unitId != null) {
        _selectedUnit = _units.firstWhere((u) => u['id'] == unitId);
      } else {
        _selectedUnit = null;
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();

    if (images.isNotEmpty) {
      setState(() {
        _selectedImages.addAll(images.map((image) => File(image.path)).toList());
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance'),
        elevation: 0,
        bottom: TabBar(
          onTap: (index) {
            setState(() {
              _currentTabIndex = index;
            });
          },
          tabs: const [
            Tab(text: 'Requests'),
            Tab(text: 'New Request'),
          ],
          labelColor: const Color(0xFFFFB74D),
          unselectedLabelColor: Colors.grey,
          indicatorColor: const Color(0xFFFFB74D),
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildRequestsTab(),
          _buildNewRequestTab(),
        ],
      ),
      floatingActionButton: _currentTabIndex == 0
          ? FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentTabIndex = 1;
          });
        },
        backgroundColor: const Color(0xFFFFB74D),
        child: const Icon(Icons.add),
      )
          : null,
    );
  }

  Widget _buildRequestsTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _searchController,
            onChanged: _filterRequests,
            decoration: InputDecoration(
              hintText: 'Search maintenance requests...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFFFB74D)),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: _filteredRequests.isEmpty
              ? const Center(
            child: Text('No maintenance requests found'),
          )
              : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _filteredRequests.length,
            itemBuilder: (context, index) {
              final request = _filteredRequests[index];
              return _buildRequestCard(request);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRequestCard(Map<String, dynamic> request) {
    Color statusColor;
    IconData statusIcon;

    switch (request['status']) {
      case 'Open':
        statusColor = Colors.red;
        statusIcon = Icons.radio_button_unchecked;
        break;
      case 'In Progress':
        statusColor = Colors.amber;
        statusIcon = Icons.timelapse;
        break;
      case 'Completed':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.help;
    }

    Color priorityColor;
    switch (request['priority']) {
      case 'Low':
        priorityColor = Colors.green;
        break;
      case 'Medium':
        priorityColor = Colors.amber;
        break;
      case 'High':
        priorityColor = Colors.deepOrange;
        break;
      case 'Emergency':
        priorityColor = Colors.red;
        break;
      default:
        priorityColor = Colors.grey;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          ListTile(
            title: Text(
              request['issue'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${request['property']} - Unit ${request['unit']}',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        statusIcon,
                        size: 14,
                        color: statusColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        request['status'],
                        style: TextStyle(
                          fontSize: 12,
                          color: statusColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right),
              ],
            ),
          ),
          const Divider(height: 0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      request['tenant'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      request['date'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: priorityColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    request['priority'],
                    style: TextStyle(
                      fontSize: 12,
                      color: priorityColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewRequestTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'Property & Unit',
              child: Column(
                children: [
                  _buildPropertyDropdown(),
                  const SizedBox(height: 16),
                  _buildUnitDropdown(),
                ],
              ),
            ),

            const SizedBox(height: 24),
            _buildSection(
              title: 'Issue Details',
              child: Column(
                children: [
                  _buildTextField(
                    controller: _issueController,
                    label: 'Issue Title',
                    hint: 'Enter issue title',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter issue title';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),
                  _buildPriorityDropdown(),

                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _descriptionController,
                    label: 'Description',
                    hint: 'Describe the maintenance issue in detail',
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter description';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),
                  _buildDateField(),
                ],
              ),
            ),

            const SizedBox(height: 24),
            _buildSection(
              title: 'Attachments',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add photos of the issue (optional)',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildImagesList(),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: _pickImages,
                    icon: const Icon(Icons.add_a_photo),
                    label: const Text('Add Photos'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFFFB74D),
                      side: const BorderSide(color: Color(0xFFFFB74D)),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Submit maintenance request
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Maintenance request submitted')),
                    );
                    // Reset form and go back to requests tab
                    _formKey.currentState!.reset();
                    _selectedImages = [];
                    setState(() {
                      _currentTabIndex = 0;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFB74D),
                ),
                child: const Text(
                  'Submit Request',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }

  Widget _buildPropertyDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Property',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              value: _selectedPropertyId,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              hint: const Text('Select a property'),
              items: _properties
                  .map((property) => DropdownMenuItem<String>(
                value: property['id'],
                child: Text(property['name']),
              ))
                  .toList(),
              onChanged: _onPropertyChanged,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a property';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUnitDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Unit',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              value: _selectedUnitId,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              hint: const Text('Select a unit'),
              items: _units
                  .map((unit) => DropdownMenuItem<String>(
                value: unit['id'],
                child: Text('Unit ${unit['number']} - ${unit['tenant']}'),
              ))
                  .toList(),
              onChanged: _onUnitChanged,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a unit';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFFFB74D)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildPriorityDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Priority',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              value: _priority,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              items: _priorities
                  .map((priority) => DropdownMenuItem<String>(
                value: priority,
                child: Text(priority),
              ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _priority = value;
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Date Reported',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _dateController,
          readOnly: true,
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            hintText: 'Select date',
            suffixIcon: const Icon(Icons.calendar_today),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFFFB74D)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildImagesList() {
    return _selectedImages.isEmpty
        ? const SizedBox.shrink()
        : SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _selectedImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    _selectedImages[index],
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: () => _removeImage(index),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}