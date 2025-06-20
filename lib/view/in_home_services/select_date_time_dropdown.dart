// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// // class OrderSummaryScreen extends StatefulWidget {
// //   const OrderSummaryScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
// // }
// //
// // class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
// //   Address? selectedAddress;
// //   DateTime? selectedDate;
// //   TimeOfDay? selectedTime;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Order Summary'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const Text(
// //               'Order Summary',
// //               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 20),
// //
// //             // Order details would go here
// //             const OrderDetailCard(
// //               serviceName: 'Deep Cleaning',
// //               price: '\$99.99',
// //               duration: '2 hours',
// //             ),
// //             const SizedBox(height: 20),
// //
// //             // Address section
// //             if (selectedAddress != null) ...[
// //               const Text(
// //                 'Delivery Address',
// //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //               ),
// //               const SizedBox(height: 10),
// //               AddressCard(
// //                 address: selectedAddress!,
// //                 onEditPressed: () {
// //                   _showAddressBottomSheet(context);
// //                 },
// //               ),
// //               const SizedBox(height: 20),
// //             ],
// //
// //             // Date & Time section
// //             if (selectedAddress != null && selectedDate != null && selectedTime != null) ...[
// //               const Text(
// //                 'Appointment Details',
// //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //               ),
// //               const SizedBox(height: 10),
// //               AppointmentDetailCard(
// //                 date: selectedDate!,
// //                 time: selectedTime!,
// //                 onEditPressed: () {
// //                   _showDateTimeBottomSheet(context);
// //                 },
// //               ),
// //               const SizedBox(height: 20),
// //             ],
// //
// //             const Spacer(),
// //
// //             // Bottom buttons
// //             if (selectedAddress == null)
// //               PrimaryButton(
// //                 label: 'Select Address',
// //                 onPressed: () {
// //                   _showAddressBottomSheet(context);
// //                 },
// //               )
// //             else if (selectedDate == null || selectedTime == null)
// //               PrimaryButton(
// //                 label: 'Select Date & Time',
// //                 onPressed: () {
// //                   _showDateTimeBottomSheet(context);
// //                 },
// //               )
// //             else
// //               PrimaryButton(
// //                 label: 'Proceed to Payment',
// //                 onPressed: () {
// //                   // Navigate to payment screen
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     const SnackBar(content: Text('Proceeding to payment...')),
// //                   );
// //                 },
// //               ),
// //
// //             if (selectedAddress != null)
// //               Padding(
// //                 padding: const EdgeInsets.only(top: 10),
// //                 child: OutlinedButton(
// //                   onPressed: () {
// //                     _showAddressBottomSheet(context);
// //                   },
// //                   style: OutlinedButton.styleFrom(
// //                     minimumSize: const Size(double.infinity, 50),
// //                   ),
// //                   child: const Text('Add New Address'),
// //                 ),
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   void _showAddressBottomSheet(BuildContext context) {
// //     showModalBottomSheet(
// //       context: context,
// //       isScrollControlled: true,
// //       backgroundColor: Colors.white,
// //       shape: const RoundedRectangleBorder(
// //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// //       ),
// //       builder: (context) {
// //         return Padding(
// //           padding: EdgeInsets.only(
// //             bottom: MediaQuery.of(context).viewInsets.bottom,
// //           ),
// //           child: AddressBottomSheet(
// //             onAddressSaved: (address) {
// //               setState(() {
// //                 selectedAddress = address;
// //               });
// //               Navigator.pop(context);
// //             },
// //             initialAddress: selectedAddress,
// //           ),
// //         );
// //       },
// //     );
// //   }
// //
// //   void _showDateTimeBottomSheet(BuildContext context) {
// //     showModalBottomSheet(
// //       context: context,
// //       isScrollControlled: true,
// //       backgroundColor: Colors.white,
// //       shape: const RoundedRectangleBorder(
// //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// //       ),
// //       builder: (context) {
// //         return BookServiceBottomSheet(
// //           onConfirm: (date, time) {
// //             setState(() {
// //               selectedDate = date;
// //               selectedTime = time;
// //             });
// //             Navigator.pop(context);
// //           },
// //           initialDate: selectedDate,
// //           initialTime: selectedTime,
// //         );
// //       },
// //     );
// //   }
// // }
//
// // class OrderDetailCard extends StatelessWidget {
// //   final String serviceName;
// //   final String price;
// //   final String duration;
// //
// //   const OrderDetailCard({
// //     Key? key,
// //     required this.serviceName,
// //     required this.price,
// //     required this.duration,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 2,
// //       child: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(
// //               serviceName,
// //               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 8),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Text('Price: $price'),
// //                 Text('Duration: $duration'),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// class Address {
//   final String name;
//   final String streetAddress;
//   final String city;
//   final String state;
//   final String zipCode;
//   final String phoneNumber;
//
//   Address({
//     required this.name,
//     required this.streetAddress,
//     required this.city,
//     required this.state,
//     required this.zipCode,
//     required this.phoneNumber,
//   });
// }
// //
// // class AddressCard extends StatelessWidget {
// //   final Address address;
// //   final VoidCallback onEditPressed;
// //
// //   const AddressCard({
// //     Key? key,
// //     required this.address,
// //     required this.onEditPressed,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 2,
// //       child: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Text(
// //                   address.name,
// //                   style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //                 ),
// //                 IconButton(
// //                   icon: const Icon(Icons.edit, color: Colors.red),
// //                   onPressed: onEditPressed,
// //                   constraints: const BoxConstraints(),
// //                   padding: EdgeInsets.zero,
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 8),
// //             Text(address.streetAddress),
// //             Text('${address.city}, ${address.state} ${address.zipCode}'),
// //             const SizedBox(height: 8),
// //             Text('Phone: ${address.phoneNumber}'),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// class AppointmentDetailCard extends StatelessWidget {
//   final DateTime date;
//   final TimeOfDay time;
//   final VoidCallback onEditPressed;
//
//   const AppointmentDetailCard({
//     Key? key,
//     required this.date,
//     required this.time,
//     required this.onEditPressed,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final dateFormat = DateFormat('EEEE, MMMM d, yyyy');
//     final formattedDate = dateFormat.format(date);
//     final formattedTime = '${time.hourOfPeriod}:${time.minute.toString().padLeft(2, '0')} ${time.period == DayPeriod.am ? 'AM' : 'PM'}';
//
//     return Card(
//       elevation: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Appointment',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.edit, color: Colors.red),
//                   onPressed: onEditPressed,
//                   constraints: const BoxConstraints(),
//                   padding: EdgeInsets.zero,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Text('Date: $formattedDate'),
//             Text('Time: $formattedTime'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class PrimaryButton extends StatelessWidget {
//   final String label;
//   final VoidCallback onPressed;
//
//   const PrimaryButton({
//     Key? key,
//     required this.label,
//     required this.onPressed,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 50,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Theme.of(context).primaryColor,
//           foregroundColor: Colors.white,
//         ),
//         child: Text(label),
//       ),
//     );
//   }
// }
// //
// // class AddressBottomSheet extends StatefulWidget {
// //   final Function(Address) onAddressSaved;
// //   final Address? initialAddress;
// //
// //   const AddressBottomSheet({
// //     Key? key,
// //     required this.onAddressSaved,
// //     this.initialAddress,
// //   }) : super(key: key);
// //
// //   @override
// //   State<AddressBottomSheet> createState() => _AddressBottomSheetState();
// // }
// //
// // class _AddressBottomSheetState extends State<AddressBottomSheet> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _nameController = TextEditingController();
// //   final _streetController = TextEditingController();
// //   final _cityController = TextEditingController();
// //   final _stateController = TextEditingController();
// //   final _zipController = TextEditingController();
// //   final _phoneController = TextEditingController();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     if (widget.initialAddress != null) {
// //       _nameController.text = widget.initialAddress!.name;
// //       _streetController.text = widget.initialAddress!.streetAddress;
// //       _cityController.text = widget.initialAddress!.city;
// //       _stateController.text = widget.initialAddress!.state;
// //       _zipController.text = widget.initialAddress!.zipCode;
// //       _phoneController.text = widget.initialAddress!.phoneNumber;
// //     }
// //   }
// //
// //   @override
// //   void dispose() {
// //     _nameController.dispose();
// //     _streetController.dispose();
// //     _cityController.dispose();
// //     _stateController.dispose();
// //     _zipController.dispose();
// //     _phoneController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return DraggableScrollableSheet(
// //       initialChildSize: 0.9,
// //       minChildSize: 0.5,
// //       maxChildSize: 0.95,
// //       expand: false,
// //       builder: (context, scrollController) {
// //         return SingleChildScrollView(
// //           controller: scrollController,
// //           child: Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     IconButton(
// //                       icon: const Icon(Icons.close),
// //                       onPressed: () => Navigator.pop(context),
// //                     ),
// //                     const Text(
// //                       'Add Address',
// //                       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //                     ),
// //                     const SizedBox(width: 48),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 16),
// //                 Form(
// //                   key: _formKey,
// //                   child: Column(
// //                     children: [
// //                       TextFormField(
// //                         controller: _nameController,
// //                         decoration: const InputDecoration(
// //                           labelText: 'Full Name',
// //                           border: OutlineInputBorder(),
// //                         ),
// //                         validator: (value) {
// //                           if (value == null || value.isEmpty) {
// //                             return 'Please enter your name';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                       const SizedBox(height: 16),
// //                       TextFormField(
// //                         controller: _streetController,
// //                         decoration: const InputDecoration(
// //                           labelText: 'Street Address',
// //                           border: OutlineInputBorder(),
// //                         ),
// //                         validator: (value) {
// //                           if (value == null || value.isEmpty) {
// //                             return 'Please enter your street address';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                       const SizedBox(height: 16),
// //                       TextFormField(
// //                         controller: _cityController,
// //                         decoration: const InputDecoration(
// //                           labelText: 'City',
// //                           border: OutlineInputBorder(),
// //                         ),
// //                         validator: (value) {
// //                           if (value == null || value.isEmpty) {
// //                             return 'Please enter your city';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                       const SizedBox(height: 16),
// //                       Row(
// //                         children: [
// //                           Expanded(
// //                             child: TextFormField(
// //                               controller: _stateController,
// //                               decoration: const InputDecoration(
// //                                 labelText: 'State',
// //                                 border: OutlineInputBorder(),
// //                               ),
// //                               validator: (value) {
// //                                 if (value == null || value.isEmpty) {
// //                                   return 'Please enter your state';
// //                                 }
// //                                 return null;
// //                               },
// //                             ),
// //                           ),
// //                           const SizedBox(width: 16),
// //                           Expanded(
// //                             child: TextFormField(
// //                               controller: _zipController,
// //                               decoration: const InputDecoration(
// //                                 labelText: 'ZIP Code',
// //                                 border: OutlineInputBorder(),
// //                               ),
// //                               keyboardType: TextInputType.number,
// //                               validator: (value) {
// //                                 if (value == null || value.isEmpty) {
// //                                   return 'Please enter your ZIP code';
// //                                 }
// //                                 return null;
// //                               },
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       const SizedBox(height: 16),
// //                       TextFormField(
// //                         controller: _phoneController,
// //                         decoration: const InputDecoration(
// //                           labelText: 'Phone Number',
// //                           border: OutlineInputBorder(),
// //                         ),
// //                         keyboardType: TextInputType.phone,
// //                         validator: (value) {
// //                           if (value == null || value.isEmpty) {
// //                             return 'Please enter your phone number';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                       const SizedBox(height: 24),
// //                       PrimaryButton(
// //                         label: 'Save Address',
// //                         onPressed: () {
// //                           if (_formKey.currentState!.validate()) {
// //                             final address = Address(
// //                               name: _nameController.text,
// //                               streetAddress: _streetController.text,
// //                               city: _cityController.text,
// //                               state: _stateController.text,
// //                               zipCode: _zipController.text,
// //                               phoneNumber: _phoneController.text,
// //                             );
// //                             widget.onAddressSaved(address);
// //                           }
// //                         },
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
//
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
//                         color: isSelected ? Theme.of(context).primaryColor : Colors.white,
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
//                       color: isSelected ? Theme.of(context).primaryColor : Colors.white,
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
//                 backgroundColor: Theme.of(context).primaryColor,
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