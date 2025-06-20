// lib/src/review_ratting_component.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/component/ratting_widgets.dart';
import 'package:ghar_ka_sathi/controller/ratting_controller.dart';
import 'package:ghar_ka_sathi/src/add_review_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class ReviewScreen extends StatefulWidget {
  final String serviceType;

  const ReviewScreen({
    Key? key,
    required this.serviceType,
  }) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final RatingController _controller = Get.find<RatingController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Initialize RatingController if it doesn't exist
    if (!Get.isRegistered<RatingController>()) {
      Get.put(RatingController(), permanent: true);
    }

    // Load ratings if not already loaded
    if (!_controller.hasCachedData(widget.serviceType)) {
      _controller.loadRatings(widget.serviceType);
    }

    // Add scroll listener for pagination
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Load more when near bottom
      _controller.loadMoreRatings(widget.serviceType);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration:  BoxDecoration(
              color: AppColors.appBarColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: const Center(
              child: Text(
                'Ratings & Reviews',
                style: TextStyle(
                  color: AppColors.appBarColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Main content
          Expanded(
            child: RefreshIndicator(
              color: AppColors.appBarColor,
              onRefresh: () => _controller.loadRatings(widget.serviceType, refresh: true),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  // Rating summary
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.white,
                      child: RatingSummaryWidget(serviceType: widget.serviceType),
                    ),
                  ),

                  // Reviews header
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Reviews',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () => Get.to(() => AddReviewScreen(serviceType: widget.serviceType)),
                            icon: const Icon(Icons.add, size: 18),
                            label: const Text('Add Review'),
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
                    ),
                  ),

                  // Reviews list or placeholders
                  Obx(() {
                    if (_controller.isLoading.value && !_controller.hasCachedData(widget.serviceType)) {
                      return const SliverToBoxAdapter(child: ReviewListSkeleton());
                    }

                    final reviews = _controller.getRatingListForService(widget.serviceType);

                    if (reviews.isEmpty) {
                      return SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            'No reviews yet. Be the first to leave a review!',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      );
                    }

                    return SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ReviewCard(
                                review: reviews[index],
                                showActions: true, // Enable edit/delete options
                              ),
                            );
                          },
                          childCount: reviews.length,
                        ),
                      ),
                    );
                  }),

                  // Loading indicator or load more button
                  SliverToBoxAdapter(
                    child: Obx(() {
                      if (_controller.isLoading.value && _controller.hasCachedData(widget.serviceType)) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      if (_controller.hasMorePages.value) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: OutlinedButton(
                              onPressed: () => _controller.loadMoreRatings(widget.serviceType),
                              child: const Text('Load More'),
                            ),
                          ),
                        );
                      }

                      return const SizedBox(height: 24);
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}