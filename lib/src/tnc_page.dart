import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:itq_utils/itq_utils.dart';

class TermsAndConditionPage extends StatelessWidget {
  const TermsAndConditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: AppColors.redGradient,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.2),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.bgColor,
              AppColors.bgColors.withOpacity(0.3),
            ],
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.btnLightRed.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.bgColors.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.description_outlined,
                          size: 32,
                          color: AppColors.appBarColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Terms & Conditions",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.appBarColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBtnLigRed.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Last Updated: November 17, 2024",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.appBarColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Please read these terms and conditions carefully before using our service.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Introduction Section
                _buildSection(
                  title: "Introduction",
                  icon: Icons.info_outline,
                  content: "Welcome to Ghar Ka Sathi. These terms and conditions outline the rules and regulations for the use of our website and mobile application. By accessing this website and using our services, we assume you accept these terms and conditions. Do not continue to use Ghar Ka Sathi if you do not agree to take all of the terms and conditions stated on this page.",
                ),

                const SizedBox(height: 16),

                // Acceptance of Terms Section
                _buildSection(
                  title: "Acceptance of Terms",
                  icon: Icons.check_circle_outline,
                  content: "By creating an account or using any part of the service, you agree to be bound by these Terms of Service. If you do not agree to all the terms and conditions of this agreement, then you may not access the website or use any services.",
                ),

                const SizedBox(height: 16),

                // Use License Section
                _buildSection(
                  title: "Use License",
                  icon: Icons.verified_user_outlined,
                  content: "Permission is granted to temporarily download one copy of the materials on Ghar Ka Sathi for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license you may not:\n\n• Modify or copy the materials\n• Use the materials for commercial purposes\n• Attempt to reverse engineer any software\n• Remove any copyright or proprietary notations",
                ),

                const SizedBox(height: 16),

                // User Accounts Section
                _buildSection(
                  title: "User Accounts",
                  icon: Icons.person_outline,
                  content: "When you create an account with us, you must provide information that is accurate, complete, and current at all times. You are responsible for safeguarding the password and for maintaining the confidentiality of your account. You agree not to disclose your password to any third party.",
                ),

                const SizedBox(height: 16),

                // Privacy Policy Section
                _buildSection(
                  title: "Privacy Policy",
                  icon: Icons.privacy_tip_outlined,
                  content: "Your privacy is important to us. Our Privacy Policy explains how we collect, use, and protect your information when you use our service. By using our service, you agree to the collection and use of information in accordance with our Privacy Policy.",
                ),

                const SizedBox(height: 16),

                // Prohibited Uses Section
                _buildSection(
                  title: "Prohibited Uses",
                  icon: Icons.block_outlined,
                  content: "You may not use our service:\n\n• For any unlawful purpose or to solicit others to perform unlawful acts\n• To violate any international, federal, provincial, or state regulations, rules, laws, or local ordinances\n• To infringe upon or violate our intellectual property rights or the intellectual property rights of others\n• To harass, abuse, insult, harm, defame, slander, disparage, intimidate, or discriminate\n• To submit false or misleading information",
                ),

                const SizedBox(height: 16),

                // Service Availability Section
                _buildSection(
                  title: "Service Availability",
                  icon: Icons.access_time_outlined,
                  content: "We do not guarantee that our service will be available at all times. We may experience hardware, software, or other problems or need to perform maintenance related to the service, resulting in interruptions, delays, or errors.",
                ),

                const SizedBox(height: 16),

                // Limitation of Liability Section
                _buildSection(
                  title: "Limitation of Liability",
                  icon: Icons.gavel_outlined,
                  content: "In no event shall Ghar Ka Sathi, nor its directors, employees, partners, agents, suppliers, or affiliates, be liable for any indirect, incidental, special, consequential, or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses.",
                ),

                const SizedBox(height: 16),

                // Changes to Terms Section
                _buildSection(
                  title: "Changes to Terms",
                  icon: Icons.update_outlined,
                  content: "We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material, we will try to provide at least 30 days' notice prior to any new terms taking effect.",
                ),

                const SizedBox(height: 16),

                // Contact Information Section
                _buildSection(
                  title: "Contact Information",
                  icon: Icons.contact_support_outlined,
                  content: "If you have any questions about these Terms and Conditions, please contact us:\n\n• Email: support@gharkasathi.com\n• Phone: +91-777099912\n• Address: [Your Company Address]",
                ),

                const SizedBox(height: 24),

                // Footer
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.bgColors.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.secondaryBtnLigRed,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.security,
                        color: AppColors.appBarColor,
                        size: 24,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Your Agreement",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.appBarColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "By using our service, you acknowledge that you have read and understood these terms and conditions and agree to be bound by them.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.btnLightRed.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.bgColors.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: AppColors.appBarColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.appBarColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: TextStyle(
              fontSize: 14,
              height: 1.6,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}