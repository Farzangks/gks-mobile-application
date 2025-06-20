// lib/widgets/rating_widgets.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/controller/ratting_controller.dart';
import 'package:ghar_ka_sathi/model/ratting_model.dart';
import 'package:ghar_ka_sathi/src/review_ratting_component.dart';
import 'package:ghar_ka_sathi/src/add_review_screen.dart';
import 'package:ghar_ka_sathi/src/edit_review_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';

/// Small rating indicator to show in service cards
class RatingIndicator extends StatelessWidget {
  final String serviceType;
  final TextStyle? textStyle;
  final double starSize;
  final bool showCount;
  final VoidCallback? onTap;

  const RatingIndicator({
    Key? key,
    required this.serviceType,
    this.textStyle,
    this.starSize = 16,
    this.showCount = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RatingController>();

    // Try to load ratings if not already cached
    if (!controller.hasCachedData(serviceType)) {
      controller.loadRatings(serviceType);
    }

    return InkWell(
      onTap: onTap ?? () => Get.to(() => ReviewScreen(serviceType: serviceType)),
      child: Obx(() {
        final averageRating = controller.getAverageRatingForService(serviceType);
        final totalRatings = controller.getTotalRatingsForService(serviceType);

        if (controller.isLoading.value && !controller.hasCachedData(serviceType)) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Row(
              children: [
                Icon(Icons.star, size: starSize, color: Colors.grey[300]),
                const SizedBox(width: 4),
                Container(
                  width: 30,
                  height: 14,
                  color: Colors.white,
                ),
                if (showCount) const SizedBox(width: 2),
                if (showCount)
                  Container(
                    width: 50,
                    height: 14,
                    color: Colors.white,
                  ),
              ],
            ),
          );
        }

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              size: starSize,
              color: AppColors.appBarColor,
            ),
            const SizedBox(width: 4),
            Text(
              averageRating.toStringAsFixed(1),
              style: textStyle ?? TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
                fontSize: starSize * 0.9,
              ),
            ),
            if (showCount) ...[
              const SizedBox(width: 2),
              Text(
                "(${totalRatings})",
                style: textStyle ?? TextStyle(
                  color: Colors.grey[600],
                  fontSize: starSize * 0.8,
                ),
              ),
            ],
          ],
        );
      }),
    );
  }
}

/// Star rating display
class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  final Color? color;
  final MainAxisAlignment alignment;
  final bool allowHalf;

  const StarRating({
    Key? key,
    required this.rating,
    this.size = 24,
    this.color,
    this.alignment = MainAxisAlignment.start,
    this.allowHalf = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final starColor = color ?? AppColors.appBarColor;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: alignment,
      children: List.generate(5, (index) {
        if (allowHalf && (index + 0.5) == rating.floor() + 0.5) {
          return Icon(
            Icons.star_half,
            color: starColor,
            size: size,
          );
        }

        return Icon(
          index < rating.floor() ? Icons.star : Icons.star_border,
          color: starColor,
          size: size,
        );
      }),
    );
  }
}

/// Rating summary widget
class RatingSummaryWidget extends StatelessWidget {
  final String serviceType;
  final bool showAddReviewButton;

