import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/model/app_model.dart';
import 'package:ghar_ka_sathi/src/sign_in_screen.dart';
import 'package:ghar_ka_sathi/store/DataProvider.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  final List<WalkThroughData> list = walkThroughDataList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          OnboardingPage(
            image: 'assets/gks/Onboarding1.png',
            title: 'Real Estate \nand Construction',
            description: 'Your dream space, expertly built.',
          ),
          OnboardingPage(
            image: 'assets/gks/Onboarding2.png',
            title: 'In-House Services',
            description: 'We care for your home like it’s our own.',
          ),
          OnboardingPage(
            image: 'assets/gks/Onboarding3.png',
            title: 'Interior Design',
            description: 'Transforming your vision into beautiful reality',
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40.0, left: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                  // Navigate to dashboard or any other screen
                  Get.to(const SignInScreen());
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_currentPage == 2) {
                  // Navigate to sign-in or show bottom sheet
                  Get.to(const SignInScreen());
                  // showModalBottomSheet(
                  //   isScrollControlled: true,
                  //   context: context,
                  //   backgroundColor: Colors.transparent,
                  //   builder: (context) => DraggableScrollableSheet(
                  //     initialChildSize: 0.6,
                  //     maxChildSize: 1.0,
                  //     minChildSize: 0.3,
                  //     builder: (context, scrollController) => const SignInScreen(),
                  //   ),
                  // );
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.appBarColor,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            image,
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 30),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
