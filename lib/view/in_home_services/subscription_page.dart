import 'package:flutter/material.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pricing',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Header Section
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'PRICING',
                  style: TextStyle(
                    color: Colors.red[700],
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'Our Subscription',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // Subscription Cards
              Column(
                children: [
                  // Basic Plan
                  _buildSubscriptionCard(
                    context,
                    title: 'GharKaSathi LITE',
                    subtitle: '(Basic)',
                    price: '₹5,999',
                    description: 'Join us every month for a very reasonable price',
                    features: [
                      'Transportation for you',
                      'A hotel or homestay',
                      'Free meals and drinks',
                      '24/7 Support',
                      'Unlimited users',
                    ],
                    isRecommended: false,
                    buttonColor: const Color(0xFF8B2635),
                  ),

                  const SizedBox(height: 20),

                  // Standard Plan
                  _buildSubscriptionCard(
                    context,
                    title: 'GharKaSathi PRIME',
                    subtitle: '(Standard)',
                    price: '₹8,999',
                    description: 'Join us every month for a very reasonable price',
                    features: [
                      'Transportation for you',
                      'A hotel or homestay',
                      'Free meals and drinks',
                      '24/7 Support',
                      'Unlimited users',
                    ],
                    isRecommended: false,
                    buttonColor: const Color(0xFF8B2635),
                  ),

                  const SizedBox(height: 20),

                  // Premium Plan (Recommended)
                  _buildSubscriptionCard(
                    context,
                    title: 'GharKaSathi Elite',
                    subtitle: '(Premium)',
                    price: '₹12,999',
                    description: 'Join us every month for a very reasonable price',
                    features: [
                      'Transportation for you',
                      'A hotel or homestay',
                      'Free meals and drinks',
                      '24/7 Support',
                      'Unlimited users',
                    ],
                    isRecommended: true,
                    buttonColor: Colors.white,
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionCard(
      BuildContext context, {
        required String title,
        required String subtitle,
        required String price,
        required String description,
        required List<String> features,
        required bool isRecommended,
        required Color buttonColor,
      }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isRecommended ? const Color(0xFF8B2635) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Recommended Badge
          if (isRecommended)
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.orange[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'RECOMMENDED',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Price Section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: isRecommended ? Colors.white : Colors.black87,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Text(
                        '/month',
                        style: TextStyle(
                          fontSize: 16,
                          color: isRecommended ? Colors.white70 : Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Title
                RichText(
                  text: TextSpan(
                    text: title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isRecommended ? Colors.white : Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: ' $subtitle',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: isRecommended ? Colors.white70 : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Description
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: isRecommended ? Colors.white70 : Colors.grey[600],
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 24),

                // Features List
                ...features.map((feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 20,
                        color: isRecommended ? Colors.white : Colors.green,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          feature,
                          style: TextStyle(
                            fontSize: 14,
                            color: isRecommended ? Colors.white : Colors.black87,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),

                const SizedBox(height: 24),

                // Contact Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _showContactDialog(context, title);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isRecommended ? Colors.white : const Color(0xFF8B2635),
                      foregroundColor: isRecommended ? const Color(0xFF8B2635) : Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Contact US',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward,
                          size: 18,
                          color: isRecommended ? const Color(0xFF8B2635) : Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showContactDialog(BuildContext context, String planName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Contact for $planName',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Thank you for your interest! Our team will contact you shortly to discuss the subscription details.',
            style: TextStyle(fontSize: 14, height: 1.4),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Request submitted for $planName!'),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B2635),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}