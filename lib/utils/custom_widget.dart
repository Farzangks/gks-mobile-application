import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/constant.dart';
import 'package:itq_utils/itq_utils.dart';

class GroceryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GroceryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green[100], // Use a light green background
      automaticallyImplyLeading: false,  // Remove the default back button
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Top Row: Logo and Delivery Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Image.asset('assets/images/logo.png', height: 40), // Replace with your logo
                  ),
                  const Text(
                    'supersaver',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.delivery_dining, color: Colors.green),
                  Text(
                    ' Delivers in 2 hrs',
                    style: TextStyle(color: Colors.green),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Icon(Icons.account_circle, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Middle Row: Location Selector
          const Row(
            children: [
              Icon(Icons.location_pin, color: Colors.green),
              Text(
                'Selected Location - Raipur, 492001',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_drop_down, color: Colors.black),
            ],
          ),
          const SizedBox(height: 8),

          // Bottom Row: Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search "cheese"',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(130.0);
}

class GroceryHomeScreen extends StatelessWidget {
  const GroceryHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.green[100],
            expandedHeight: 130.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Top Row: Logo and Delivery Time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Image.asset('assets/images/logo.png', height: 40), // Replace with your logo
                          ),
                          const Text(
                            'supersaver',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(Icons.delivery_dining, color: Colors.green),
                          Text(
                            ' Delivers in 2 hrs',
                            style: TextStyle(color: Colors.green),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Icon(Icons.account_circle, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Middle Row: Location Selector
                  const Row(
                    children: [
                      Icon(Icons.location_pin, color: Colors.green),
                      Text(
                        'Selected Location - Raipur, 492001',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.black),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search "cheese"',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item #$index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Your main content here')),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Pay using ",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_up,
                            size: 18,
                            color: Colors.green,
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Text(
                        "UPI",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Text(
                      "₹260",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Place Order",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
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

class CustomDrawerScreen extends StatelessWidget {
  const CustomDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Custom static drawer
          Container(
            width: 250, // Set the width of the drawer
            color: Colors.blueGrey,
            child: Column(
              children: [
                const DrawerHeader(
                  child: Text('Header', style: TextStyle(color: Colors.white)),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.white),
                  title: const Text('Home', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Handle your drawer item tap
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.white),
                  title: const Text('Settings', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Handle your drawer item tap
                  },
                ),
                // Add more ListTile widgets for other drawer items
              ],
            ),
          ),

          // Main content
          Expanded(
            child: Container(
              color: Colors.white,
              child: const Center(
                child: Text('Main Content Area'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DeliveryLocationWidget extends StatelessWidget {
  const DeliveryLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 40,width: 40,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(
                  Icons.location_on,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 8.0),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivering to home',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'budhapara, raipur (C.G.)',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              // Add your onPressed function here
              // showModalBottomSheet(
              //     isScrollControlled: true,
              //     context: context,
              //     backgroundColor: Colors.transparent,
              //     builder: (context) => DraggableScrollableSheet(
              //       initialChildSize: 0.6,
              //       maxChildSize: 1.0,
              //       minChildSize: 0.3,
              //       builder: (context, scrollController) =>  const AddressSelectionScreen(),
              //     ));
            },
            child: const Text(
              'Change',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,fontSize: 16
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class SearchField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hintText;
  final Widget prefixIcon;
  final Function(dynamic controller, String value)? filterFunction;
  final VoidCallback? onClear;
  final dynamic controller;

  const SearchField({
    Key? key,
    required this.controller,
    this.textEditingController,
    this.hintText = 'Search',
    this.prefixIcon = const Icon(Icons.search_outlined, color: AppColors.searchBarHintColor),
    this.filterFunction,
    this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextField(
            onChanged: (value) {
              filterFunction?.call(controller, value);
            },
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon,hintStyle: const TextStyle(color:AppColors.searchBarHintColor, ),
              filled: true,
              fillColor: AppColors.searchBarColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            // suffix: InkWell(
            //   onTap: onClear,
            //   child: const Padding(
            //     padding: EdgeInsets.only(top: 6.0, bottom: 6, right: 6),
            //     child: Icon(
            //       Icons.clear,
            //       color: AppColors.primaryColor,
            //     ),
            //   ),
            // ),
            textFieldType: TextFieldType.OTHER,
            keyboardType: TextInputType.text,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}

class ApplyCouponButton extends StatelessWidget {
  const ApplyCouponButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFEAFAEB), // Light green background color
        borderRadius: BorderRadius.circular(16.0), // Rounded corners
      ),
      child: ListTile(
        leading: const Icon(
          Icons.local_offer_outlined, // Coupon icon
          color: Colors.green, // Icon color
        ),
        title: const Text(
          'APPLY COUPON',
          style: TextStyle(
            color: Colors.green, // Text color
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.green, // Arrow icon color
        ),
        onTap: () {
          // Define your onTap functionality here
        },
      ),
    );
  }
}

class HcAppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? textColor;
  final Widget? icon;
  final IconData? iconData;
  final Color buttonColor;
  final TextStyle? textStyle;
  final BorderRadius? radius;
  final EdgeInsets? padding;

  const HcAppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.icon,
    this.iconData,
    this.buttonColor = const Color(0xffE5E6EB),
    this.textStyle,
    this.radius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        padding: padding?? const EdgeInsets.symmetric(horizontal: 6,vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: radius ??BorderRadius.circular(10),
        ),
        elevation: 0, // Remove button shadow
      ),
      child: Container(
        alignment: Alignment.center,
        child: icon == null && iconData == null
            ? textWidget
            : Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textWidget,
            const SizedBox(
              width: 10,
            ),
            if (icon != null)
              icon!
            else if (iconData != null)
              Icon(
                iconData,
                color: const Color(0xFF1B7DBE),
                size: 15,
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget get textWidget => Text(
    text,
    maxLines: 1,
    style: textStyle ??
        const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.blue,
        ),
  );
}




class CustomDotIndicator extends StatelessWidget {
  final PageController controller;
  final int itemCount;
  final int currentPage;

  const CustomDotIndicator({super.key, required this.controller, required this.itemCount, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(itemCount, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentPage == index ? 30 : 10,
          height: 8,
          decoration: BoxDecoration(
            color: currentPage == index ? AppColors.onBoardingBgColors : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

InputDecoration inputDecoration(
    {IconData? prefixIcon,
      String? hint,
      Color? bgColor,
      Color? borderColor,
      TextStyle? hintStyle,
      double maxHeight = double.infinity,
      EdgeInsets? padding}) {
  return InputDecoration(
    constraints: BoxConstraints(maxHeight: maxHeight),
    contentPadding:
    padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    counter: const Offstage(),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor ?? AppColors.onBoardingBgColors)),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: AppColors.onBoardingBgColors),
    ),
    fillColor: bgColor ?? AppColors.onBoardingBgColors.withOpacity(0.04),
    hintText: hint,
    prefixIcon: prefixIcon != null
        ? Icon(prefixIcon, color: AppColors.black)
        : null,
    hintStyle:
    hintStyle ?? secondaryTextStyle(),
    filled: true,
  );
}


class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}


class CustomHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final double padding;
  final double radius;

  const CustomHeader({
    Key? key,
    required this.title,
    required this.subtitle,
    this.padding = 16.0,
    this.radius = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.appBarColor, AppColors.red],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(radius),
          bottomRight: Radius.circular(radius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: appBarHeading, // Adjust to `appBarHeading` dynamically if needed
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white70, fontSize: contentSize), // Use `contentSize` if global
            ),
          ],
        ),
      ),
    );
  }
}


class CustomInputField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomInputField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        prefixIcon: Icon(prefixIcon, color: AppColors.appBarColor),
      ),
      validator: validator,
      controller: controller,
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final Function(String?) onChanged;

  const CustomDropdown({
    Key? key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        prefixIcon: const Icon(Icons.location_city, color: AppColors.appBarColor),
      ),
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: onChanged,
    );
  }
}



