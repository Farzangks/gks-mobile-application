// lib/src/edit_review_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/controller/ratting_controller.dart';
import 'package:ghar_ka_sathi/model/ratting_model.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:itq_utils/itq_utils.dart';

class EditReviewScreen extends StatefulWidget {
  final Rating review;

  const EditReviewScreen({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  State<EditReviewScreen> createState() => _EditReviewScreenState();
}

class _EditReviewScreenState extends State<EditReviewScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _commentController;

  // Get the RatingController, initializing it if needed
  late final RatingController _ratingController;

  @override
  void initState() {
    super.initState();
    // Initialize controller if not already registered
    if (!Get.isRegistered<RatingController>()) {
      Get.put(RatingController(), permanent: true);
    }
    _ratingController = Get.find<RatingController>();

    // Set initial values from the review being edited
    _nameController = TextEditingController(text: widget.review.name);
    _emailController = TextEditingController(text: widget.review.email);
    _commentController = TextEditingController(text: widget.review.comments);
    _ratingController.newRating.value = widget.review.rating;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _updateReview() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Hide keyboard
    FocusScope.of(context).unfocus();

    // Prepare data for API submission
    final success = await _ratingController.updateRating(
      ratingId: widget.review.id,
      name: _nameController.text,
      email: _emailController.text,
      comments: _commentController.text,
      rating: _ratingController.newRating.value,
      serviceType: widget.review.serviceType,
    );

    // Handle result
    if (success && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Review updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      // Close screen after successful update
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Edit Review'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _showDeleteConfirmation(),
            tooltip: 'Delete Review',
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Hide keyboard when tapping outside
        behavior: HitTestBehavior.translucent,
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Service type indicator
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.home_repair_service, color: Colors.grey[700]),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Service Type',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          widget.review.serviceType.capitalizeFirst ?? 'Service',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Star rating
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Rating',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Obx(() => RatingBar(
                        rating: _ratingController.newRating.value,
                        onRatingUpdate: (value) {
                          _ratingController.newRating.value = value;
                        },
                      )),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Form fields
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Your Name',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email or Phone',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email or phone';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _commentController,
                minLines: 4,
                maxLines: 6,
                decoration: InputDecoration(
                  labelText: 'Your Review',
                  hintText: 'Share your experience with this service...',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your review';
                  }
                  if (value.length < 5) {
                    return 'Your review is too short';
                  }
                  return null;
                },
              ),

              // Error message
              Obx(() {
                if (_ratingController.errorMessage.isEmpty) {
                  return const SizedBox(height: 24);
                }

                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red[200]!),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.error_outline, color: Colors.red[700]),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _ratingController.errorMessage.value,
                            style: TextStyle(color: Colors.red[700]),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),

              const SizedBox(height: 32),

              // Submit button
              Obx(() => ElevatedButton(
                onPressed: _ratingController.isSubmitting.value
                    ? null
                    : _updateReview,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appBarColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 2,
                ),
                child: _ratingController.isSubmitting.value
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
                    : const Text(
                  'Update Review',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Review'),
        content: const Text('Are you sure you want to delete this review? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context); // Close dialog

              final success = await _ratingController.deleteRating(
                widget.review.id,
                widget.review.serviceType,
              );

              if (success && context.mounted) {
                Navigator.pop(context); // Close edit screen
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final double rating;
  final ValueChanged<double> onRatingUpdate;
  final double size;
  final int starCount;

  const RatingBar({
    Key? key,
    required this.rating,
    required this.onRatingUpdate,
    this.size = 48,
    this.starCount = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        return GestureDetector(
          onTap: () {
            onRatingUpdate(index + 1.0);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size * 0.1),
            child: Icon(
              index < rating ? Icons.star : Icons.star_border,
              color: AppColors.appBarColor,
              size: size,
            ),
          ),
        );
      }),
    );
  }
}