  const RatingSummaryWidget({
    Key? key,
    required this.serviceType,
    this.showAddReviewButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RatingController>();

    return Obx(() {
      if (controller.isLoading.value && !controller.hasCachedData(serviceType)) {
        return const RatingSummarySkeleton();
      }

      final ratings = controller.getRatingsForService(serviceType);
      if (ratings == null) {
        return const Center(
          child: Text('No ratings available'),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.appBarColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: AppColors.appBarColor, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      ratings.averageRating.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.appBarColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${ratings.totalRatings} ${ratings.totalRatings == 1 ? 'review' : 'reviews'}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    StarRating(
                      rating: ratings.averageRating,
                      size: 16,
                    ),
                  ],
                ),
              ),
              if (showAddReviewButton)
                ElevatedButton.icon(
                  onPressed: () => Get.to(() => AddReviewScreen(serviceType: serviceType)),
                  icon: const Icon(Icons.rate_review, size: 16,color: AppColors.white,),
                  label: const Text('Rate'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.appBarColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          ...List.generate(5, (index) {
            int star = 5 - index;
            String starKey = star.toString();
            int count = ratings.ratingSummary[starKey] as int? ?? 0;

            // Also check for half star ratings that round to this star
            ratings.ratingSummary.forEach((key, value) {
              double rating = double.tryParse(key) ?? 0;
              if (rating > star - 0.75 && rating < star + 0.25 && rating != star.toDouble()) {
                count += value as int;
              }
            });

            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Text(
                    '$star',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.star, color: AppColors.appBarColor, size: 14),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: ratings.totalRatings > 0
                            ? count / ratings.totalRatings
                            : 0,
                        backgroundColor: Colors.grey[200],
                        color: _getProgressColor(star),
                        minHeight: 8,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 36,
                    child: Text(
                      '($count)',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      );
    });
  }

  Color _getProgressColor(int star) {
    switch (star) {
      case 5:
        return Colors.green;
      case 4:
        return Colors.lightGreen;
      case 3:
        return Colors.amber;
      case 2:
        return Colors.orange;
      case 1:
        return Colors.red;
      default:
        return AppColors.appBarColor;
    }
  }
}

class RatingSummarySkeleton extends StatelessWidget {
  const RatingSummarySkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 80,
                    height: 12,
                    color: Colors.white,
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 70,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 14,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Container(
                    width: 14,
                    height: 14,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 36,
                    height: 14,
                    color: Colors.white,
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class ReviewList extends StatelessWidget {
  final String serviceType;
  final bool showDividers;
  final EdgeInsetsGeometry? padding;
  final int? maxItems;

  const ReviewList({
    Key? key,
    required this.serviceType,
    this.showDividers = true,
    this.padding,
    this.maxItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RatingController>();

    return Obx(() {
      if (controller.isLoading.value && !controller.hasCachedData(serviceType)) {
        return const ReviewListSkeleton();
      }

      final reviews = controller.getRatingListForService(serviceType);

      if (reviews.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.rate_review_outlined, size: 48, color: Colors.grey[400]),
              const SizedBox(height: 16),
              const Text(
                'No reviews yet',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Be the first to review this service',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => Get.to(() => AddReviewScreen(serviceType: serviceType)),
                icon: const Icon(Icons.star),
                label: const Text('Write a Review'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appBarColor,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        );
      }

      final displayReviews = maxItems != null && reviews.length > maxItems!
          ? reviews.sublist(0, maxItems)
          : reviews;

      return ListView.separated(
        padding: padding ?? EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: displayReviews.length + (maxItems != null && reviews.length > maxItems! ? 1 : 0),
        separatorBuilder: (context, index) {
          return showDividers
              ? Divider(color: Colors.grey[200], height: 24)
              : const SizedBox(height: 16);
        },
        itemBuilder: (context, index) {
          if (maxItems != null && reviews.length > maxItems! && index == displayReviews.length) {
            return Center(
              child: TextButton.icon(
                onPressed: () => Get.to(() => ReviewScreen(serviceType: serviceType)),
                icon: const Icon(Icons.more_horiz),
                label: const Text('View all reviews'),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.appBarColor,
                ),
              ),
            );
          }

          final review = displayReviews[index];
          return ReviewCard(review: review);
        },
      );
    });
  }
}

class ReviewListSkeleton extends StatelessWidget {
  const ReviewListSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: 80,
                          height: 12,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 80,
                      height: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  height: 12,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 12,
                  color: Colors.white,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Update this class in your rating_widgets.dart file

class ReviewCard extends StatelessWidget {
  final Rating review;
  final bool elevated;
  final bool showActions;

  const ReviewCard({
    Key? key,
    required this.review,
    this.elevated = true,
    this.showActions = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: elevated
          ? BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      )
          : null,
      padding: elevated ? const EdgeInsets.all(16) : EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.appBarColor.withOpacity(0.9),
                child: Text(
                  review.name[0].toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      DateFormat('MMM d, yyyy').format(review.createdAt),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              if (showActions)
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert),
                  onSelected: (value) => _handleAction(context, value),
                  itemBuilder: (context) => [
                    const PopupMenuItem<String>(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit, size: 18),
                          SizedBox(width: 8),
                          Text('Edit Review'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete, size: 18, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Delete Review', style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                  ],
                ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getRatingColor(review.rating),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      review.rating.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            review.comments,
            style: const TextStyle(
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  void _handleAction(BuildContext context, String action) {
    final controller = Get.find<RatingController>();

    switch (action) {
      case 'edit':
        Get.to(() => EditReviewScreen(review: review));
        break;
      case 'delete':
        _showDeleteConfirmation(context, controller);
        break;
    }
  }

  void _showDeleteConfirmation(BuildContext context, RatingController controller) {
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

              final success = await controller.deleteRating(
                review.id,
                review.serviceType,
              );

              if (success) {
                // Success message is already shown by the controller
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

  Color _getRatingColor(double rating) {
    if (rating >= 4.5) return Colors.green;
    if (rating >= 4.0) return Colors.lightGreen;
    if (rating >= 3.0) return Colors.amber;
    if (rating >= 2.0) return Colors.orange;
    return Colors.red;
  }
}