import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/component/confetti_animation.dart';
import 'package:ghar_ka_sathi/controller/property_service_controller.dart';
import 'package:ghar_ka_sathi/view/in_home_services/address_bottomsheet_components.dart';
import 'package:ghar_ka_sathi/view/in_home_services/cart_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/service_bottom_sheet_components.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/constant.dart';
import 'package:intl/intl.dart';
import 'package:itq_utils/itq_utils.dart';

// Components from your existing code
class CustomBackButton extends StatelessWidget {
  final Function()? onPressed;

  const CustomBackButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios, size: 20),
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
    );
  }
}

// Cart Icon with Counter
class CartIconWithCounter extends StatelessWidget {
  final CartController cartController;
  final VoidCallback onPressed;

  const CartIconWithCounter({
    Key? key,
    required this.cartController,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(Icons.shopping_cart_outlined, size: 28),
            Obx(() {
              final cartCount = cartController.cartCount;
              return cartCount > 0
                  ? Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: AppColors.appBarColor,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          cartCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}

class OrderItemCard extends StatelessWidget {
  final String title;
  final String price;
  final Map<String, String>? details;

  const OrderItemCard({
    Key? key,
    required this.title,
    required this.price,
    this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (details != null) ...[
              const SizedBox(height: 8),
              ...details!.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      Text(
                        '${entry.key}: ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        entry.value,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ],
        ),
      ),
    );
  }
}

class PaymentDetailRow extends StatelessWidget {
  final String label;
  final String amount;
  final TextStyle? labelStyle;
  final TextStyle? amountStyle;
  final bool isBold;
  final Color? amountColor;

  const PaymentDetailRow({
    Key? key,
    required this.label,
    required this.amount,
    this.labelStyle,
    this.amountStyle,
    this.isBold = false,
    this.amountColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: labelStyle ??
                TextStyle(
                  fontSize: 16,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  color: Colors.grey[700],
                ),
          ),
          Text(
            amount,
            style: amountStyle ??
                TextStyle(
                  fontSize: 16,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  color: amountColor ?? Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}

class InfoSection extends StatelessWidget {
  final String title;
  final String content;
  final Widget? trailing;

  const InfoSection({
    Key? key,
    required this.title,
    required this.content,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (trailing != null) trailing!,
              ],
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onPressed;
  final Color backgroundColor;
  final Color textColor;

  const ActionButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = AppColors.appBarColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderSummaryScreen extends StatefulWidget {
  final Map<String, dynamic> orderData;
  final VoidCallback? onSuccessfulBooking;

  const OrderSummaryScreen({
    Key? key,
    required this.orderData,
    this.onSuccessfulBooking,
  }) : super(key: key);

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  Address? selectedAddress;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool isBookingInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Order Summary',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Service Details Card
                    _buildServiceDetailsCard(),
                    const SizedBox(height: 16),

                    // Address Section
                    const Text(
                      'Service Address',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),

                    if (selectedAddress == null)
                      _buildAddressSelector()
                    else
                      _buildSelectedAddressCard(),

                    const SizedBox(height: 24),

                    // Date & Time Section
                    const Text(
                      'Service Date & Time',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),

                    if (selectedDate == null || selectedTime == null)
                      _buildDateTimeSelector()
                    else
                      _buildSelectedDateTimeCard(),

                    const SizedBox(height: 24),

                    // Payment Summary Section
                    _buildPaymentSummaryCard(),

                    const SizedBox(height: 24),

                    // Cancellation Policy
                    _buildCancellationPolicyCard(),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),

          // Bottom action area
          _buildBottomActionArea(),
        ],
      ),
    );
  }

  Widget _buildServiceDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Service Details',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.appBarColor,
            ),
          ),
          const SizedBox(height: 16),
          _buildServiceDetailRow('Service', widget.orderData['serviceName'] ?? 'N/A'),
          const Divider(height: 20),
          _buildServiceDetailRow('Type', widget.orderData['finalSelection'] ?? 'N/A'),
          const Divider(height: 20),
          _buildServiceDetailRow('Category', widget.orderData['serviceCategory'] ?? 'N/A'),
        ],
      ),
    );
  }

  Widget _buildServiceDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildAddressSelector() {
    return InkWell(
      onTap: _showAddressBottomSheet,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.appBarColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add_location_alt_outlined,
                color: AppColors.appBarColor,
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Text(
                'Add Service Address',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedAddressCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
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
                  color: AppColors.appBarColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  selectedAddress!.type == 'Home' ? Icons.home : Icons.apartment,
                  color: AppColors.appBarColor,
                  size: 16,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                selectedAddress!.type,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: _showAddressBottomSheet,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(60, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'Change',
                  style: TextStyle(color: AppColors.appBarColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${selectedAddress!.houseNumber}, ${selectedAddress!.landmark}',
            style: const TextStyle(fontSize: 14),
          ),
          if (selectedAddress!.fullAddress.isNotEmpty)
            Text(
              selectedAddress!.fullAddress,
              style: const TextStyle(fontSize: 14),
            ),
        ],
      ),
    );
  }

  Widget _buildDateTimeSelector() {
    return InkWell(
      onTap: _showDateTimeBottomSheet,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.appBarColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.calendar_month_outlined,
                color: AppColors.appBarColor,
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Text(
                'Select Date & Time',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedDateTimeCard() {
    final DateFormat dateFormat = DateFormat('EEEE, MMMM d, yyyy');
    final String formattedDate = dateFormat.format(selectedDate!);
    final String formattedTime = selectedTime!.format(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
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
                  color: AppColors.appBarColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.event,
                  color: AppColors.appBarColor,
                  size: 16,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Appointment',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: _showDateTimeBottomSheet,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(60, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'Change',
                  style: TextStyle(color: AppColors.appBarColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            formattedDate,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            'Time: $formattedTime',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment Summary',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.appBarColor,
            ),
          ),
          const SizedBox(height: 16),
          _buildPaymentRow('Item Total', widget.orderData['itemTotal'] ?? '₹0'),
          const SizedBox(height: 8),
          _buildPaymentRow('Convenience Fee', widget.orderData['convenienceFee'] ?? '₹0'),
          const Divider(height: 20),
          _buildPaymentRow(
            'Total Amount',
            widget.orderData['totalAmount'] ?? '₹0',
            isTotal: true,
          ),
          const Divider(height: 20),
          _buildPaymentRow(
            'Advance Payment (20%)',
            widget.orderData['advancePayment'] ?? '₹0',
            textColor: Colors.green,
          ),
          const SizedBox(height: 8),
          _buildPaymentRow(
            'Cash on Service (80%)',
            widget.orderData['cashOnService'] ?? '₹0',
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentRow(String label, String amount, {bool isTotal = false, Color? textColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: textColor ?? (isTotal ? Colors.black : Colors.grey[600]),
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: textColor ?? (isTotal ? AppColors.appBarColor : Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildCancellationPolicyCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Cancellation Policy',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.appBarColor,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            widget.orderData['cancellationPolicy'] ?? 'No cancellation policy available.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActionArea() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.security,
                  color: Colors.grey[600],
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Your payment information is secure',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _canProceed() ? _proceedToPayment : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appBarColor,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey[300],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: isBookingInProgress
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
                    : const Text(
                  'Proceed to Payment',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _canProceed() {
    return selectedAddress != null && selectedDate != null && selectedTime != null && !isBookingInProgress;
  }

  void _proceedToPayment() {
    // Set booking in progress
    setState(() {
      isBookingInProgress = true;
    });

    // Simulate API call with a delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          isBookingInProgress = false;
        });

        // Show success dialog
        _showBookingSuccessDialog();
      }
    });
  }

  void _showBookingSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 64,
            ),
            const SizedBox(height: 16),
            const Text(
              'Booking Successful!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Your service has been scheduled for ${DateFormat('EEEE, MMMM d').format(selectedDate!)} at ${selectedTime!.format(context)}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog

                  // Call success callback if provided
                  if (widget.onSuccessfulBooking != null) {
                    widget.onSuccessfulBooking!();
                  } else {
                    // Just navigate back if no callback
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appBarColor,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddressBottomSheet() {
    AddressBottomSheet.show(
      context,
      currentAddress: selectedAddress,
      onAddressSaved: (address) {
        setState(() {
          selectedAddress = address;
        });
      },
    );
  }

  void _showDateTimeBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return BookServiceBottomSheet(
          onConfirm: (date, time) {
            setState(() {
              selectedDate = date;
              selectedTime = time;
            });
          },
          initialDate: selectedDate,
          initialTime: selectedTime,
        );
      },
    );
  }
}

class BookServiceBottomSheet extends StatefulWidget {
  final Function(DateTime, TimeOfDay) onConfirm;
  final DateTime? initialDate;
  final TimeOfDay? initialTime;

  const BookServiceBottomSheet({
    Key? key,
    required this.onConfirm,
    this.initialDate,
    this.initialTime,
  }) : super(key: key);

  @override
  State<BookServiceBottomSheet> createState() => _BookServiceBottomSheetState();
}

class _BookServiceBottomSheetState extends State<BookServiceBottomSheet> {
  late DateTime _selectedDate;
  TimeOfDay? _selectedTime;
  final List<DateTime> _availableDates = [];
  final List<TimeOfDay> _availableTimes = [
    const TimeOfDay(hour: 8, minute: 0),
    const TimeOfDay(hour: 9, minute: 0),
    const TimeOfDay(hour: 10, minute: 0),
    const TimeOfDay(hour: 11, minute: 0),
    const TimeOfDay(hour: 12, minute: 0),
    const TimeOfDay(hour: 13, minute: 0),
    const TimeOfDay(hour: 14, minute: 0),
    const TimeOfDay(hour: 15, minute: 0),
    const TimeOfDay(hour: 16, minute: 0),
    const TimeOfDay(hour: 17, minute: 0),
    const TimeOfDay(hour: 18, minute: 0),
    const TimeOfDay(hour: 19, minute: 0),
  ];

  @override
  void initState() {
    super.initState();

    // Generate 5 dates starting from today
    final now = DateTime.now();
    for (int i = 0; i < 10; i++) {
      _availableDates.add(DateTime(now.year, now.month, now.day + i));
    }

    _selectedDate = widget.initialDate ?? _availableDates.first;
    _selectedTime = widget.initialTime;
  }

  String _getDayName(DateTime date) {
    final dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return dayNames[date.weekday - 1];
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const Text(
            'Select Date & Time',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          const Text(
            'Choose Your Date',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _availableDates.length,
              itemBuilder: (context, index) {
                final date = _availableDates[index];
                final isSelected = _selectedDate.day == date.day &&
                    _selectedDate.month == date.month &&
                    _selectedDate.year == date.year;

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                    child: Container(
                      width: 70,
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.appBarColor : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _getDayName(date),
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            date.day.toString(),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                          Text(
                            DateFormat('MMM').format(date),
                            style: TextStyle(
                              fontSize: 14,
                              color: isSelected ? Colors.white70 : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Select Available Time',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _availableTimes.length,
              itemBuilder: (context, index) {
                final time = _availableTimes[index];
                final isSelected = _selectedTime != null &&
                    _selectedTime!.hour == time.hour &&
                    _selectedTime!.minute == time.minute;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTime = time;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.appBarColor : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _formatTime(time),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _selectedTime != null
                  ? () => widget.onConfirm(_selectedDate, _selectedTime!)
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.appBarColor,
                disabledBackgroundColor: Colors.grey[300],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Confirm',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class BookServiceBottomSheet extends StatefulWidget {
//   final Function(DateTime, TimeOfDay) onConfirm;
//   final DateTime? initialDate;
//   final TimeOfDay? initialTime;
//
//   const BookServiceBottomSheet({
//     Key? key,
//     required this.onConfirm,
//     this.initialDate,
//     this.initialTime,
//   }) : super(key: key);
//
//   @override
//   State<BookServiceBottomSheet> createState() => _BookServiceBottomSheetState();
// }
//
// class _BookServiceBottomSheetState extends State<BookServiceBottomSheet> {
//   late DateTime _selectedDate;
//   TimeOfDay? _selectedTime;
//   final List<DateTime> _availableDates = [];
//   final List<TimeOfDay> _availableTimes = [
//     const TimeOfDay(hour: 8, minute: 0),
//     const TimeOfDay(hour: 9, minute: 0),
//     const TimeOfDay(hour: 10, minute: 0),
//     const TimeOfDay(hour: 11, minute: 0),
//     const TimeOfDay(hour: 12, minute: 0),
//     const TimeOfDay(hour: 13, minute: 0),
//     const TimeOfDay(hour: 14, minute: 0),
//     const TimeOfDay(hour: 15, minute: 0),
//     const TimeOfDay(hour: 16, minute: 0),
//     const TimeOfDay(hour: 17, minute: 0),
//     const TimeOfDay(hour: 18, minute: 0),
//     const TimeOfDay(hour: 19, minute: 0),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Generate 5 dates starting from today
//     final now = DateTime.now();
//     for (int i = 0; i < 5; i++) {
//       _availableDates.add(DateTime(now.year, now.month, now.day + i));
//     }
//
//     _selectedDate = widget.initialDate ?? _availableDates.first;
//     _selectedTime = widget.initialTime;
//   }
//
//   String _getDayName(DateTime date) {
//     final dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
//     return dayNames[date.weekday - 1];
//   }
//
//   String _formatTime(TimeOfDay time) {
//     final hour = time.hourOfPeriod;
//     final minute = time.minute.toString().padLeft(2, '0');
//     final period = time.period == DayPeriod.am ? 'AM' : 'PM';
//     return '$hour:$minute $period';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: () => Navigator.pop(context),
//               ),
//               const Text(
//                 'Book Service',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           const SizedBox(height: 24),
//           const Text(
//             'Choose Your Date',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           SizedBox(
//             height: 120,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: _availableDates.length,
//               itemBuilder: (context, index) {
//                 final date = _availableDates[index];
//                 final isSelected = _selectedDate.day == date.day &&
//                     _selectedDate.month == date.month &&
//                     _selectedDate.year == date.year;
//
//                 return Padding(
//                   padding: const EdgeInsets.only(right: 8),
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _selectedDate = date;
//                       });
//                     },
//                     child: Container(
//                       width: 80,
//                       decoration: BoxDecoration(
//                         color:
//                         isSelected ? AppColors.appBarColor : Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(color: Colors.grey.shade300),
//                       ),
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             _getDayName(date),
//                             style: TextStyle(
//                               color: isSelected ? Colors.white : Colors.black,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             date.day.toString(),
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: isSelected ? Colors.white : Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 24),
//           const Text(
//             'Select Available Time',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 childAspectRatio: 2.5,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//               ),
//               itemCount: _availableTimes.length,
//               itemBuilder: (context, index) {
//                 final time = _availableTimes[index];
//                 final isSelected = _selectedTime != null &&
//                     _selectedTime!.hour == time.hour &&
//                     _selectedTime!.minute == time.minute;
//
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _selectedTime = time;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: isSelected ? AppColors.appBarColor : Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(color: Colors.grey.shade300),
//                     ),
//                     alignment: Alignment.center,
//                     child: Text(
//                       _formatTime(time),
//                       style: TextStyle(
//                         color: isSelected ? Colors.white : Colors.black,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 16),
//           SizedBox(
//             width: double.infinity,
//             height: 50,
//             child: ElevatedButton(
//               onPressed: _selectedTime != null
//                   ? () => widget.onConfirm(_selectedDate, _selectedTime!)
//                   : null,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.appBarColor,
//                 disabledBackgroundColor: Colors.grey,
//                 foregroundColor: Colors.white,
//               ),
//               child: const Text('Confirm Booking'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }