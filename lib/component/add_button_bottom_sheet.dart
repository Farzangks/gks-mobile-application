import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;
import 'package:ghar_ka_sathi/view/in_home_services/service_form_componet.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:itq_utils/itq_utils.dart';

var serviceType = ['Replacement', 'Installation', 'Repair'];

class Addbuttonbottomsheet extends StatefulWidget {
  const Addbuttonbottomsheet({super.key});

  @override
  State<Addbuttonbottomsheet> createState() => _AddbuttonbottomsheetState();
}

class _AddbuttonbottomsheetState extends State<Addbuttonbottomsheet> {
  String? _selectedSize; //
  String? _selectedType; //
  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.screenHeight(),
        decoration: boxDecorationWithRoundedCorners(
          border: const Border.symmetric(
              horizontal: BorderSide(
            color: AppColors.onBoardingBgColors,
            width: 3,
          )),
          backgroundColor: context.cardColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Cleaning Type',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              for (var size in ['Basic Cleaning', 'Deep Cleaning'])
                RadioListTile<String>(
                  activeColor: AppColors.appBarColor,
                  title: Text(size),
                  value: size,
                  groupValue: _selectedType,
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value; // Update the selected size
                    });
                  },
                ),
              const Text(
                'What is the house size?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              for (var size in ['1 BHK', '2 BHK', '3 BHK', '4 BHK', '5 BHK'])
                RadioListTile<String>(
                  activeColor: AppColors.appBarColor,
                  title: Text(size),
                  value: size,
                  groupValue: _selectedSize,
                  onChanged: (value) {
                    setState(() {
                      _selectedSize = value; // Update the selected size
                    });
                  },
                ),
              const Text(
                'Cost:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: _selectedSize != null || _selectedType != null
                      ? () {
                          // Handle Add button press
                          print('Selected size: $_selectedSize');
                        }
                      : null, // Disable button if no option is selected
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedSize != null
                        ? AppColors.appBarColor // Active state color
                        : Colors.grey.shade400, // Disabled state color
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class CarpentryBottomSheet extends StatefulWidget {
  const CarpentryBottomSheet({super.key});

  @override
  State<CarpentryBottomSheet> createState() => _CarpentryBottomSheetState();
}

class _CarpentryBottomSheetState extends State<CarpentryBottomSheet> {
  String? _selectedSize; //
  String? _selectedType; //
  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.screenHeight(),
        decoration: boxDecorationWithRoundedCorners(
          border: const Border.symmetric(
              horizontal: BorderSide(
            color: AppColors.onBoardingBgColors,
            width: 3,
          )),
          backgroundColor: context.cardColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Type',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              for (var size in ['Replacement', 'Installation', 'Repair'])
                RadioListTile<String>(
                  activeColor: AppColors.appBarColor,
                  title: Text(size),
                  value: size,
                  groupValue: _selectedType,
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value; // Update the selected size
                    });
                  },
                ),
              const Text(
                'Select Project Type',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              for (var size in [
                'Residential',
                'Commercial',
              ])
                RadioListTile<String>(
                  activeColor: AppColors.appBarColor,
                  title: Text(size),
                  value: size,
                  groupValue: _selectedSize,
                  onChanged: (value) {
                    setState(() {
                      _selectedSize = value; // Update the selected size
                    });
                  },
                ),
              const Text(
                'Cost:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: _selectedSize != null || _selectedType != null
                      ? () {
                          // Handle Add button press

                    Get.to(ServiceFormComponet());

                          print('Selected size: $_selectedSize');
                        }
                      : null, // Disable button if no option is selected
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedSize != null
                        ? AppColors.appBarColor // Active state color
                        : Colors.grey.shade400, // Disabled state color
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class ElectronicAppliancesBottomSheet extends StatefulWidget {
  const ElectronicAppliancesBottomSheet({super.key});

  @override
  State<ElectronicAppliancesBottomSheet> createState() =>
      _ElectronicAppliancesBottomSheetState();
}

class _ElectronicAppliancesBottomSheetState
    extends State<ElectronicAppliancesBottomSheet> {
  // String? _selectedSize; //
  String? _selectedType; //
  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.screenHeight(),
        decoration: boxDecorationWithRoundedCorners(
          border: const Border.symmetric(
              horizontal: BorderSide(
            color: AppColors.onBoardingBgColors,
            width: 3,
          )),
          backgroundColor: context.cardColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Type',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              for (var size in [
                'Repair',
                'Installation',
                'Maintenance',
                'Cleaning'
              ])
                RadioListTile<String>(
                  activeColor: AppColors.appBarColor,
                  title: Text(size),
                  value: size,
                  groupValue: _selectedType,
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value; // Update the selected size
                    });
                  },
                ),

              // const Text(
              //   'Select Project Type',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              // const SizedBox(height: 20),
              // for (var size in ['Residential', 'Commercial',])
              //   RadioListTile<String>(activeColor:AppColors.appBarColor ,
              //     title: Text(size),
              //     value: size,
              //     groupValue: _selectedType,
              //     onChanged: (value) {
              //       setState(() {
              //         _selectedType = value; // Update the selected size
              //       });
              //     },
              //   ),
              // const Text(
              //   'Cost:',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: _selectedType != null
                      ? () {
                          // Handle Add button press
                          print('Selected size: $_selectedType');
                        }
                      : null, // Disable button if no option is selected
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedType != null
                        ? AppColors.appBarColor // Active state color
                        : Colors.grey.shade400, // Disabled state color
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class PestControlBottomSheet extends StatefulWidget {
  const PestControlBottomSheet({super.key});

  @override
  State<PestControlBottomSheet> createState() => _PestControlBottomSheetState();
}

