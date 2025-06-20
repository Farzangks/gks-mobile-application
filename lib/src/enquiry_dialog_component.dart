import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/controller/enquiry_controller.dart';
import 'package:ghar_ka_sathi/model/rent_property_model.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/constant.dart';
import 'package:itq_utils/itq_utils.dart';

class EnquiryDialogComponent extends StatefulWidget {
  final PropertyRentResource? allPropertyList;
  const EnquiryDialogComponent({super.key, this.allPropertyList});

  @override
  State<EnquiryDialogComponent> createState() => _EnquiryDialogComponentState();
}

class _EnquiryDialogComponentState extends State<EnquiryDialogComponent> {
  final email = TextEditingController();

  final mobile = TextEditingController();
  final name = TextEditingController();

  final controller = Get.put(EnquiryController());
  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Optional padding
        child: Column(
          mainAxisSize: MainAxisSize.min, // Let the column adjust to content
          children: [
            Text(
              "Enquire about ${widget.allPropertyList!.name}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.appBarColor,
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
              keyboardType: TextInputType.phone,
              controller: mobile,
              decoration: InputDecoration(
                labelText: "Mobile Number",
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
            ElevatedButton(
              onPressed: () async {
                if (name.text.isEmpty) {
                  toast('Name can"t be empty');
                } else if (email.text.isEmpty) {
                  toast('Mobile no. can"t be empty');
                } else if (mobile.text.isEmpty) {
                  toast('Email can"t be empty');
                } else {
                  // Perform your enquiry action
                  controller.userEnquiry(
                      context,
                      name.text,
                      getStringAsync(userId),
                      mobile.text,
                      email.text,
                      widget.allPropertyList!.id);

                  // print(name.text);
                  // print(getStringAsync(userId));
                  // print(mobile.text);
                  // print(email.text);
                  // print(widget.allPropertyList!.id);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Submit Enquiry",
                style: TextStyle(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
