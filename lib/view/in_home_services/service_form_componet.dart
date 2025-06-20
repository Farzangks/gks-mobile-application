import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/controller/property_service_controller.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:itq_utils/itq_utils.dart';

class ServiceFormComponet extends StatefulWidget {
  static String tag = '/ElectricianDetailsScreen';
  final String? serviceType;
  final String? serviceTypeList;
  final String? projectTypes;
  final String? serviceCategoryItem;
  const  ServiceFormComponet(
      {super.key,
      this.serviceType,
      this.serviceTypeList,
      this.projectTypes,
      this.serviceCategoryItem});

  @override
  State<ServiceFormComponet> createState() => _ServiceFormComponettState();
}

class _ServiceFormComponettState extends State<ServiceFormComponet> {
  TextEditingController serviceCategoryText = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController mobile = TextEditingController();
  final controller = Get.put(PropertyServiceController());

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    serviceCategoryText.text =
    "${widget.serviceType.toString()}:${widget.serviceCategoryItem
        .toString()}${widget.serviceType != null ? "(${widget.serviceType
        .toString()})" : ""}${widget.projectTypes != null ? "(${widget
        .projectTypes.toString()})" : ""}";
  }

  // Function to pick a date
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        date.text =
        '${_selectedDate!.day.toString().padLeft(2, '0')}-${_selectedDate!.month
            .toString().padLeft(2, '0')}-${_selectedDate!.year}';
      });
    }
  }

// Function to pick a time
  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
        time.text = formatTimeOfDay(_selectedTime!);
      });
    }
  }

// Function to format TimeOfDay to HH:mm
  String formatTimeOfDay(TimeOfDay time) {
    final localizations = MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(time, alwaysUse24HourFormat: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          widget.serviceType.toString(),
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.appBarColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Optional padding
          child: Column(
            mainAxisSize: MainAxisSize.min, // Let the column adjust to content
            children: [
              Text(
                "Book Your ${widget.serviceType.toString()}:${widget
                    .serviceCategoryItem.toString()}${widget.serviceType != null
                    ? "(${widget.serviceType.toString()})"
                    : ""}${widget.projectTypes != null ? "(${widget.projectTypes
                    .toString()})" : ""}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.appBarColor,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text,
                controller: serviceCategoryText,
                decoration: InputDecoration(
                  labelText: "Service Type",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text,
                controller: name,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text,
                controller: email,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text,
                controller: address,
                decoration: InputDecoration(
                  labelText: "Address",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                readOnly: true,
                controller: date,
                decoration: InputDecoration(
                  hintText: 'dd-mm-yyyy',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _pickDate(context),
                  ),
                  labelText: "Date",
                  border: OutlineInputBorder(),
                ),
                onTap: () => _pickDate(context),
              ),
              const SizedBox(height: 20),
              TextField(
                readOnly: true,
                controller: time,
                decoration: InputDecoration(
                  hintText: '-- : --',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () => _pickTime(context),
                  ),
                  labelText: "Time",
                  border: OutlineInputBorder(),
                ),
                onTap: () => _pickTime(context),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone,
                controller: mobile,
                decoration: InputDecoration(
                  labelText: "Mobile Number",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (name.text.isEmpty) {
                        toast('Name can\'t be empty');
                      } else if (email.text.isEmpty) {
                        toast('Email can\'t be empty');
                      } else if (mobile.text.isEmpty) {
                        toast('Mobile no. can\'t be empty');
                      } else {
                        // controller.propertyServices(
                        //   context,
                        //   name.text,
                        //   email.text,
                        //   mobile.text,
                        //   serviceCategoryText.text,
                        //   address.text,
                        //   _selectedDate?.toIso8601String() ?? '',
                        //   _selectedTime != null
                        //       ? formatTimeOfDay(_selectedTime!)
                        //       : '',
                        // );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(150, 50),
                    ),
                    child: const Text(
                      "Book Now",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(150, 50),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}