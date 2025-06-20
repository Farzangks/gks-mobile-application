import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
          'Privacy Policy',
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
                        Icons.privacy_tip_outlined,
                        size: 32,
                        color: AppColors.appBarColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Privacy Policy",
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
                        "Last Updated: March 2025",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.appBarColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Your privacy matters to us. Learn how we collect, use, and protect your personal information.",
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

              // Acceptance Section
              _buildSection(
                title: 'Your Acceptance of This Privacy Policy',
                icon: Icons.handshake_outlined,
                content: 'Welcome to Gharkasathi\'s Privacy Policy ("Privacy Policy" or "Policy"). Gharkasathi and its affiliates (collectively, "Gharkasathi," "we," or "us") are committed to providing web-based solutions that connect customers seeking specific services with service professionals offering those services. This Policy outlines our practices regarding the collection, storage, usage, processing, and disclosure of personal data that you consent to share with us when you access, use, or otherwise interact with our website (www.gharkasathi.com) or the mobile application "Gharkasathi" (collectively, the "Platform"), or when you avail of products or services offered by Gharkasathi on or through the Platform (collectively, the "Services").',
              ),

              const SizedBox(height: 16),

              // Background Information Section
              _buildSection(
                title: 'Background and Key Information',
                icon: Icons.info_outline,
                content: 'This Policy applies to individuals who access or use the Services or avail themselves of Professional Services. References to "you" throughout this Policy refer to the end user using the Platform. By using the Platform, you consent to the collection, storage, use, and disclosure of your personal data as outlined in this Policy.',
                highlights: [
                  'How This Policy Applies: By using the Platform, you consent to our data practices.',
                  'Review and Updates: We regularly review and update our Privacy Policy.',
                  'Third-Party Services: We are not responsible for third-party privacy practices.',
                ],
              ),

              const SizedBox(height: 16),

              // Personal Data Collection Section
              _buildSection(
                title: 'Personal Data We Collect',
                icon: Icons.data_usage_outlined,
                content: 'We collect various types of personal data about you to provide our services effectively. This includes information you provide directly and data we collect automatically.',
                highlights: [
                  'Contact Data: Mailing address, email address, mobile number.',
                  'Identity and Profile Data: Name, username, photographs.',
                  'Marketing and Communications Data: Service requests, communication preferences.',
                  'Technical Data: IP address, browser type, device ID.',
                  'Usage Data: Information about how you use our Services.',
                ],
              ),

              const SizedBox(height: 16),

              // Data Collection Methods Section
              _buildSection(
                title: 'How We Collect Personal Data',
                icon: Icons.source_outlined,
                content: 'We collect personal data from you through various methods to ensure we can provide you with the best possible service experience.',
                highlights: [
                  'Direct Interactions: When you create an account or use our Services.',
                  'Automated Technologies: Through cookies and similar tracking technologies.',
                  'Third Parties: From analytics providers and other service partners.',
                ],
              ),

              const SizedBox(height: 16),

              // Data Usage Section
              _buildSection(
                title: 'How We Use Your Personal Data',
                icon: Icons.psychology_outlined,
                content: 'We will use your personal data only where permitted by law. We process your information for legitimate business purposes and to provide you with our services.',
                highlights: [
                  'Verifying your identity and account security.',
                  'Providing Services and customer support.',
                  'Monitoring trends and improving user experience.',
                  'Sending notifications related to your account or Services.',
                  'Complying with legal obligations and requirements.',
                ],
              ),

              const SizedBox(height: 16),

              // Cookies Section
              _buildSection(
                title: 'Cookies and Tracking Technologies',
                icon: Icons.cookie_outlined,
                content: 'Cookies are small files transferred to your device that help us recognize your browser and capture information about your preferences. We use cookies for various purposes, such as improving user experience and analyzing site traffic.',
              ),

              const SizedBox(height: 16),

              // Data Disclosure Section
              _buildSection(
                title: 'Disclosure of Your Personal Data',
                icon: Icons.share_outlined,
                content: 'We may disclose your personal data to specific parties under certain circumstances, always in accordance with applicable privacy laws.',
                highlights: [
                  'Service professionals providing Professional Services.',
                  'Internal third parties within the Gharkasathi group.',
                  'External third parties, such as service providers, for operational purposes.',
                  'Legal authorities when required by law or to protect our rights.',
                ],
              ),

              const SizedBox(height: 16),

              // User Rights Section
              _buildSection(
                title: 'Your Rights in Relation to Your Personal Data',
                icon: Icons.account_balance_outlined,
                content: 'You have several rights regarding your personal data under applicable privacy laws. We are committed to helping you exercise these rights.',
                highlights: [
                  'Accessing Your Personal Data: Request access by contacting us.',
                  'Correcting Your Data: Update inaccurate or incomplete information.',
                  'Deleting Your Data: Request deletion of your personal data.',
                  'Opting-out: Unsubscribe from marketing communications.',
                  'Data Portability: Request your data in a portable format.',
                ],
              ),

              const SizedBox(height: 16),

              // Account Deletion Section
              _buildSection(
                title: 'Deletion of Account and Personal Data',
                icon: Icons.delete_outline,
                content: 'You can delete your account and associated personal data by contacting us at contact@gharkasathi.com. We will process your request within a reasonable timeframe in accordance with applicable laws.',
              ),

              const SizedBox(height: 16),

              // Data Transfers Section
              _buildSection(
                title: 'Transfers of Your Personal Data',
                icon: Icons.swap_horiz_outlined,
                content: 'Your personal data may be transferred to countries outside of your location for processing, in compliance with applicable laws and with appropriate safeguards in place.',
              ),

              const SizedBox(height: 16),

              // Data Security Section
              _buildSection(
                title: 'Data Security',
                icon: Icons.security_outlined,
                content: 'We implement appropriate technical and organizational security measures to protect your personal data from unauthorized access, disclosure, alteration, and destruction.',
              ),

              const SizedBox(height: 16),

              // Data Retention Section
              _buildSection(
                title: 'Data Retention',
                icon: Icons.schedule_outlined,
                content: 'Your personal data will be retained only as long as necessary for our legitimate business purposes and to meet legal obligations.',
              ),

              const SizedBox(height: 16),

              // Business Transitions Section
              _buildSection(
                title: 'Business Transitions',
                icon: Icons.business_outlined,
                content: 'In the event of a business transition, such as a merger, acquisition, or asset sale, your personal data may be included among the assets transferred, subject to the same privacy protections.',
              ),

              const SizedBox(height: 16),

              // User Generated Content Section
              _buildSection(
                title: 'User-Generated Content',
                icon: Icons.create_outlined,
                content: 'Any content posted by users on our Platform may become public. You are responsible for ensuring that such content complies with applicable laws and does not contain sensitive personal information.',
              ),

              const SizedBox(height: 16),

              // Policy Updates Section
              _buildSection(
                title: 'Updates to This Policy',
                icon: Icons.update_outlined,
                content: 'We may update this Policy from time to time to reflect changes in our practices or for legal, operational, or regulatory reasons. Any changes will be posted on the Platform or communicated through other appropriate means.',
              ),

              const SizedBox(height: 24),

              // Contact Section
              _buildContactSection(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required String content,
    List<String>? highlights,
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
          if (highlights != null) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.bgColors.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.secondaryBtnLigRed.withOpacity(0.5),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: highlights.map((highlight) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 6),
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: AppColors.appBarColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            highlight,
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.5,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildContactSection() {
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
                  Icons.contact_support_outlined,
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
                      'Grievance Officer & Contact',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.appBarColor,
                      ),
                    ),
                    Text(
                      'For questions about this Privacy Policy or data handling',
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

          Text(
            'For questions regarding this Policy or how we handle your personal data, please contact us. This Privacy Policy aims to ensure transparency regarding our practices concerning user privacy while complying with applicable laws governing personal data protection.',
            style: TextStyle(
              fontSize: 14,
              height: 1.6,
              color: Colors.grey[700],
            ),
          ),

          const SizedBox(height: 16),

          // Contact Method
          Container(
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
                  Icons.email_outlined,
                  color: AppColors.appBarColor,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email Support',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'contact@gharkasathi.com',
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
          ),

          const SizedBox(height: 16),

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
                    Icons.email_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Contact Privacy Officer',
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
}