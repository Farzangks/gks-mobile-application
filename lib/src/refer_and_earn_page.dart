import 'package:flutter/material.dart';

class ReferAndEarnScreen extends StatefulWidget {
  const ReferAndEarnScreen({Key? key}) : super(key: key);

  @override
  State<ReferAndEarnScreen> createState() => _ReferAndEarnScreenState();
}

class _ReferAndEarnScreenState extends State<ReferAndEarnScreen> {
  int _selectedTab = 0;
  String? _selectedCity;
  String? _selectedPropertyType;
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _ownerContactController = TextEditingController();
  final TextEditingController _tellUsMoreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF4081),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Refer & Earn',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'My Rewards',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Text(
                    'Click a pic or Refer owner details to earn upto ₹120\nfor every property listing we publish!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Just Click a photo of TO-LET board hung outside any house (Mumbai, Bangalore, Pune, Chennai, Gurgaon, Hyderabad, Delhi, Noida, Greater Noida, Ghaziabad & Faridabad).',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Alternatively, you can share the owner contact details',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Tab buttons
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => setState(() => _selectedTab = 0),
                          child: _buildTab('Photo', Icons.camera_alt),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => setState(() => _selectedTab = 1),
                          child: _buildTab('Owner Details', Icons.person_outline),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Tab content
                  if (_selectedTab == 0) _buildPhotoTab(),
                  if (_selectedTab == 1) _buildOwnerDetailsTab(),
                  const SizedBox(height: 20),
                  // FAQs
                  _buildFAQSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title, IconData icon) {
    final bool isSelected = _selectedTab == (_selectedTab == 0 ? 0 : 1);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF009688) : Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? const Color(0xFF009688) : Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 2,
          color: isSelected ? const Color(0xFFFF4081) : Colors.transparent,
        ),
      ],
    );
  }

  Widget _buildPhotoTab() {
    return Column(
      children: [
        CustomDropdown<String>(
          value: _selectedCity,
          items: const [
            DropdownMenuItem(value: 'mumbai', child: Text('Mumbai')),
            DropdownMenuItem(value: 'delhi', child: Text('Delhi')),
            // Add more cities as needed
          ],
          label: 'Select City',
          prefixIcon: Icons.location_on_outlined,
          onChanged: (value) => setState(() => _selectedCity = value),
        ),
        const SizedBox(height: 20),
        CustomElevatedButton(
          text: 'Take Photo',
          onPressed: () {},
          isPhotoButton: true,
        ),
      ],
    );
  }

  Widget _buildOwnerDetailsTab() {
    return Column(
      children: [
        CustomDropdown<String>(
          value: _selectedCity,
          items: const [
            DropdownMenuItem(value: 'mumbai', child: Text('Mumbai')),
            DropdownMenuItem(value: 'delhi', child: Text('Delhi')),
            // Add more cities as needed
          ],
          label: 'Select City',
          prefixIcon: Icons.location_on_outlined,
          onChanged: (value) => setState(() => _selectedCity = value),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _ownerNameController,
          label: 'Owner Name',
          prefixIcon: Icons.person_outline,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _ownerContactController,
          label: 'Owner Contact Number',
          prefixIcon: Icons.phone_outlined,
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 16),
        CustomDropdown<String>(
          value: _selectedPropertyType,
          items: const [
            DropdownMenuItem(value: '1bhk', child: Text('1 BHK')),
            DropdownMenuItem(value: '2bhk', child: Text('2 BHK')),
            // Add more property types as needed
          ],
          label: 'Select Property Type',
          prefixIcon: Icons.home_outlined,
          onChanged: (value) => setState(() => _selectedPropertyType = value),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _tellUsMoreController,
          label: 'Tell Us More (Optional)',
          prefixIcon: Icons.edit_outlined,
          maxLines: 3,
        ),
        const SizedBox(height: 20),
        CustomElevatedButton(
          text: 'Submit',
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildFAQSection() {
    return Column(
      children: [
        const Text(
          'FAQs',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        FAQItem(question: 'I had submitted my listing, but it has been rejected. Why?'),
        FAQItem(question: 'How will I get the reward money?'),
        FAQItem(question: 'I have submitted my listing, but have not received the reward?'),
      ],
    );
  }
}
class FAQItem extends StatelessWidget {
  final String question;

  const FAQItem({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child:  ListTile(
        leading: const Icon(Icons.help_outline, color: Colors.pink),
        title: Text(question),
        trailing: const Text(
          'Show',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPhotoButton;

  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isPhotoButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFF4081),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isPhotoButton) const Icon(Icons.arrow_upward, color: Colors.white),
          if (isPhotoButton) const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final int? maxLines;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}

class CustomDropdown<T> extends StatelessWidget {
  final T? value; // Change this to T? instead of String?
  final List<DropdownMenuItem<T>> items;
  final String label;
  final IconData prefixIcon;
  final ValueChanged<T?>? onChanged;

  const CustomDropdown({
    Key? key,
    required this.value,
    required this.items,
    required this.label,
    required this.prefixIcon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon),
      ),
      items: items,
      onChanged: onChanged,
    );
  }
}
