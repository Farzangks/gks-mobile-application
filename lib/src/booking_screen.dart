import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/controller/property_service_controller.dart';
import 'package:ghar_ka_sathi/model/service_model.dart';
import 'package:ghar_ka_sathi/src/booking_detail_page.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/constant.dart';
import 'package:itq_utils/itq_utils.dart';
import 'package:intl/intl.dart';

import 'package:lottie/lottie.dart';

class BookingScreen extends StatefulWidget {
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final controller = Get.put(PropertyServiceController());
  // Tab indices: 0 = Ongoing, 1 = Completed, 2 = Pending, 3 = Cancelled
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _loadBookings();
  }

  void _loadBookings() {
    String email = getStringAsync(emailMobile);
    controller.getPropertyServicesByEmail(context, email);
  }

  String _formatDate(String dateStr) {
    try {
      // Handle different date formats
      DateTime date;
      if (dateStr.contains('T')) {
        // ISO format
        date = DateTime.parse(dateStr);
      } else {
        // Simple format
        date = DateTime.parse(dateStr);
      }
      return DateFormat('dd/MM/yyyy').format(date);
    } catch (e) {
      print("Date parsing error: $e for date: $dateStr");
      return 'Invalid Date';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Bookings', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _loadBookings,
          ),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs
            Container(
              margin: EdgeInsets.only(bottom: 16),
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  BookingTab(
                    title: 'Ongoing',
                    isSelected: selectedTab == 0,
                    onTap: () => setState(() => selectedTab = 0),
                  ),
                  BookingTab(
                    title: 'Completed',
                    isSelected: selectedTab == 1,
                    onTap: () => setState(() => selectedTab = 1),
                  ),
                  BookingTab(
                    title: 'Pending',
                    isSelected: selectedTab == 2,
                    onTap: () => setState(() => selectedTab = 2),
                  ),
                  BookingTab(
                    title: 'Cancelled',
                    isSelected: selectedTab == 3,
                    onTap: () => setState(() => selectedTab = 3),
                  ),
                ],
              ),
            ),

            // Booking List
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: AppColors.appBarColor),
                        SizedBox(height: 16),
                        Text('Loading your bookings...',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  );
                }

                if (controller.serviceByEmailData.isEmpty) {
                  return _buildEmptyState('No bookings found',
                      'You haven\'t made any bookings yet. Book a service to get started.');
                }

                final filteredBookings = controller.serviceByEmailData.where((booking) {
                  String status = controller.getBookingStatus(booking);

                  switch (selectedTab) {
                    case 0: return status == 'Ongoing';
                    case 1: return status == 'Completed';
                    case 2: return status == 'Pending';
                    case 3: return status == 'Cancelled';
                    default: return false;
                  }
                }).toList();

                if (filteredBookings.isEmpty) {
                  String tabName = selectedTab == 0 ? 'Ongoing' :
                  selectedTab == 1 ? 'Completed' :
                  selectedTab == 2 ? 'Pending' : 'Cancelled';

                  return _buildEmptyState(
                      'No $tabName Bookings',
                      'You don\'t have any $tabName bookings at the moment.'
                  );
                }

                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: filteredBookings.length,
                  itemBuilder: (context, index) {
                    final booking = filteredBookings[index];
                    final status = controller.getBookingStatus(booking);

                    return BookingCard(
                      icon: controller.getServiceIcon(booking.serviceType),
                      title: booking.serviceType,
                      status: status,
                      statusColor: controller.getStatusColor(status),
                      name: booking.name,
                      rating: 4.5, // Default rating
                      date: _formatDate(booking.date),
                      time: booking.time,
                      address: booking.location,
                      bookingId: booking.id.substring(0, 8), // First 8 chars of ID
                      price: 0.0, // Price not available in the response
                      booking: booking, // Pass the full booking object
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(String title, String subtitle) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.event_busy, size: 80, color: Colors.grey[300]),
          SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
          SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              // Navigate to service booking page
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.appBarColor,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: Icon(Icons.add, color: Colors.white),
            label: Text('Book a Service', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class BookingTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  BookingTab({required this.title, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? AppColors.appBarColor : Colors.grey[100],
          foregroundColor: isSelected ? Colors.white : Colors.grey[800],
          elevation: isSelected ? 2 : 0,
          padding: EdgeInsets.symmetric(horizontal: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
              color: isSelected ? Colors.transparent : Colors.grey[300]!,
              width: 1,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String status;
  final Color statusColor;
  final String name;
  final double rating;
  final String date;
  final String time;
  final String address;
  final String bookingId;
  final double price;
  final ServiceModel booking; // Added booking model

  BookingCard({
    required this.icon,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.name,
    required this.rating,
    required this.date,
    required this.time,
    required this.address,
    required this.bookingId,
    required this.price,
    required this.booking, // Required parameter
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to booking details page
        Get.to(() => BookingDetailsPage(bookingDetail: booking));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.appBarColor.withOpacity(0.7),
                      AppColors.appBarColor,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.appBarColor.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(icon, size: 28, color: Colors.white),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: statusColor.withOpacity(0.5), width: 1),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 14, color: AppColors.appBarColor.withOpacity(0.7)),
                        SizedBox(width: 6),
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 12),
                        Icon(Icons.access_time_rounded, size: 14, color: AppColors.appBarColor.withOpacity(0.7)),
                        SizedBox(width: 6),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 14, color: AppColors.appBarColor.withOpacity(0.7)),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            address,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 13,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 20, thickness: 1, color: Colors.grey[200]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ID: #${bookingId}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'View Details',
                              style: TextStyle(
                                color: AppColors.appBarColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 12,
                              color: AppColors.appBarColor,
                            ),
                          ],
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
    );
  }
}
