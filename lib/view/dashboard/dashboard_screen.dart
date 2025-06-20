import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/src/booking_screen.dart';
import 'package:ghar_ka_sathi/src/home.dart';
import 'package:ghar_ka_sathi/view/in_home_services/cart_screen.dart';
import 'package:ghar_ka_sathi/view/in_home_services/service_bottom_sheet_components.dart';
import 'package:ghar_ka_sathi/src/profile_page.dart';
import 'package:ghar_ka_sathi/view/real_eastate/real_eastate_screen.dart';
import 'package:ghar_ka_sathi/src/shortlist_page.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:lottie/lottie.dart';

class DashboardScreen extends StatefulWidget {
  static String tag = '/DashboardScreen';

  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int index = 0; // Track the selected page index
  final cartController = Get.put(CartController());

  final _pages = <Widget>[
    const HomePage(),
    BookingScreen(),
    const ShortlistPage(),
     ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          floatingActionButton: Container(
            // margin: const EdgeInsets.only(bottom: 30),
            child: InkWell(
              onTap: () {
                Get.to(() => const RealEstateScreen());
              },
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFB9121A)),
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.white,
                ),
                child: Lottie.asset('assets/gks/Animation _real_eastate.json', height: 50),
              ),
            ),
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            iconSize: Get.height * 0.027,
            backgroundColor: AppColors.white,
            currentIndex: index,
            onTap: (selectedIndex) {
              setState(() {
                index = selectedIndex;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.appBarColor,
            unselectedItemColor: AppColors.appBarColor,
            showSelectedLabels: false, // Remove selected labels
            showUnselectedLabels: false, // Remove unselected labels
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Padding(
                    padding: EdgeInsets.only(right: 30.0),
                    child: Icon(Icons.calendar_month),
                  ),
                  icon: Padding(
                    padding: EdgeInsets.only(right: 30.0),
                    child: Icon(Icons.calendar_month_outlined),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(Icons.favorite),
                  ),
                  icon: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(Icons.favorite_border),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.person),
                  icon: Icon(Icons.person_outline_outlined),
                  label: ''),
            ],
          ),
          body: _pages.elementAt(index),
        ),
      ],
    );
  }
}
