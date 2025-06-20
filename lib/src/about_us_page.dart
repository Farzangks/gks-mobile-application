import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.appBarColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildHeroSection(),
              const SizedBox(height: 24),
              _buildMissionSection(),
              const SizedBox(height: 24),
              _buildWhyChooseSection(),
              const SizedBox(height: 24),
              _buildServicesSection(),
              const SizedBox(height: 24),
              _buildFeaturesSection(),
              const SizedBox(height: 24),
              _buildContactSection(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.redGradient,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.home_rounded,
            color: Colors.white,
            size: 48,
          ),
          const SizedBox(height: 16),
          const Text(
            'Welcome to Ghar Ka Sathi',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Text(
            'Your Trusted Partner for Real Estate & Home Services',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMissionSection() {
    return _buildSection(
      title: 'Our Mission',
      icon: Icons.flag_rounded,
      children: [
        _buildContentText(
          'At Ghar Ka Sathi, we understand that finding the perfect home, managing property services, or handling relocation can be overwhelming. That\'s why we\'re here to make your journey simple, transparent, and stress-free.',
        ),
        const SizedBox(height: 16),
        _buildContentText(
          'Whether you\'re buying your first home, renting, or in need of expert home services, we\'re committed to being by your side every step of the way.',
        ),
        const SizedBox(height: 16),
        _buildContentText(
          'Our goal is simple: to connect you with trusted, professional service providers who truly care about your needs. We prioritize transparency, reliability, and efficiency to ensure your experience is seamless from start to finish.',
        ),
      ],
    );
  }

  Widget _buildWhyChooseSection() {
    return _buildSection(
      title: 'Why Choose Us?',
      icon: Icons.star_rounded,
      children: [
        _buildFeatureCard(
          icon: Icons.verified_user,
          title: 'Experienced Professionals',
          description: 'We work only with skilled, certified experts passionate about delivering the best services.',
        ),
        const SizedBox(height: 12),
        _buildFeatureCard(
          icon: Icons.home_repair_service,
          title: 'Comprehensive Services',
          description: 'From real estate to home maintenance, we\'ve got you covered.',
        ),
        const SizedBox(height: 12),
        _buildFeatureCard(
          icon: Icons.smartphone,
          title: 'Effortless Online Booking',
          description: 'Book your services in just a few clicks—quick, simple, and convenient.',
        ),
        const SizedBox(height: 12),
        _buildFeatureCard(
          icon: Icons.attach_money,
          title: 'Affordable Quality',
          description: 'We balance value with affordability so you can trust that your money goes far.',
        ),
        const SizedBox(height: 12),
        _buildFeatureCard(
          icon: Icons.favorite,
          title: 'Customer-Centric',
          description: 'Your happiness is our priority. We listen, adapt, and ensure you\'re satisfied.',
        ),
      ],
    );
  }

  Widget _buildServicesSection() {
    return _buildSection(
      title: 'Our Services',
      icon: Icons.build_rounded,
      children: [
        _buildContentText(
          'We\'re proud to offer a wide range of services tailored to meet the needs of every homeowner:',
        ),
        const SizedBox(height: 20),
        _buildServiceCard('Real Estate Services', 'Buying, Selling, & Renting', Icons.real_estate_agent),
        const SizedBox(height: 12),
        _buildServiceCard('Cleaning Services', 'Deep Cleaning & Regular Maintenance', Icons.cleaning_services),
        const SizedBox(height: 12),
        _buildServiceCard('Painting Services', 'Interior & Exterior Makeovers', Icons.format_paint),
        const SizedBox(height: 12),
        _buildServiceCard('Electrical Services', 'Repairs & Installations', Icons.electrical_services),
        const SizedBox(height: 12),
        _buildServiceCard('Home Renovation', 'Kitchens, Bathrooms & Extensions', Icons.home_work),
        const SizedBox(height: 12),
        _buildServiceCard('Packing & Moving', 'Residential & Commercial Relocations', Icons.local_shipping),
      ],
    );
  }

  Widget _buildFeaturesSection() {
    return _buildSection(
      title: 'Peace of Mind',
      icon: Icons.security_rounded,
      children: [
        _buildBenefitCard('24/7 Support', 'We\'re always here to answer your questions and resolve concerns.', Icons.support_agent),
        const SizedBox(height: 12),
        _buildBenefitCard('Eco-Friendly Practices', 'We use sustainable, green products wherever possible.', Icons.eco),
        const SizedBox(height: 12),
        _buildBenefitCard('Fully Insured Services', 'Your home is safe with us—our services come with peace of mind.', Icons.security),
        const SizedBox(height: 12),
        _buildBenefitCard('Exclusive Discounts', 'We value our loyal customers and reward them with special offers.', Icons.local_offer),
      ],
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.greenGradient,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.connect_without_contact,
            color: Colors.white,
            size: 48,
          ),
          const SizedBox(height: 16),
          const Text(
            'Let\'s Connect!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Text(
            'Ready to simplify your life and experience the best in real estate and home services? Let Ghar Ka Sathi become your trusted partner in creating the perfect space for you and your loved ones.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.appBarColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: AppColors.appBarColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.appBarColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }

  Widget _buildContentText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        height: 1.6,
        color: Colors.grey[700],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgColors.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.appBarColor.withOpacity(0.1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.appBarColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.appBarColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title, String subtitle, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgColors.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.appBarColor.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: AppColors.redGradient,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.appBarColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitCard(String title, String description, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.btnLightGreen.withOpacity(0.1),
            AppColors.btnDarkGreen.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.btnLightGreen.withOpacity(0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: AppColors.greenGradient,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.btnDarkGreen,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}