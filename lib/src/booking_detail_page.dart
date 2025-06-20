import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghar_ka_sathi/model/service_model.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingDetailsPage extends StatefulWidget {
  final ServiceModel? bookingDetail;
  const BookingDetailsPage({super.key, this.bookingDetail});

  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late ConfettiController _confettiController;
  late String _paymentStatus;
  late String _bookingStatus;
  final List<String> _progressSteps = ['Booked', 'Confirmed', 'On the way', 'Completed'];
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..forward();

    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );

    // Set payment status
    _paymentStatus = widget.bookingDetail?.paymentStatus ?? 'pending';

    // Determine booking status and current step
    _determineBookingStatus();

    // Play confetti if booking is new or recently confirmed
    if (_currentStep == 1) {
      Future.delayed(Duration(milliseconds: 800), () {
        _confettiController.play();
      });
    }
  }

  void _determineBookingStatus() {
    if (widget.bookingDetail == null) {
      _bookingStatus = 'Pending';
      _currentStep = 0;
      return;
    }

    DateTime bookingDate = DateTime.parse(widget.bookingDetail!.date);
    DateTime now = DateTime.now();

    if (widget.bookingDetail!.paymentStatus == "pending") {
      _bookingStatus = "Pending";
      _currentStep = 0;
    } else if (bookingDate.isAfter(now)) {
      _bookingStatus = "Confirmed";
      _currentStep = 1;
    } else if (bookingDate.day == now.day &&
        bookingDate.month == now.month &&
        bookingDate.year == now.year) {
      _bookingStatus = "On the way";
      _currentStep = 2;
    } else if (bookingDate.isBefore(now)) {
      _bookingStatus = "Completed";
      _currentStep = 3;
    } else {
      _bookingStatus = "Pending";
      _currentStep = 0;
    }
  }

  String _formatDate(String date) {
    try {
      DateTime parsedDate = DateTime.parse(date);
      return DateFormat('EEEE, MMMM d, yyyy').format(parsedDate);
    } catch (e) {
      return 'Invalid Date';
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'confirmed':
        return Colors.blue;
      case 'on the way':
        return Colors.amber;
      case 'completed':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getServiceIcon() {
    String serviceType = widget.bookingDetail?.serviceType.toLowerCase() ?? '';

    if (serviceType.contains('cleaning')) return FontAwesomeIcons.broom;
    if (serviceType.contains('carpenter')) return FontAwesomeIcons.hammer;
    if (serviceType.contains('plumbing')) return FontAwesomeIcons.faucet;
    if (serviceType.contains('electronic')) return FontAwesomeIcons.plug;
    if (serviceType.contains('renovation')) return FontAwesomeIcons.paintRoller;
    if (serviceType.contains('painting')) return FontAwesomeIcons.paintBrush;
    if (serviceType.contains('construction')) return FontAwesomeIcons.hardHat;

    return FontAwesomeIcons.screwdriverWrench;
  }

  void _makePhoneCall() async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: widget.bookingDetail?.mobile ?? '',
    );
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Icon(Icons.arrow_back, color: AppColors.appBarColor),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Booking Details",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0, 1),
                blurRadius: 3,
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background with gradient
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.appBarColor,
                  AppColors.appBarColor.withOpacity(0.8),
                ],
              ),
            ),
          ),

          // Confetti overlay
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              particleDrag: 0.05,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.1,
              shouldLoop: false,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple,
                Colors.yellow,
              ],
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                  // Main content card
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        children: [
                          _buildBookingHeader(),

                          Divider(height: 0, thickness: 1, color: Colors.grey[200]),

                          // Status timeline
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                            color: Colors.grey[50],
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Booking Status',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 16),
                                _buildTimeline(),
                              ],
                            ),
                          ),

                          Divider(height: 0, thickness: 1, color: Colors.grey[200]),

                          // Booking details
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildDetailSection(
                                  title: 'Service Details',
                                  items: [
                                    DetailItem(
                                      icon: _getServiceIcon(),
                                      label: 'Service Type',
                                      value: widget.bookingDetail!.serviceType,
                                    ),
                                    DetailItem(
                                      icon: FontAwesomeIcons.locationDot,
                                      label: 'Service Location',
                                      value: widget.bookingDetail!.location,
                                    ),
                                    DetailItem(
                                      icon: FontAwesomeIcons.calendarDays,
                                      label: 'Date',
                                      value: _formatDate(widget.bookingDetail!.date),
                                    ),
                                    DetailItem(
                                      icon: FontAwesomeIcons.clock,
                                      label: 'Time',
                                      value: widget.bookingDetail!.time,
                                    ),
                                  ],
                                ),

                                SizedBox(height: 24),

                                _buildDetailSection(
                                  title: 'Customer Details',
                                  items: [
                                    DetailItem(
                                      icon: FontAwesomeIcons.user,
                                      label: 'Customer Name',
                                      value: widget.bookingDetail!.name,
                                    ),
                                    DetailItem(
                                      icon: FontAwesomeIcons.phone,
                                      label: 'Contact Number',
                                      value: widget.bookingDetail!.mobile,
                                      isInteractive: true,
                                      onTap: _makePhoneCall,
                                    ),
                                    DetailItem(
                                      icon: FontAwesomeIcons.envelope,
                                      label: 'Email',
                                      value: widget.bookingDetail!.email,
                                    ),
                                  ],
                                ),

                                SizedBox(height: 24),

                                _buildDetailSection(
                                  title: 'Payment Details',
                                  items: [
                                    DetailItem(
                                      icon: FontAwesomeIcons.moneyBill,
                                      label: 'Payment Status',
                                      value: _paymentStatus.capitalize(),
                                      valueColor: _getStatusColor(_paymentStatus),
                                    ),
                                    DetailItem(
                                      icon: FontAwesomeIcons.hashtag,
                                      label: 'Booking ID',
                                      value: widget.bookingDetail!.id.substring(0, 8),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 24),

                  // Bottom buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildButton(
                            label: 'Cancel Booking',
                            icon: Icons.cancel_outlined,
                            color: Colors.red,
                            onTap: () {
                              _showCancelDialog();
                            },
                            isOutlined: true,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: _buildButton(
                            label: 'Confirm',
                            icon: Icons.check_circle_outline,
                            color: AppColors.appBarColor,
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Service Icon
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: 1.0 + 0.1 * _animationController.value,
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.appBarColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _getServiceIcon(),
                    size: 32,
                    color: AppColors.appBarColor,
                  ),
                ),
              );
            },
          ),
          SizedBox(width: 16),

          // Service Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.bookingDetail?.serviceType ?? 'Service',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: _getStatusColor(_bookingStatus).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: _getStatusColor(_bookingStatus).withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    _bookingStatus,
                    style: TextStyle(
                      color: _getStatusColor(_bookingStatus),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    return Container(
      height: 100,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _progressSteps.length,
        itemBuilder: (context, index) {
          bool isActive = index <= _currentStep;
          bool isCompleted = index < _currentStep;

          return Container(
            width: MediaQuery.of(context).size.width / _progressSteps.length - 16,
            child: TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.center,
              isFirst: index == 0,
              isLast: index == _progressSteps.length - 1,
              beforeLineStyle: LineStyle(
                color: isActive ? AppColors.appBarColor : Colors.grey[300]!,
                thickness: 3,
              ),
              afterLineStyle: LineStyle(
                color: isCompleted ? AppColors.appBarColor : Colors.grey[300]!,
                thickness: 3,
              ),
              indicatorStyle: IndicatorStyle(
                width: 30,
                height: 30,
                indicator: Container(
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.appBarColor : Colors.grey[300],
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isActive ? AppColors.appBarColor : Colors.grey[300]!,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: isCompleted
                        ? Icon(Icons.check, color: Colors.white, size: 16)
                        : (isActive
                        ? Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    )
                        : null),
                  ),
                ),
              ),
              endChild: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    SizedBox(height: 6),
                    Text(
                      _progressSteps[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                        color: isActive ? AppColors.appBarColor : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailSection({
    required String title,
    required List<DetailItem> items
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: _buildDetailItem(item),
        )).toList(),
      ],
    );
  }

  Widget _buildDetailItem(DetailItem item) {
    return InkWell(
      onTap: item.isInteractive ? item.onTap : null,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.appBarColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                item.icon,
                size: 16,
                color: AppColors.appBarColor,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.label,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.value,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: item.valueColor ?? Colors.black87,
                          ),
                        ),
                      ),
                      if (item.isInteractive)
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: AppColors.appBarColor,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    bool isOutlined = false,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isOutlined ? Colors.white : color,
        foregroundColor: isOutlined ? color : Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15),
        elevation: isOutlined ? 0 : 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: isOutlined ? BorderSide(color: color, width: 1.5) : BorderSide.none,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  void _showCancelDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text('Cancel Booking'),
          content: Text('Are you sure you want to cancel this booking?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No', style: TextStyle(color: Colors.grey[700])),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Add cancellation logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Booking cancelled successfully'),
                    backgroundColor: Colors.red,
                  ),
                );
                Navigator.of(context).pop(); // Go back to booking list
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Yes, Cancel', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}

class DetailItem {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;
  final bool isInteractive;
  final VoidCallback? onTap;

  DetailItem({
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
    this.isInteractive = false,
    this.onTap,
  });
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}