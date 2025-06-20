import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({Key? key}) : super(key: key);

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  final _searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Tabs
  int _currentTabIndex = 0;

  // Upload document variables
  String _selectedCategory = 'Lease Agreements';
  final List<String> _categories = [
    'Lease Agreements',
    'Property Deeds',
    'Insurance Documents',
    'Tax Documents',
    'Maintenance Records',
    'Inspection Reports',
    'Tenant Applications',
    'Other',
  ];

  String? _selectedPropertyId;
  String? _selectedUnitId;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();

  File? _selectedFile;
  String _selectedFileName = '';

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

  // Sample documents data
  final List<Map<String, dynamic>> _documents = [
    {
      'id': '1',
      'title': 'Lease Agreement - John Doe',
      'property': 'Skyline Apartments',
      'unit': '304',
      'category': 'Lease Agreements',
      'uploadDate': '2025-01-15',
      'expiryDate': '2026-01-14',
      'fileSize': '2.5',
      'fileType': 'pdf',
    },
    {
      'id': '2',
      'title': 'Property Insurance Policy',
      'property': 'All Properties',
      'unit': null,
      'category': 'Insurance Documents',
      'uploadDate': '2025-02-10',
      'expiryDate': '2026-02-09',
      'fileSize': '5.8',
      'fileType': 'pdf',
    },
    {
      'id': '3',
      'title': 'Pest Control Report',
      'property': 'Riverside Complex',
      'unit': '202',
      'category': 'Maintenance Records',
      'uploadDate': '2025-04-18',
      'expiryDate': null,
      'fileSize': '1.2',
      'fileType': 'pdf',
    },
    {
      'id': '4',
      'title': 'Property Tax Statement 2025',
      'property': 'Skyline Apartments',
      'unit': null,
      'category': 'Tax Documents',
      'uploadDate': '2025-03-25',
      'expiryDate': null,
      'fileSize': '0.8',
      'fileType': 'pdf',
    },
    {
      'id': '5',
      'title': 'Lease Agreement - Jane Smith',
      'property': 'Skyline Apartments',
      'unit': '305',
      'category': 'Lease Agreements',
      'uploadDate': '2025-02-01',
      'expiryDate': '2026-01-31',
      'fileSize': '2.4',
      'fileType': 'pdf',
    },
  ];

  List<Map<String, dynamic>> _units = [];
  List<Map<String, dynamic>> _filteredDocuments = [];
  String _selectedCategoryFilter = 'All';

  @override
  void initState() {
    super.initState();
    _filteredDocuments = List.from(_documents);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _expiryDateController.dispose();
    super.dispose();
  }

  void _filterDocuments(String query) {
    setState(() {
      if (query.isEmpty && _selectedCategoryFilter == 'All') {
        _filteredDocuments = List.from(_documents);
      } else {
        _filteredDocuments = _documents.where((document) {
          bool matchesQuery = query.isEmpty ||
              document['title'].toLowerCase().contains(query.toLowerCase()) ||
              document['property'].toLowerCase().contains(query.toLowerCase()) ||
              (document['unit'] != null && document['unit'].toLowerCase().contains(query.toLowerCase()));

          bool matchesCategory = _selectedCategoryFilter == 'All' ||
              document['category'] == _selectedCategoryFilter;

          return matchesQuery && matchesCategory;
        }).toList();
      }
    });
  }

  void _filterByCategory(String category) {
    setState(() {
      _selectedCategoryFilter = category;
      _filterDocuments(_searchController.text);
    });
  }

  void _onPropertyChanged(String? propertyId) {
    setState(() {
      _selectedPropertyId = propertyId;
      _selectedUnitId = null;

      if (propertyId != null) {
        final property = _properties.firstWhere((p) => p['id'] == propertyId);
        _units = List<Map<String, dynamic>>.from(property['units']);
      } else {
        _units = [];
      }
    });
  }

  Future<void> _selectFile() async {
    // FilePickerResult? result = await FilePicker.platform.pickFiles(
    //   type: FileType.custom,
    //   allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png'],
    // );

    // if (result != null) {
    //   setState(() {
    //     _selectedFile = File(result.files.single.path!);
    //     _selectedFileName = result.files.single.name;
    //   });
    // }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 365)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        _expiryDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: _currentTabIndex,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Documents'),
          elevation: 0,
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                _currentTabIndex = index;
              });
            },
            tabs: const [
              Tab(text: 'Documents'),
              Tab(text: 'Upload'),
            ],
            labelColor: Colors.grey[800],
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.grey[800],
          ),
        ),
        body: TabBarView(
          children: [
            _buildDocumentsTab(),
            _buildUploadTab(),
          ],
        ),
        floatingActionButton: _currentTabIndex == 0
            ? FloatingActionButton(
          onPressed: () {
            setState(() {
              _currentTabIndex = 1;
            });
          },
          backgroundColor: Colors.grey[800],
          child: const Icon(Icons.upload_file),
        )
            : null,
      ),
    );
  }

  Widget _buildDocumentsTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                onChanged: _filterDocuments,
                decoration: InputDecoration(
                  hintText: 'Search documents...',
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
                    borderSide: BorderSide(color: Colors.grey[800]!),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              _buildCategoryFilter(),
            ],
          ),
        ),
        Expanded(
          child: _filteredDocuments.isEmpty
              ? const Center(
            child: Text('No documents found'),
          )
              : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _filteredDocuments.length,
            itemBuilder: (context, index) {
              final document = _filteredDocuments[index];
              return _buildDocumentCard(document);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryFilter() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategoryChip('All'),
          ..._categories.map((category) => _buildCategoryChip(category)),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    final isSelected = _selectedCategoryFilter == category;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(category),
        selected: isSelected,
        onSelected: (selected) {
          _filterByCategory(selected ? category : 'All');
        },
        backgroundColor: Colors.white,
        selectedColor: Colors.grey[300],
        checkmarkColor: Colors.grey[800],
        labelStyle: TextStyle(
          color: isSelected ? Colors.grey[800] : Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildDocumentCard(Map<String, dynamic> document) {
    IconData fileIcon;

    switch (document['fileType']) {
      case 'pdf':
        fileIcon = Icons.picture_as_pdf;
        break;
      case 'doc':
      case 'docx':
        fileIcon = Icons.description;
        break;
      case 'jpg':
      case 'jpeg':
      case 'png':
        fileIcon = Icons.image;
        break;
      default:
        fileIcon = Icons.insert_drive_file;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          // View document action
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  fileIcon,
                  color: Colors.grey[800],
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      document['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      document['property'] +
                          (document['unit'] != null
                              ? ' - Unit ${document['unit']}'
                              : ''),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            document['category'],
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Upload: ${document['uploadDate']}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    if (document['expiryDate'] != null) ...[
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.event,
                            size: 14,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Expires: ${document['expiryDate']}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${document['fileSize']} MB',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUploadTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'Document Details',
              child: Column(
                children: [
                  _buildTextField(
                    controller: _titleController,
                    label: 'Document Title',
                    hint: 'Enter document title',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter document title';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),
                  _buildCategoryDropdown(),

                  const SizedBox(height: 16),
                  _buildTextField(
                    controller: _descriptionController,
                    label: 'Description (Optional)',
                    hint: 'Enter document description',
                    maxLines: 3,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            _buildSection(
              title: 'Related Property',
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
              title: 'Document File',
              child: Column(
                children: [
                  _buildFilePicker(),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildExpiryDateField(),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _selectedFile == null
                    ? null
                    : () {
                  if (_formKey.currentState!.validate()) {
                    // Upload document
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Document uploaded successfully')),
                    );
                    // Reset form and go back to documents tab
                    _formKey.currentState!.reset();
                    _selectedFile = null;
                    _selectedFileName = '';
                    setState(() {
                      _currentTabIndex = 0;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  disabledBackgroundColor: Colors.grey[400],
                ),
                child: const Text(
                  'Upload Document',
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
              borderSide: BorderSide(color: Colors.grey[800]!),
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

  Widget _buildCategoryDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Document Category',
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
              value: _selectedCategory,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              items: _categories
                  .map((category) => DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedCategory = value;
                  });
                }
              },
            ),
          ),
        ),
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
              hint: const Text('Select a property (optional)'),
              items: [
                const DropdownMenuItem<String>(
                  value: 'all',
                  child: Text('All Properties'),
                ),
                ..._properties
                    .map((property) => DropdownMenuItem<String>(
                  value: property['id'],
                  child: Text(property['name']),
                ))
                    .toList(),
              ],
              onChanged: _onPropertyChanged,
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
                hintText: _selectedPropertyId == null
                    ? 'Select a property first'
                    : 'Select a unit (optional)',
              ),
              hint: Text(_selectedPropertyId == null
                  ? 'Select a property first'
                  : 'Select a unit (optional)'),
              disabledHint: Text(_selectedPropertyId == null
                  ? 'Select a property first'
                  : 'No units available'),
              items: _units.isEmpty
                  ? null
                  : [
                const DropdownMenuItem<String>(
                  value: 'none',
                  child: Text('None (Property-wide)'),
                ),
                ..._units
                    .map((unit) => DropdownMenuItem<String>(
                  value: unit['id'],
                  child: Text('Unit ${unit['number']} - ${unit['tenant']}'),
                ))
                    .toList(),
              ],
              onChanged: _selectedPropertyId == null || _units.isEmpty
                  ? null
                  : (value) {
                setState(() {
                  _selectedUnitId = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Document File',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: _selectFile,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.upload_file,
                    color: Colors.grey[800],
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _selectedFile != null
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _selectedFileName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tap to change file',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  )
                      : const Text('Choose a file or drag and drop it here'),
                ),
                if (_selectedFile != null)
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _selectedFile = null;
                        _selectedFileName = '';
                      });
                    },
                  ),
              ],
            ),
          ),
        ),
        if (_selectedFile == null) ...[
          const SizedBox(height: 8),
          Text(
            'Supported formats: PDF, DOC, DOCX, JPG, JPEG, PNG',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildExpiryDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Expiry Date (Optional)',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _expiryDateController,
          readOnly: true,
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            hintText: 'Select date',
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
                if (_expiryDateController.text.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      setState(() {
                        _expiryDateController.clear();
                      });
                    },
                  ),
              ],
            ),
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
              borderSide: BorderSide(color: Colors.grey[800]!),
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
}