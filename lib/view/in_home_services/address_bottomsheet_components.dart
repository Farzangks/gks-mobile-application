// lib/widgets/address_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class AddressBottomSheet extends StatefulWidget {
  final Function(Address) onAddressSaved;
  final Address? initialAddress;

  const AddressBottomSheet({
    Key? key,
    required this.onAddressSaved,
    this.initialAddress,
  }) : super(key: key);

  static Future<void> show(
      BuildContext context, {
        Address? currentAddress,
        required Function(Address) onAddressSaved,
      }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddressBottomSheet(
        initialAddress: currentAddress,
        onAddressSaved: onAddressSaved,
      ),
    );
  }

  @override
  State<AddressBottomSheet> createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _streetController;
  late TextEditingController _cityController;
  late TextEditingController _stateController;
  late TextEditingController _zipController;
  late TextEditingController _phoneController;
  late TextEditingController _houseController;
  late TextEditingController _landmarkController;
  String _addressType = 'Home';

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialAddress?.name ?? '');
    _streetController = TextEditingController(text: widget.initialAddress?.streetAddress ?? '');
    _cityController = TextEditingController(text: widget.initialAddress?.city ?? '');
    _stateController = TextEditingController(text: widget.initialAddress?.state ?? '');
    _zipController = TextEditingController(text: widget.initialAddress?.zipCode ?? '');
    _phoneController = TextEditingController(text: widget.initialAddress?.phoneNumber ?? '');
    _houseController = TextEditingController(text: widget.initialAddress?.houseNumber ?? '');
    _landmarkController = TextEditingController(text: widget.initialAddress?.landmark ?? '');

    if (widget.initialAddress != null) {
      _addressType = widget.initialAddress!.type;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    _phoneController.dispose();
    _houseController.dispose();
    _landmarkController.dispose();
    super.dispose();
  }

  void _saveAddress() {
    final newAddress = Address(
      id: widget.initialAddress?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
      fullAddress: '${ _houseController.text}, ${_landmarkController.text},',
      houseNumber: _houseController.text,
      landmark: _landmarkController.text,
      type: _addressType,
      name: _nameController.text,
      streetAddress: _streetController.text,
      city: _cityController.text,
      state: _stateController.text,
      zipCode: _zipController.text,
      phoneNumber: _phoneController.text,
    );

    widget.onAddressSaved(newAddress);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.viewInsets.bottom;

    return Container(
      padding: EdgeInsets.only(bottom: bottomPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),

                  // Title
                  const Text(
                    'Enter your address',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Current address card
                  CurrentAddressCard(
                    address: widget.initialAddress?.fullAddress ??
                        '123 Main Street, Apartment 4B, Downtown Area, City Name, 12345',
                    onChangePressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Change address functionality would go here')),
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  // House/Flat Number Input
                  InputLabel(label: 'House/Flat Number'),
                  CustomTextField(
                    controller: _houseController,
                    hintText: 'Enter house/flat number',
                  ),

                  const SizedBox(height: 16),

                  // Landmark Input
                  InputLabel(label: 'Landmark'),
                  CustomTextField(
                    controller: _landmarkController,
                    hintText: 'Enter nearby landmark',
                  ),

                  const SizedBox(height: 24),

                  // Save as options
                  InputLabel(label: 'Save as'),
                  const SizedBox(height: 8),

                  // Address type selection buttons
                  Row(
                    children: [
                      Expanded(
                        child: AddressTypeButton(
                          isSelected: _addressType == 'Home',
                          label: 'Home',
                          icon: Icons.home,
                          onPressed: () {
                            setState(() {
                              _addressType = 'Home';
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: AddressTypeButton(
                          isSelected: _addressType == 'Others',
                          label: 'Others',
                          icon: Icons.apartment,
                          isOutlined: true,
                          onPressed: () {
                            setState(() {
                              _addressType = 'Others';
                            });
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Save button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _saveAddress,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appBarColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Save Address',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Reusable components

class CurrentAddressCard extends StatelessWidget {
  final String address;
  final VoidCallback onChangePressed;

  const CurrentAddressCard({
    Key? key,
    required this.address,
    required this.onChangePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.location_on,
            color: AppColors.appBarColor,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Current Address',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onChangePressed,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.appBarColor,
              padding: EdgeInsets.zero,
              minimumSize: const Size(60, 36),
            ),
            child: const Text(
              'Change',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputLabel extends StatelessWidget {
  final String label;

  const InputLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 16,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.appBarColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

class AddressTypeButton extends StatelessWidget {
  final bool isSelected;
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isOutlined;

  const AddressTypeButton({
    Key? key,
    required this.isSelected,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.isOutlined = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected && !isOutlined
        ? AppColors.appBarColor
        : isSelected && isOutlined
        ? Colors.white
        : isOutlined
        ? Colors.white
        : Colors.grey[200];

    final borderColor = isSelected
        ? AppColors.appBarColor
        : Colors.grey[300];

    final textColor = isSelected && !isOutlined
        ? Colors.white
        : isSelected && isOutlined
        ? AppColors.appBarColor
        : Colors.black87;

    final iconColor = textColor;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Address {
  final String id;
  final String fullAddress;
  final String houseNumber;
  final String landmark;
  final String type;
  final String? name;
  final String? streetAddress;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? phoneNumber;

  Address({
    required this.id,
    required this.fullAddress,
    required this.houseNumber,
    required this.landmark,
    required this.type,
    this.name,
    this.streetAddress,
    this.city,
    this.state,
    this.zipCode,
    this.phoneNumber,
  });

  Address copyWith({
    String? id,
    String? fullAddress,
    String? houseNumber,
    String? landmark,
    String? type,
    String? name,
    String? streetAddress,
    String? city,
    String? state,
    String? zipCode,
    String? phoneNumber,
  }) {
    return Address(
      id: id ?? this.id,
      fullAddress: fullAddress ?? this.fullAddress,
      houseNumber: houseNumber ?? this.houseNumber,
      landmark: landmark ?? this.landmark,
      type: type ?? this.type,
      name: name ?? this.name,
      streetAddress: streetAddress ?? this.streetAddress,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      fullAddress: json['fullAddress'],
      houseNumber: json['houseNumber'],
      landmark: json['landmark'],
      type: json['type'],
      name: json['name'],
      streetAddress: json['streetAddress'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zipCode'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullAddress': fullAddress,
      'houseNumber': houseNumber,
      'landmark': landmark,
      'type': type,
      'name': name,
      'streetAddress': streetAddress,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'phoneNumber': phoneNumber,
    };
  }
}