import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:  InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
        ),
        title: const Text(
          'Notification',
          style: TextStyle(color: AppColors.white),
        ),
        backgroundColor: AppColors.appBarColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          NotificationCard(
            icon: Icons.info,
            iconColor: Colors.red,
            title: '2 Special offers',
            description:
                'Take Offer to keep enjoying "Ghar Ka Sathi" services 😍',
            actionText: 'Get Offer',
          ),
          NotificationCard(
            icon: Icons.home_work_outlined,
            iconColor: Colors.grey,
            title: 'You have 1 FREE Coupon',
            description: 'Why have the boring old Why to clean your home!',
            actionText: 'Redeem now',
          ),
          // NotificationCard(
          //   icon: Icons.data_usage,
          //   iconColor: Colors.grey,
          //   title: '20 GB data up for grabs! 🎉',
          //   description:
          //   'Don’t miss out—start now and discover the rewards waiting for you! 🎁🎊',
          //   actionText: 'Claim now',
          // ),
          // NotificationCard(
          //   icon: Icons.videogame_asset,
          //   iconColor: Colors.grey,
          //   title: 'Mini Games, Mega Fun! 🎮',
          //   description: 'Enjoy the new games collection! 🔥',
          //   actionText: 'Play Now',
          // ),
          // NotificationCard(
          //   icon: Icons.article,
          //   iconColor: Colors.grey,
          //   title: 'Stay Informed with the Best Reads',
          //   description:
          //   'Access top newspapers and magazines like India Today, Hindustan Times, and Dainik Jagran at your fingertips.',
          //   actionText: 'Read now',
          // ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final String actionText;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: iconColor.withOpacity(0.2),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8.0),
                  GestureDetector(
                    onTap: () {
                      // Add action here
                    },
                    child: Text(
                      actionText,
                      style: const TextStyle(
                        color: AppColors.appBarColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
