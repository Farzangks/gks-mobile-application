import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

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
              Get.back();
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
          'Terms of Use',
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
                        Icons.assignment_outlined,
                        size: 32,
                        color: AppColors.appBarColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Terms of Use",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.appBarColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Legal agreement governing your use of Ghar Ka Sathi platform",
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

              const SizedBox(height: 20),

              // Important Notice
              _buildWarningBox(),

              const SizedBox(height: 24),

              // Agreement Acceptance Section
              _buildSection(
                title: '1. Acceptance of This Agreement',
                icon: Icons.handshake_outlined,
                content: 'This agreement ("Agreement") is between you ("you" or "your") and Gharkasathi, a company incorporated under applicable laws, with its registered office at [Insert Address] ("Gharkasathi," "we," or "our"). This document governs your use of the services provided by Gharkasathi via our website, www.gharkasathi.com ("Website"), which offers various home service solutions ("Platform"). By accessing or using the Platform, you agree to be bound by these Terms and Conditions ("Terms").',
              ),

              const SizedBox(height: 16),

              // Modifications Section
              _buildSection(
                title: '2. Modifications to the Terms',
                icon: Icons.update_outlined,
                content: 'We may update these Terms and the Website periodically without prior notice. You are responsible for reviewing these Terms regularly for any changes. All amendments become effective once posted on the Website. Your continued use of the Platform after such revisions signifies your acceptance of the updated Terms.',
              ),

              const SizedBox(height: 16),

              // Materials Usage Section
              _buildSection(
                title: '3. Use of Our Materials',
                icon: Icons.content_copy_outlined,
                content: 'The Platform includes a variety of information, text, images, designs, graphics, sound, video recordings, and other materials (collectively "Materials"). These Materials are for your personal, non-commercial use only. You may view, use, copy, and distribute the Materials for internal informational purposes only. Automated processes such as data mining or scraping are prohibited.',
              ),

              const SizedBox(height: 16),

              // Trademarks Section
              _buildSection(
                title: '4. Use of Our Trademarks',
                icon: Icons.verified_outlined,
                content: 'All trademarks and service marks associated with Gharkasathi are owned by us or used under license. You are not authorized to use any Gharkasathi name or mark in any advertising or commercial capacity without prior written consent.',
              ),

              const SizedBox(height: 16),

              // Information Usage Section
              _buildSection(
                title: '5. Use of Information You Provide to Us',
                icon: Icons.upload_outlined,
                content: 'Please refrain from sending us confidential information. Any material you submit to us will be considered non-confidential and non-proprietary. We may reproduce, use, and distribute such information without any restrictions.',
              ),

              const SizedBox(height: 16),

              // Reviews Section
              _buildSection(
                title: '6. Reviews, Ratings, and Comments by Users',
                icon: Icons.rate_review_outlined,
                content: 'You are responsible for any content you post on the Platform ("Communications"). By posting any Communication, you grant Gharkasathi a worldwide, perpetual license to use that content as we see fit. We reserve the right to monitor and remove any content we deem inappropriate or in violation of these Terms.',
              ),

              const SizedBox(height: 16),

              // Privacy Policy Section
              _buildSection(
                title: '7. Privacy Policy',
                icon: Icons.privacy_tip_outlined,
                content: 'We are committed to protecting your personal information as outlined in our Privacy Policy. Please refer to the Privacy Policy for detailed information on how we handle your data.',
              ),

              const SizedBox(height: 16),

              // Content Disclaimer Section
              _buildSection(
                title: '8. Content Disclaimer',
                icon: Icons.account_circle_outlined,
                content: 'The Platform may contain third-party information. While we strive for accuracy, we do not guarantee the authenticity or completeness of such content and are not liable for any damages resulting from reliance on this information.',
              ),

              const SizedBox(height: 16),

              // Warranty Disclaimer Section
              _buildSection(
                title: '9. Warranty Disclaimer',
                icon: Icons.warning_amber_outlined,
                content: 'Gharkasathi does not endorse any service providers listed on our Platform. You are advised to conduct your own research before engaging with them. All services are provided "as is," without warranties of any kind.',
              ),

              const SizedBox(height: 16),

              // Service Fulfillment Section
              _buildSection(
                title: '10. Use of Gharkasathi\'s Local Service Fulfillment',
                icon: Icons.home_repair_service_outlined,
                content: 'Users are responsible for all aspects of transactions with service providers found through our Platform. We do not mediate disputes between users and service providers.',
              ),

              const SizedBox(height: 16),

              // Code of Conduct Section
              _buildSection(
                title: '11. Code of Conduct for Service Providers and Users',
                icon: Icons.rule_outlined,
                content: 'Users must resolve any conflicts directly with service providers listed on our Platform. We expect all users to maintain professional and respectful behavior when using our services.',
              ),

              const SizedBox(height: 16),

              // Additional Disclaimer Section
              _buildSection(
                title: '12. Additional Disclaimer',
                icon: Icons.info_outline,
                content: 'Users should verify all information received from advertisers before entering into transactions. We recommend conducting thorough research and due diligence.',
              ),

              const SizedBox(height: 16),

              // Limitation of Liability Section
              _buildSection(
                title: '13. Limitation of Liability',
                icon: Icons.gavel_outlined,
                content: 'Gharkasathi is not liable for any damages arising from your use or inability to use the Platform. This includes but is not limited to direct, indirect, incidental, or consequential damages.',
              ),

              const SizedBox(height: 16),

              // Third-Party Sites Section
              _buildSection(
                title: '14. Third-Party Sites',
                icon: Icons.link_outlined,
                content: 'Your interactions with advertisers found on our Platform are solely between you and those advertisers. We are not responsible for their content or services.',
              ),

              const SizedBox(height: 16),

              // Indemnification Section
              _buildSection(
                title: '15. Indemnification',
                icon: Icons.shield_outlined,
                content: 'You agree to indemnify Gharkasathi against any claims arising from your violation of these Terms or your use of the Platform.',
              ),

              const SizedBox(height: 16),

              // Miscellaneous Section
              _buildSection(
                title: '16. Miscellaneous',
                icon: Icons.description_outlined,
                content: 'These Terms are governed by Indian law, and any disputes will be settled in Raipur, India. This document serves as the foundational agreement governing your interaction with Gharkasathi\'s services and should be reviewed regularly to ensure compliance with current practices and regulations.',
              ),

              const SizedBox(height: 24),

              // Contact Support Section
              _buildContactSupport(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWarningBox() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.headerColor.withOpacity(0.1),
            AppColors.secondaryBtnLigRed.withOpacity(0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.headerColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.headerColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.warning_amber_rounded,
              color: AppColors.headerColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Important Notice',
                  style: TextStyle(
                    color: AppColors.headerColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Please read these Terms of Use carefully before using our platform. Your continued use constitutes acceptance of these terms.',
                  style: TextStyle(
                    color: AppColors.appBarColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
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

  Widget _buildContactSupport() {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.bgColors.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.support_agent,
                  size: 24,
                  color: AppColors.appBarColor,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Need Help?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.appBarColor,
                      ),
                    ),
                    Text(
                      'Our support team is here to assist you',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Contact Methods
          _buildContactMethod(
            icon: Icons.email_outlined,
            label: 'Email Support',
            value: 'support@gharkasathi.com',
          ),

          const SizedBox(height: 12),

          _buildContactMethod(
            icon: Icons.phone_outlined,
            label: 'Phone Support',
            value: '+91-777099912',
          ),

          const SizedBox(height: 20),

          // Contact Button
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: AppColors.redGradient,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.btnLightRed.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () {
                // Add contact support functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Contact Support',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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

  Widget _buildContactMethod({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.secondaryBtnLigRed.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.appBarColor,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.appBarColor,
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