class _PestControlBottomSheetState extends State<PestControlBottomSheet> {
  // String? _selectedSize; //
  String? _selectedType; //
  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.screenHeight(),
        decoration: boxDecorationWithRoundedCorners(
          border: const Border.symmetric(
              horizontal: BorderSide(
            color: AppColors.onBoardingBgColors,
            width: 3,
          )),
          backgroundColor: context.cardColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Type',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              for (var size in ['Utensil Removal', 'No Utensil Removal'])
                RadioListTile<String>(
                  activeColor: AppColors.appBarColor,
                  title: Text(size),
                  value: size,
                  groupValue: _selectedType,
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value; // Update the selected size
                    });
                  },
                ),

              // const Text(
              //   'What is the house size?',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              // const SizedBox(height: 20),
              // for (var size in ['1 BHK', '2 BHK', '3 BHK', '4 BHK', '5 BHK'])
              //   RadioListTile<String>(activeColor:AppColors.appBarColor ,
              //     title: Text(size),
              //     value: size,
              //     groupValue: _selectedSize,
              //     onChanged: (value) {
              //       setState(() {
              //         _selectedSize = value; // Update the selected size
              //       });
              //     },
              //   ),
              // const Text(
              //   'Cost:',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: _selectedType != null
                      ? () {
                          // Handle Add button press
                          print('Selected size: $_selectedType');
                        }
                      : null, // Disable button if no option is selected
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedType != null
                        ? AppColors.appBarColor // Active state color
                        : Colors.grey.shade400, // Disabled state color
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class PlumbingBottomSheet extends StatefulWidget {
  const PlumbingBottomSheet({super.key});

  @override
  State<PlumbingBottomSheet> createState() => _PlumbingBottomSheetState();
}

class _PlumbingBottomSheetState extends State<PlumbingBottomSheet> {
  // String? _selectedSize; //
  String? _selectedType; //
  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.screenHeight(),
        decoration: boxDecorationWithRoundedCorners(
          border: const Border.symmetric(
              horizontal: BorderSide(
            color: AppColors.onBoardingBgColors,
            width: 3,
          )),
          backgroundColor: context.cardColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Type',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              for (var size in ['Repair', 'Replace', 'Install'])
                RadioListTile<String>(
                  activeColor: AppColors.appBarColor,
                  title: Text(size),
                  value: size,
                  groupValue: _selectedType,
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value; // Update the selected size
                    });
                  },
                ),

              // const Text(
              //   'What is the house size?',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              // const SizedBox(height: 20),
              // for (var size in ['1 BHK', '2 BHK', '3 BHK', '4 BHK', '5 BHK'])
              //   RadioListTile<String>(activeColor:AppColors.appBarColor ,
              //     title: Text(size),
              //     value: size,
              //     groupValue: _selectedSize,
              //     onChanged: (value) {
              //       setState(() {
              //         _selectedSize = value; // Update the selected size
              //       });
              //     },
              //   ),
              // const Text(
              //   'Cost:',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: _selectedType != null
                      ? () {
                          // Handle Add button press
                          print('Selected size: $_selectedType');
                        }
                      : null, // Disable button if no option is selected
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedType != null
                        ? AppColors.appBarColor // Active state color
                        : Colors.grey.shade400, // Disabled state color
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class PackersMoversBottomSheet extends StatefulWidget {
  const PackersMoversBottomSheet({super.key});

  @override
  State<PackersMoversBottomSheet> createState() =>
      _PackersMoversBottomSheetState();
}

class _PackersMoversBottomSheetState extends State<PackersMoversBottomSheet> {
  String? _selectedSize; //
  String? _selectedType; //
  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.screenHeight(),
        decoration: boxDecorationWithRoundedCorners(
          border: const Border.symmetric(
              horizontal: BorderSide(
            color: AppColors.onBoardingBgColors,
            width: 3,
          )),
          backgroundColor: context.cardColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Moving Type',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              for (var size in ['Local Moving', 'Interstate Moving'])
                RadioListTile<String>(
                  activeColor: AppColors.appBarColor,
                  title: Text(size),
                  value: size,
                  groupValue: _selectedType,
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value; // Update the selected size
                    });
                  },
                ),
              const Text(
                'What is the house size?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              for (var size in ['1 BHK', '2 BHK', '3 BHK', '4 BHK', '5 BHK'])
                RadioListTile<String>(
                  activeColor: AppColors.appBarColor,
                  title: Text(size),
                  value: size,
                  groupValue: _selectedSize,
                  onChanged: (value) {
                    setState(() {
                      _selectedSize = value; // Update the selected size
                    });
                  },
                ),
              const Text(
                'Cost:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: _selectedSize != null || _selectedType != null
                      ? () {
                          // Handle Add button press
                          print('Selected size: $_selectedSize');
                        }
                      : null, // Disable button if no option is selected
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedSize != null
                        ? AppColors.appBarColor // Active state color
                        : Colors.grey.shade400, // Disabled state color
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