class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(
        label,
        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.appBarColor,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}


class CustomList extends StatelessWidget {
  final List<Map<String, String>> items;

  const CustomList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            leading: const Icon(Icons.verified, color: AppColors.appBarColor, size: 24.0),
            title: Text(
              items[index]['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            subtitle: items[index]['description'] != null
                ? Text(items[index]['description']!)
                : null,
          ),
        );
      },
    );
  }
}

// Add your custom constants here if necessary

class SectionHeader extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;

  const SectionHeader({
    Key? key,
    required this.title,
    this.fontSize = contentTitleSize,
    this.color = AppColors.appBarColor,
    this.fontWeight = FontWeight.bold,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}



class ServiceList extends StatelessWidget {
  final List<Map<String, String>> items;
  final IconData leadingIcon;
  final Color iconColor;
  final double iconSize;
  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  const ServiceList({
    Key? key,
    required this.items,
    this.leadingIcon = Icons.verified,
    this.iconColor = AppColors.appBarColor,
    this.iconSize = contentIconSize,
    this.titleTextStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: contentTitleSize),
    this.subtitleTextStyle = const TextStyle(fontSize: contentSize),
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.margin = const EdgeInsets.symmetric(vertical: 8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: margin,
            child: ListTile(
              leading: Icon(
                leadingIcon,
                color: iconColor,
                size: iconSize,
              ),
              title: Text(
                items[index]['title']!,
                style: titleTextStyle,
              ),
              subtitle: Text(
                items[index]['description']!,
                style: subtitleTextStyle,
              ),
            ),
          );
        },
      ),
    );
  }
}




class KeyServicesListWidget extends StatelessWidget {
  final List<Map<String, String>> items;
  final double iconSize;
  final Color iconColor;
  final TextStyle titleStyle;
  final EdgeInsetsGeometry padding;

  const KeyServicesListWidget({
    Key? key,
    required this.items,
    this.iconSize = contentIconSize,
    this.iconColor = AppColors.appBarColor,
    this.titleStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: contentTitleSize),
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: Icon(Icons.verified, color: iconColor, size: iconSize),
              title: Text(
                items[index]['title']!,
                style: titleStyle,
              ),
              // subtitle: Text(items[index]['description']!),
            ),
          );
        },
      ),
    );
  }
}


