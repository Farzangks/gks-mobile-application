import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _feedbackController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  int _rating = 0;
  String _selectedFeedbackType = "";
  bool _isLoading = false;
  bool _hasUploadedPhoto = false;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    _emailController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _submitFeedback() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_rating == 0) {
        _showSnackBar('Please provide a rating', isError: true);
        return;
      }
      if (_selectedFeedbackType.isEmpty) {
        _showSnackBar('Please select a feedback type', isError: true);
        return;
      }

      setState(() {
        _isLoading = true;
      });

      try {
        // Simulate API call
        await Future.delayed(const Duration(seconds: 2));

        print("Rating: $_rating");
        print("Feedback Type: $_selectedFeedbackType");
        print("Feedback: ${_feedbackController.text}");
        print("Email: ${_emailController.text}");

        _showSnackBar('Feedback submitted successfully!', isError: false);
        _clearForm();

      } catch (e) {
        _showSnackBar('Failed to submit feedback. Please try again.', isError: true);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showSnackBar(String message, {required bool isError}) {
    Get.snackbar(
      isError ? 'Error' : 'Success',
      message,
      backgroundColor: isError ? AppColors.btnDarkRed : Colors.green,
      colorText: Colors.white,
      icon: Icon(
        isError ? Icons.error : Icons.check_circle,
        color: Colors.white,
      ),
    );
  }

  void _clearForm() {
    _feedbackController.clear();
    _emailController.clear();
    setState(() {
      _rating = 0;
      _selectedFeedbackType = "";
      _hasUploadedPhoto = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.redGradient,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.2),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
        title: const Text(
          'Feedback',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.bgColor,
              AppColors.bgColors.withOpacity(0.3),
            ],
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.btnLightRed.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.bgColors.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.feedback_outlined,
                          size: 32,
                          color: AppColors.appBarColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Share Your Feedback",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.appBarColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Help us improve by sharing your thoughts and experiences",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Rating Section
                _buildRatingSection(),

                const SizedBox(height: 16),

                // Feedback Type Section
                _buildFeedbackTypeSection(),

                const SizedBox(height: 16),

                // Feedback Text Section
                _buildFeedbackTextSection(),

                const SizedBox(height: 16),

                // Photo Upload Section
                _buildPhotoUploadSection(),

                const SizedBox(height: 16),

                // Email Section
                _buildEmailSection(),

                const SizedBox(height: 24),

                // Submit Button
                _buildSubmitButton(),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRatingSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.btnLightRed.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.bgColors.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.star_rate_outlined,
                  size: 20,
                  color: AppColors.appBarColor,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "How was your experience?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.appBarColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() => _rating = index + 1);
                    _animationController.forward().then((_) {
                      _animationController.reverse();
                    });
                  },
                  child: AnimatedBuilder(
                    animation: _scaleAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: index < _rating ? _scaleAnimation.value : 1.0,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(
                            index < _rating ? Icons.star_rounded : Icons.star_border_rounded,
                            color: index < _rating ? Colors.amber : Colors.grey[400],
                            size: 36,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ),
          if (_rating > 0) ...[
            const SizedBox(height: 8),
            Center(
              child: Text(
                _getRatingText(_rating),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.appBarColor,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFeedbackTypeSection() {
    final feedbackTypes = [
      {"label": "Bug Report", "icon": Icons.bug_report_outlined},
      {"label": "Feature Request", "icon": Icons.lightbulb_outline},
      {"label": "General Feedback", "icon": Icons.chat_bubble_outline},
      {"label": "Other", "icon": Icons.more_horiz_outlined},
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.btnLightRed.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.bgColors.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.category_outlined,
                  size: 20,
                  color: AppColors.appBarColor,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "What type of feedback do you have?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.appBarColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: feedbackTypes.map((type) {
              final isSelected = _selectedFeedbackType == type["label"];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedFeedbackType = isSelected ? "" : type["label"] as String;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: isSelected
                        ? const LinearGradient(colors: AppColors.redGradient)
                        : null,
                    color: isSelected ? null : AppColors.bgColors.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected ? Colors.transparent : AppColors.secondaryBtnLigRed,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        type["icon"] as IconData,
                        size: 16,
                        color: isSelected ? Colors.white : AppColors.appBarColor,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        type["label"] as String,
                        style: TextStyle(
                          color: isSelected ? Colors.white : AppColors.appBarColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFeedbackTextSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.btnLightRed.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.bgColors.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.edit_outlined,
                  size: 20,
                  color: AppColors.appBarColor,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "Tell us more",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.appBarColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _feedbackController,
            maxLines: 4,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please provide your feedback';
              }
              if (value!.length < 10) {
                return 'Please provide more details (at least 10 characters)';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Share your thoughts, suggestions, or report issues...",
              hintStyle: TextStyle(color: Colors.grey[400]),
              filled: true,
              fillColor: AppColors.bgColor.withOpacity(0.3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.secondaryBtnLigRed,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.secondaryBtnLigRed,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.appBarColor,
                  width: 2,
                ),
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoUploadSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.btnLightRed.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.bgColors.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 20,
                  color: AppColors.appBarColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "Attach screenshots or photos (Optional)",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.appBarColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              setState(() {
                _hasUploadedPhoto = !_hasUploadedPhoto;
              });
              _showSnackBar(
                _hasUploadedPhoto ? 'Photo uploaded successfully!' : 'Photo removed',
                isError: false,
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _hasUploadedPhoto
                    ? AppColors.secondaryBtnLigRed.withOpacity(0.2)
                    : AppColors.bgColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _hasUploadedPhoto
                      ? AppColors.appBarColor
                      : AppColors.secondaryBtnLigRed,
                  width: _hasUploadedPhoto ? 2 : 1,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    _hasUploadedPhoto ? Icons.check_circle : Icons.cloud_upload_outlined,
                    size: 32,
                    color: _hasUploadedPhoto ? AppColors.appBarColor : Colors.grey[600],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _hasUploadedPhoto ? 'Photo uploaded successfully' : 'Tap to upload photos',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: _hasUploadedPhoto ? AppColors.appBarColor : Colors.grey[600],
                    ),
                  ),
                  if (!_hasUploadedPhoto) ...[
                    const SizedBox(height: 4),
                    Text(
                      'Supports JPG, PNG files',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.btnLightRed.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.bgColors.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.email_outlined,
                  size: 20,
                  color: AppColors.appBarColor,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "Contact Information",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.appBarColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your email address';
              }
              if (!GetUtils.isEmail(value!)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Enter your email address",
              hintStyle: TextStyle(color: Colors.grey[400]),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: AppColors.btnLightRed,
                size: 20,
              ),
              filled: true,
              fillColor: AppColors.bgColor.withOpacity(0.3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.secondaryBtnLigRed,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.secondaryBtnLigRed,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.appBarColor,
                  width: 2,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: AppColors.redGradient,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.btnLightRed.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: _isLoading ? null : _submitFeedback,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: _isLoading
            ? const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        )
            : const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.send_rounded,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              "Submit Feedback",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getRatingText(int rating) {
    switch (rating) {
      case 1: return "Poor";
      case 2: return "Fair";
      case 3: return "Good";
      case 4: return "Very Good";
      case 5: return "Excellent";
      default: return "";
    }
  }
}