// lib/widgets/booking_success_dialog.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/constant.dart';
import 'package:get/get.dart';

class BookingSuccessDialog extends StatefulWidget {
  final String serviceName;
  final String date;
  final String time;
  final VoidCallback onViewBookings;
  final VoidCallback onClose;

  const BookingSuccessDialog({
    Key? key,
    required this.serviceName,
    required this.date,
    required this.time,
    required this.onViewBookings,
    required this.onClose,
  }) : super(key: key);

  static void show({
    required BuildContext context,
    required String serviceName,
    required String date,
    required String time,
    required VoidCallback onViewBookings,
    required VoidCallback onClose,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: "Booking Success",
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, anim1, anim2) => BookingSuccessDialog(
        serviceName: serviceName,
        date: date,
        time: time,
        onViewBookings: onViewBookings,
        onClose: onClose,
      ),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.elasticOut,
            ),
          ),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }

  @override
  State<BookingSuccessDialog> createState() => _BookingSuccessDialogState();
}

class _BookingSuccessDialogState extends State<BookingSuccessDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _blurAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _blurAnimation = Tween<double>(begin: 0, end: 5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();

    // Auto close after 10 seconds if user doesn't interact
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        widget.onClose();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 400),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.appBarColor.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: child,
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top decoration bar
                Container(
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.appBarColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Heading
                const Text(
                  "Booking Confirmed!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.appBarColor,
                  ),
                ),

                const SizedBox(height: 8),

                // Lottie Animation
                SizedBox(
                  height: 210,
                  width: 210,
                  child: Lottie.asset(
                    'assets/animations/booking_success.json',
                    fit: BoxFit.contain,
                    repeat: false,
                    onLoaded: (composition) {
                      _animationController.duration = composition.duration;
                      _animationController.forward();
                    },
                  ),
                ),

                const SizedBox(height: 16),

                // Success message
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Your ${widget.serviceName} service has been booked successfully!",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Divider
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Divider(thickness: 1),
                ),

                const SizedBox(height: 16),

                // Booking details
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDetailItem(
                        icon: Icons.calendar_today,
                        label: "Date",
                        value: widget.date,
                      ),
                      _buildDetailItem(
                        icon: Icons.access_time,
                        label: "Time",
                        value: widget.time,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Action buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: widget.onClose,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            side: const BorderSide(color: AppColors.appBarColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Close",
                            style: TextStyle(
                              color: AppColors.appBarColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Expanded(
                      //   child: ElevatedButton(
                      //     onPressed: widget.onViewBookings,
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: AppColors.appBarColor,
                      //       foregroundColor: Colors.white,
                      //       padding: const EdgeInsets.symmetric(vertical: 12),
                      //       elevation: 0,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(12),
                      //       ),
                      //     ),
                      //     child: const Text(
                      //       "View Bookings",
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.appBarColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: AppColors.appBarColor,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}