import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/controller/property_service_controller.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class SubmitQueryFormComponent extends StatefulWidget {
  final List<String> propertyTypeList;
  final String? buttonTitle;
  final String serviceType;

  SubmitQueryFormComponent({
    Key? key,
    required this.propertyTypeList,
    this.buttonTitle,
    required this.serviceType,
  }) : super(key: key);

  @override
  State<SubmitQueryFormComponent> createState() =>
      _SubmitQueryFormComponentState();
}

class _SubmitQueryFormComponentState extends State<SubmitQueryFormComponent> {
  TextEditingController serviceCategoryText = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobile = TextEditingController();
  final controller = Get.put(PropertyServiceController());

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  String _selectedPropertyType = ""; // Declare in state to persist selection

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Initialize with the first value from propertyTypeList
    if (widget.propertyTypeList.isNotEmpty) {
      _selectedPropertyType = widget.propertyTypeList.first;
    }
  }

  String formatTimeOfDay(TimeOfDay time) {
    final localizations = MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(time, alwaysUse24HourFormat: true);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: _selectedPropertyType,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                prefixIcon: const Icon(Icons.location_city, color: AppColors.appBarColor),
              ),
              items: widget.propertyTypeList
                  .map((type) => DropdownMenuItem(
                value: type,
                child: Text(type),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedPropertyType = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: name,
              hintText: 'Name',
              prefixIcon: Icons.person,
              validator: (value) =>
              value == null || value.isEmpty ? 'Please enter your name' : null,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: email,
              hintText: 'Email',
              prefixIcon: Icons.email_outlined,
              validator: (value) => value == null || !RegExp(r'\S+@\S+\.\S+').hasMatch(value)
                  ? 'Enter a valid email'
                  : null,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: address,
              hintText: 'Address of property',
              prefixIcon: Icons.location_history,
              validator: (value) =>
              value == null || value.isEmpty ? 'Please enter your address' : null,
            ),
            const SizedBox(height: 16),
            _buildInputField(
              controller: mobile,
              hintText: 'Contact Number',
              prefixIcon: Icons.phone,
              validator: (value) =>
              value == null || value.length < 10 ? 'Enter a valid phone number' : null,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // controller.propertyServices(
                  //   context,
                  //   name.text,
                  //   email.text,
                  //   mobile.text,
                  //   "${widget.serviceType}:${_selectedPropertyType.toString()}",
                  //   address.text,
                  //   _selectedDate.toString(),
                  //   formatTimeOfDay(_selectedTime).toString(),
                  // );
                }
              },
              icon: const Icon(Icons.send, color: Colors.white),
              label: Text(
                widget.buttonTitle ?? 'Book Now',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.appBarColor,
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon, color: AppColors.appBarColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      validator: validator,
    );
  }
}