class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 8,
      shadowColor: Colors.blueAccent.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print('Book Now Button Pressed');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appBarColor,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Book Now',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
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
}


class CustomWidgets {
  // Section Title Widget
  static Widget sectionTitle({
    required String title,
    TextStyle? style,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(vertical: 10),
  }) {
    return Padding(
      padding: padding,
      child: Text(
        title,
        style: style ??
            const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
      ),
    );
  }

  // Build Section with List
  static Widget buildSection({
    required String title,
    required List<String> items,
    Color backgroundColor = const Color(0xFFE0E0E0),
    double borderRadius = 10.0,
    BoxShadow? boxShadow,
    EdgeInsetsGeometry padding = const EdgeInsets.all(12),
    TextStyle? titleStyle,
    TextStyle? itemStyle,
    IconData bulletIcon = Icons.verified,
    Color bulletColor = AppColors.appBarColor,
  }) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          boxShadow ??
              const BoxShadow(
                color: Colors.grey,
                blurRadius: 2,
                spreadRadius: 1,
              ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle ??
                const TextStyle(
                  fontSize: contentTitleSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
          ),
          const SizedBox(height: 8),
          ...items.map(
                (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    bulletIcon,
                    color: bulletColor,
                    size: bulletIconSize,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item,
                      style: itemStyle ??
                          const TextStyle(
                            fontSize: contentSize,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Bullet Text Widget
  static Widget bulletText({
    required String text,
    TextStyle? textStyle,
    IconData bulletIcon = Icons.verified,
    Color bulletColor = Colors.red,
    double bulletSize = contentIconSize,
    double spacing = 8.0,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(vertical: 5),
  }) {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(bulletIcon, color: bulletColor, size: bulletSize),
          SizedBox(width: spacing),
          Expanded(
            child: Text(
              text,
              style: textStyle ??
                  const TextStyle(
                    fontSize: 15,
                    height: 1.4,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget BulletList({
  required List<String> items,
    iconSize = bulletIconSize,
    iconColor = AppColors.appBarColor,}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map((item) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.verified, color: iconColor, size: iconSize),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item,
                  style: const TextStyle(fontSize: contentSize),
                ),
              ),
            ],
          ),
        ))
            .toList(),
      ),
    );
  }


  static Widget buildListSection(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: contentTitleSize, fontWeight: FontWeight.bold, color: AppColors.appBarColor),
          ),
          SizedBox(height: 5),
          ...items.map((item) => buildBulletText(item)).toList(),
          SizedBox(height: 10),
        ],
      ),
    );
  }

 static Widget buildBulletText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.verified, color: AppColors.appBarColor, size: bulletIconSize),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: contentSize, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  static Widget cardSection(
  final String title,
  final List<String> items,) {
    return Card(
      // margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
      elevation: 2,
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: contentSize,
                fontWeight: FontWeight.bold,
                color: AppColors.appBarColor,
              ),
            ),
            const SizedBox(height: 8),
            BulletList(items: items),
          ],
        ),
      ),
    );
  }

 static Widget buildCustomListSection(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: contentTitleSize, fontWeight: FontWeight.bold, color: AppColors.appBarColor),
          ),
          SizedBox(height: 5),
          ...items.map((item) => buildCustomBulletText(item)).toList(),
          SizedBox(height: 10),
        ],
      ),
    );
  }

 static Widget buildCustomBulletText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.verified, color: AppColors.appBarColor, size: bulletIconSize),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: contentSize, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

}

class AnimatedSearchBox extends StatefulWidget {
  final List<String> animatedTexts;
  final Function() onTap;

  const AnimatedSearchBox({
    Key? key,
    required this.animatedTexts,
    required this.onTap,
  }) : super(key: key);

  @override
  _AnimatedSearchBoxState createState() => _AnimatedSearchBoxState();
}

class _AnimatedSearchBoxState extends State<AnimatedSearchBox>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  String _currentText = '';
  int _textCharIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTypewriterAnimation();
  }

  void _startTypewriterAnimation() {
    Future.delayed(const Duration(milliseconds: 100), _updateText);
  }

  void _updateText() {
    if (_textCharIndex < widget.animatedTexts[_currentIndex].length) {
      setState(() {
        _currentText += widget.animatedTexts[_currentIndex][_textCharIndex];
        _textCharIndex++;
      });
      Future.delayed(const Duration(milliseconds: 50), _updateText);
    } else {
      Future.delayed(const Duration(seconds: 2), _prepareNextText);
    }
  }

  void _prepareNextText() {
    setState(() {
      _currentText = '';
      _textCharIndex = 0;
      _currentIndex = (_currentIndex + 1) % widget.animatedTexts.length;
    });
    _startTypewriterAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white, // Background color
            borderRadius: BorderRadius.circular(12), // Smooth border radius
            border: Border.all(color: Colors.grey.shade300,width: 2),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.withOpacity(0.2),
            //     blurRadius: 8,
            //     offset: const Offset(0, 4), // Shadow position
            //   ),
            // ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  _currentText,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.search,
                color: AppColors.appBarColor,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}