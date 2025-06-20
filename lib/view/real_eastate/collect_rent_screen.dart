import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CollectRentScreen extends StatefulWidget {
  const CollectRentScreen({Key? key}) : super(key: key);

  @override
  State<CollectRentScreen> createState() => _CollectRentScreenState();
}

class _CollectRentScreenState extends State<CollectRentScreen> {
  final _formKey = GlobalKey<FormState>();

  // Selected property and unit
  String? _selectedPropertyId;
  String? _selectedUnitId;

  // Form controllers
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  String _paymentMethod = 'Cash';
  final List<String> _paymentMethods = ['Cash', 'Bank Transfer', 'Check', 'Credit Card', 'Online Payment'];

  // Sample properties and units data
  final List<Map<String, dynamic>> _properties = [
    {
      'id': '1',
      'name': 'Skyline Apartments',
      'units': [
        {'id': '101', 'number': '304', 'tenant': 'John Doe', 'rent': 1200.0},
        {'id': '102', 'number': '305', 'tenant': 'Jane Smith', 'rent': 1500.0},
      ]
    },
    {
      'id': '2',
      'name': 'Riverside Complex',
      'units': [
        {'id': '201', 'number': '201', 'tenant': 'Alice Smith', 'rent': 950.0},
        {'id': '202', 'number': '202', 'tenant': 'Bob Johnson', 'rent': 1100.0},
      ]
    },
  ];

  List<Map<String, dynamic>> _units = [];
  Map<String, dynamic>? _selectedUnit;

  @override
  void initState() {
    super.initState();
    // Set today's date as default
    _dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  @override
  void dispose() {
    _amountController.dispose();
    _dateController.dispose();
    _notesController.dispose();
    super.dispose();
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

      // Clear amount field
      _amountController.clear();
    });
  }

  void _onUnitChanged(String? unitId) {
    setState(() {
      _selectedUnitId = unitId;

      if (unitId != null) {
        _selectedUnit = _units.firstWhere((u) => u['id'] == unitId);
        // Pre-fill rent amount
        _amountController.text = _selectedUnit!['rent'].toString();
      } else {
        _selectedUnit = null;
        _amountController.clear();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collect Rent'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
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
                title: 'Payment Details',
                child: Column(
                  children: [
                    _buildTextField(
                      controller: _amountController,
                      label: 'Amount',
                      hint: 'Enter amount',
                      prefixIcon: const Icon(Icons.attach_money),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter amount';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 16),
                    _buildPaymentMethodDropdown(),

                    const SizedBox(height: 16),
                    _buildDateField(),

                    const SizedBox(height: 16),
                    _buildTextField(
                      controller: _notesController,
                      label: 'Notes',
                      hint: 'Enter payment notes (optional)',
                      maxLines: 3,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              if (_selectedUnit != null) _buildTenantInfo(),

              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process payment
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Payment recorded successfully')),
                      );
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4CAF50),
                  ),
                  child: const Text(
                    'Record Payment',
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
    Widget? prefixIcon,
    List<TextInputFormatter>? inputFormatters,
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
            prefixIcon: prefixIcon,
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
              borderSide: const BorderSide(color: Color(0xFF4CAF50)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLines: maxLines,
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildPaymentMethodDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Method',
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
              value: _paymentMethod,
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              items: _paymentMethods
                  .map((method) => DropdownMenuItem<String>(
                value: method,
                child: Text(method),
              ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _paymentMethod = value;
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
          'Payment Date',
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
              borderSide: const BorderSide(color: Color(0xFF4CAF50)),
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

  Widget _buildTenantInfo() {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white, size: 32),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _selectedUnit!['tenant'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Unit ${_selectedUnit!['number']}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Monthly Rent'),
                Text(
                  '\$${_selectedUnit!['rent'].toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Due Date'),
                Text(
                  '1st of every month',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}