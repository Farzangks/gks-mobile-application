import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ScheduleTourSection extends StatefulWidget {
  final String propertyName;
  final Function(
      String date,
      String time,
      String tourType,
      String name,
      String phone,
      String email,
      String message,
      ) onSubmit;

  const ScheduleTourSection({
    Key? key,
    required this.propertyName,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _ScheduleTourSectionState createState() => _ScheduleTourSectionState();
}

class _ScheduleTourSectionState extends State<ScheduleTourSection> {
  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  // Selected values
  DateTime _selectedDate = DateTime.now();
  String? _selectedTime;
  String _tourType = 'In Person'; // Default tour type

  // Time slots
  final List<String> _timeSlots = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
  ];

  // Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.btnColor.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Schedule A Tour',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.btnColor,
              ),
            ),
            const SizedBox(height: 24),

            // Date Selection
            _buildDateSelection(),
            const SizedBox(height: 24),

            // Tour Type Selection
            _buildTourTypeSelection(),
            const SizedBox(height: 24),

            // Time Dropdown
            _buildTimeDropdown(),
            const SizedBox(height: 16),

            // Contact Information
            _buildTextField(
              controller: _nameController,
              hintText: 'Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            _buildTextField(
              controller: _phoneController,
              hintText: 'Phone',
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            _buildTextField(
              controller: _emailController,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Message Field
            _buildTextField(
              controller: _messageController,
              hintText: 'Enter your Message',
              maxLines: 4,
            ),
            const SizedBox(height: 16),

            // Terms of Use
            Row(
              children: [
                Text(
                  'By submitting this form I agree to ',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle terms of use tap
                  },
                  child: Text(
                    'Terms of Use',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.btnColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEF0217), // Green color
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Submit a Tour Request',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelection() {
    // Calculate next 7 days
    final dates = List.generate(7, (index) {
      return DateTime.now().add(Duration(days: index));
    });

    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemBuilder: (context, index) {
          final date = dates[index];
          final isSelected = _isSameDay(date, _selectedDate);

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDate = date;
              });
            },
            child: Container(
              width: 50,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? AppColors.btnColor : Colors.grey.shade300,
                  width: isSelected ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('E').format(date), // Day of week (Mon, Tue, etc.)
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    DateFormat('d').format(date), // Day number (1, 2, etc.)
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? AppColors.btnColor : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    DateFormat('MMM').format(date), // Month (Jan, Feb, etc.)
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTourTypeSelection() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _tourType = 'In Person';
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _tourType == 'In Person' ? AppColors.btnColor : Colors.grey.shade300,
                  width: _tourType == 'In Person' ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(8),
                color: _tourType == 'In Person' ? AppColors.btnColor.withOpacity(0.1) : Colors.white,
              ),
              child: Center(
                child: Text(
                  'In Person',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: _tourType == 'In Person' ? AppColors.btnColor : Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _tourType = 'Video Chat';
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _tourType == 'Video Chat' ? AppColors.btnColor : Colors.grey.shade300,
                  width: _tourType == 'Video Chat' ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(8),
                color: _tourType == 'Video Chat' ? AppColors.btnColor.withOpacity(0.1) : Colors.white,
              ),
              child: Center(
                child: Text(
                  'Video Chat',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: _tourType == 'Video Chat' ? AppColors.btnColor : Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeDropdown() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<String>(
        value: _selectedTime,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          border: InputBorder.none,
          hintText: 'Time',
          hintStyle: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        icon: const Icon(Icons.keyboard_arrow_down),
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.black87,
        ),
        onChanged: (String? newValue) {
          setState(() {
            _selectedTime = newValue;
          });
        },
        items: _timeSlots.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select a time';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.grey,
        ),
        filled: false,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.btnColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
      style: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.black87,
      ),
      validator: validator,
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);

      widget.onSubmit(
        formattedDate,
        _selectedTime ?? '',
        _tourType,
        _nameController.text,
        _phoneController.text,
        _emailController.text,
        _messageController.text,
      );

      // Reset form
      _formKey.currentState!.reset();
      _nameController.clear();
      _phoneController.clear();
      _emailController.clear();
      _messageController.clear();

      // Show success message or navigate to confirmation page
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Tour request submitted successfully!',
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}

// Agent Info Widget to display below tour section
class AgentInfoWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onChat;
  final VoidCallback onWhatsApp;
  final VoidCallback onCall;

  const AgentInfoWidget({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.onChat,
    required this.onWhatsApp,
    required this.onCall,
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
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          // Agent Image
          ClipRRect(
            borderRadius: BorderRadius.circular(48),
            child: Image.network(
              imageUrl,
              width: 56,
              height: 56,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 56,
                  height: 56,
                  color: Colors.grey[300],
                  child: const Icon(Icons.person, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(width: 16),

          // Agent Name
          Expanded(
            child: Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),

          // Contact Buttons
          Row(
            children: [
              _buildContactButton(
                icon: Icons.chat_bubble_outline,
                color: Colors.green,
                onTap: onChat,
              ),
              const SizedBox(width: 8),
              _buildContactButton(
                icon: Icons.phone,
                color: Colors.green,
                onTap: onWhatsApp,
              ),
              const SizedBox(width: 8),
              _buildContactButton(
                icon: Icons.phone,
                color: Colors.green,
                onTap: onCall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: color,
          size: 24,
        ),
      ),
    );
  }
}