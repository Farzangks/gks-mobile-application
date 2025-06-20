import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class SellsAgreementPage extends StatelessWidget {
  const SellsAgreementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text(
          "Sells Agreement",
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.appBarColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: AppColors.appBarColor,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  Text(
                    'Online Sales Agreement',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.headerColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Text(
                          '4.9 Rating • 12450 Reviews',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(16),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Card(
            //           child: Padding(
            //             padding: EdgeInsets.all(16),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Icon(Icons.home_work),
            //                 SizedBox(height: 8),
            //                 Text(
            //                   'Certified Advocates',
            //                   style: TextStyle(
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 16,
            //                   ),
            //                 ),
            //                 Text(
            //                   'Senior Advocates with experience 15yrs+',
            //                   style: TextStyle(fontSize: 14),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16),
            //   child: Row(
            //     children: [
            //       Icon(Icons.people_outline),
            //       SizedBox(width: 8),
            //       Text(
            //         '1 lakh+ Happy customers served',
            //         style: TextStyle(
            //           color: Color(0xFF4A5CFF),
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'Packages'),
                      Tab(text: 'Services'),
                    ],
                    labelColor: Colors.red,
                    indicatorColor: Colors.red,
                  ),
                  SizedBox(
                    height: 400, // Adjust based on content
                    child: TabBarView(
                      children: [
                        _buildPackagesList(),
                        _buildServicesList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.red,
      //   child: Icon(Icons.chat),
      //   onPressed: () {},
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.menu),
      //       label: 'Menu',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.circle_outlined),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.arrow_back),
      //       label: 'Back',
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildPackagesList() {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _buildPackageCard(
          title: 'Khata Transfer',
          description: 'Transfer of Revenue Records from previous owner to current owner',
          originalPrice: '₹19,500',
          discountedPrice: '₹14,999',
          isPopular: true,
        ),
        SizedBox(height: 16),
        _buildPackageCard(
          title: 'Khata Express',
          description: 'Transfer of Revenue Records from previous owner to current owner\nTransfer within 20 working days',
          originalPrice: '₹39,000',
          discountedPrice: '₹29,999',
          isPopular: false,
        ),
      ],
    );
  }

  Widget _buildPackageCard({
    required String title,
    required String description,
    required String originalPrice,
    required String discountedPrice,
    required bool isPopular,
  }) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isPopular)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'Popular',
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8),
            Text(description),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$originalPrice  ',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: discountedPrice,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Select'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.cyan, backgroundColor: Colors.cyan[50],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServicesList() {
    return Center(
      child: Text('Services Tab Content'),
    );
  }
}