import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/view/in_home_services/service_bottom_sheet_components.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:ghar_ka_sathi/utils/constant.dart';
import 'package:ghar_ka_sathi/utils/custom_widget.dart';
import 'package:lottie/lottie.dart';

// Add CartController class if not already defined elsewhere
class CartController {
  // Implement your cart functionality here
  void addToCart(String serviceType, String title, String price) {
    // Add to cart logic
    print('Added to cart: $serviceType - $title for ₹$price');
  }
}

class PropertyAndLegalServicesDedailsScreen extends StatelessWidget {
  PropertyAndLegalServicesDedailsScreen({super.key}) {
    // Initialize the cartController
    cartController = CartController();
  }

  late CartController cartController;

  // Sample data for the builder project services
  final List<Map<String, dynamic>> services = [
    {
      'title': "Purchase Agreement",
      'description':
      "Comprehensive will preparation services to ensure your wishes are honored.",
      'imagePath': "assets/gks/purchase-agreement.jpeg",
      'price': "5999",
      'serviceDetail': [
        {
          'header': 'Key Features',
          'data': ['Professional legal document preparation', 'Tailored to your specific needs']
        }
      ],
    },
    {
      'title': "Lease Agreement",
      'description':
      "Expert assistance in setting up trusts to manage your assets effectively.",
      'imagePath': "assets/gks/lease-agreement.jpeg",
      'price': "3999",
      'serviceDetail': [
        {
          'header': 'Key Features',
          'data': ['Comprehensive legal protection', 'Clear terms and conditions']
        }
      ],
    },
    {
      'title': "Mortage Agreements",
      'description':
      "Personalized consultation to discuss your estate planning needs and options.",
      'imagePath': "assets/gks/mortage-agreement.jpeg",
      'price': "7999",
      'serviceDetail': [
        {
          'header': 'Key Features',
          'data': ['Detailed financial terms', 'Legal compliance guaranteed']
        }
      ],
    },
    {
      'title': "Closing Document",
      'description':
      "Personalized consultation to discuss your estate planning needs and options.",
      'imagePath': "assets/gks/closing-document.jpeg",
      'price': "4999",
      'serviceDetail': [
        {
          'header': 'Key Features',
          'data': ['Complete final documentation', 'Smooth closing process']
        }
      ],
    },
    // Add more items here as required
  ];

  final List<Map<String, String>> wlcmMsg = [
    {
      "title":
      "Navigating property legalities made simple! Our Property Legal Services offer comprehensive support for all your real estate needs—from buying and selling to tenancy agreements and property disputes. Trust our expert team to handle documentation, registrations, and due diligence with precision and care. Secure your investment with reliable, transparent, and hassle-free legal solutions tailored just for you.",
    },
    // Add more services...
  ];

  final List<Map<String, String>> whyChooseUs = [
    {
      "title": "Expert Guidance",
      "description":
      "Our seasoned legal professionals bring years of real estate experience",
    },
    {
      "title": "Transparency & Trust",
      "description":
      "Clear, upfront communication and full transparency at every step",
    },
    {
      "title": "Efficiency & Precision",
      "description":
      "We prioritize swift processing without compromising on accuracy",
    },
    {
      "title": "Tailored Solutions",
      "description":
      "Personalized services designed to meet your unique legal needs.",
    },
    // Add more expertise...
  ];

  final List<Map<String, String>> contractDraftingReview = [
    {
      "title": "Purchase Agreements",
    },
    {
      "title": "Lease Agreements",
    },
    {
      "title": "Mortage Agreements",
    },
    {
      "title": "Closing Documnets",
    },
    // Add more services...
  ];

  final List<Map<String, String>> moreServices = [
    {
      "title": "Property Tax Appeals",
    },
    {
      "title": "Estate Planning",
    },
    // Add more services...
  ];

  final List<Map<String, String>> reqDocSeller = [
    {
      "title": "Title Deed",
      "description":
      "This is the primary document proving the sellers ownership of the property.",
    },
    {
      "title": "Encumbrance Certificate",
      "description":
      "This document verifies that the property is free from any legal or financial encumbrances, such as mortgages 1 or liens",
    },
    {
      "title": "Tax Receipts",
      "description":
      'Proof of payment of property taxes demonstrates the sellers responsibility and can help identify potential issues',
    },
    {
      "title": "Building Plan Approval",
      "description":
      "This document confirms that the propertys construction adheres to local building regulations",
    },
    {
      "title": "Completion Certificate",
      "description":
      "This certificate indicates that the propertys construction has been completed according to approved plans and meets safety standards",
    },
    {
      "title": "Occupancy Certificate",
      "description":
      "This certificate permits the property to be occupied and confirms its suitability for habitation.",
    },
    {
      "title": "Khata Certificate",
      "description":
      "This document verifies the propertys registration for tax purposes and provides details about its ownership and assessment.",
    },
    {
      "title": "Power of Attorney (if applicable)",
      "description":
      "If the seller is appointing someone to act on their behalf, a Power of Attorney document is necessary.",
    },
    // Add more expertise...
  ];

  final List<Map<String, String>> reqDocBuyer = [
    {
      "title": "Proof of Identity",
      "description":
      "Valid government-issued identification, such as Aadhaar card, PAN card, or passport",
    },
    {
      "title": "Proof of Address",
      "description":
      "Documents like a voter ID card, drivers license, or utility bills verifying the buyers residence",
    },
    {
      "title": "Income Proof",
      "description":
      'Documents like salary slips, bank statements, or income tax returns demonstrating the buyers financial capacity',
    },
    {
      "title": "Bank Statements",
      "description":
      "Recent bank statements to verify the buyers financial transactions and available funds.",
    },
    // Add more expertise...
  ];

  final List<Map<String, String>> reqDocOther = [
    {
      "title": "Sale and Purchase Agreement",
      "description":
      "This legally binding contract outlines the terms and conditions of the sale, including the property details, price, payment schedule, and possession date.",
    },
    {
      "title": "No Objection Certificate (NOC)",
      "description":
      "If applicable, NOCs from relevant authorities like the residents welfare association or building society may be required.",
    },
    {
      "title": "Legal Opinion",
      "description":
      'Its advisable to seek legal counsel to review the documents and ensure a smooth transaction.',
    },
    // Add more expertise...
  ];

  final List<Map<String, String>> reqDocOtherMortage = [
    {
      "title": "Parties",
      "description":
      "Names, addresses, and contact information of the borrower and lender.",
    },
    {
      "title": "Property Description",
      "description": "Detailed description of the property being mortgaged.",
    },
    {
      "title": "Loan Amount",
      "description": 'Amount of the loan being secured by the mortgage.',
    },
    {
      "title": "Interest Rate",
      "description": "Interest rate applicable to the loan.",
    },
    {
      "title": "Repayment Schedule",
      "description":
      "Repayment terms, including the frequency and amount of installments.",
    },
    {
      "title": "Default Clause",
      "description": "Consequences of defaulting on the loan payments.",
    },
    {
      "title": "Foreclosure Clause",
      "description":
      "Provisions for the lender to take possession of the property in case of default.",
    },
    // Add more expertise...
  ];

  final List<Map<String, String>> reqDocMortage = [
    {
      "title": "Proof of Identity",
      "description":
      "Aadhaar card, PAN card, passport, voter ID card, drivers license.",
    },
    {
      "title": "Proof of Address",
      "description":
      "Documents like a voter ID card, drivers license, or utility bills verifying the borrowers residence",
    },
    {
      "title": "Income Proof",
      "description":
      'Documents like salary slips, bank statements, or income tax returns demonstrating the borrowers financial capacity.',
    },
    {
      "title": "Property Documents:Title Deed",
      "description":
      "Title Deed: Proof of the borrowers ownership of the property being mortgaged and Encumbrance Certificate: Verifies that the property is free from any legal or financial encumbrances.",
    },
    {
      "title": "Valuation Report",
      "description": " A professional appraisal of the propertys market value.",
    },
    // Add more expertise...
  ];

  final List<Map<String, String>> leaseAgreement = [
    {
      "title": "Identity and Address Proof",
      "description": " ",
    },
    {
      "title": "Property Documents",
      "description":
      "Encumbrance Certificate- Verifies that the property is free from any legal or financial encumbrances.",
    },
    {
      "title": "Rent Receipts",
      "description": 'Proof of rent payment by the lessee to the lessor.',
    },
    {
      "title": "No Objection Certificate (NOC)",
      "description":
      "If applicable, NOCs from relevant authorities like the residents welfare association or building society.",
    },
    {
      "title": "Legal Opinion",
      "description":
      "It is advisable to seek legal counsel to review the documents and ensure a smooth transaction.",
    },
    // Add more expertise...
  ];

  final List<Map<String, String>> termsConditionsOfLease = [
    {
      "title": "Parties",
      "description":
      "Names, addresses, and contact information of the lessor and lessee.",
    },
    {
      "title": "Property Description",
      "description":
      "Detailed description of the property, including address, size, and amenities.",
    },
    {
      "title": "Lease Term",
      "description": 'Start and end dates of the lease.',
    },
    {
      "title": "Rent Amount",
      "description": "Monthly rent amount and payment schedule.",
    },
    {
      "title": "Security Deposit",
      "description":
      "Amount of the security deposit and conditions for its return.",
    },
    {
      "title": "Maintenance Responsibilities",
      "description":
      "Responsibilities of the lessor and lessee for property maintenance and repairs.",
    },
    {
      "title": "Utilities",
      "description":
      "Responsibilities for payment of utilities like electricity, water, and gas.",
    },
    {
      "title": "Use of Property",
      "description": "Permissible uses of the property and any restrictions.",
    },
    {
      "title": "Termination Clause",
      "description": "Conditions for early termination of the lease.",
    },
    {
      "title": "Dispute Resolution",
      "description": "Procedure for resolving disputes between the parties.",
    },
    // Add more expertise...
  ];

  final List<Map<String, String>> closingDocument = [
    {
      "title": "Closing Disclosure",
      "description":
      " This document provides a detailed breakdown of all the costs associated with the transaction, including loan fees, taxes, and other expenses. It must be provided to the buyer at least three business days before closing.",
    },
    {
      "title": "Deed",
      "description":
      "This legal document transfers ownership of the property from the seller to the buyer. It includes details about the property and the parties involved in the transaction.",
    },
    {
      "title": "Mortgage or Deed of Trust",
      "description":
      ' If the buyer is financing the purchase, this document outlines the terms of the mortgage loan, including the interest rate, repayment schedule, and other important details.',
    },
    {
      "title": "Promissory Note",
      "description":
      "This document serves as a promise to repay the mortgage loan. It includes the loan amount, interest rate, and payment schedule.",
    },
    {
      "title": "Title Insurance Policy",
      "description":
      "This insurance policy protects the buyer and lender from potential title claims or defects.",
    },
    {
      "title": "Settlement Statement",
      "description":
      "This document summarizes the financial aspects of the transaction, including the amount paid by the buyer, the amount received by the seller, and the distribution of funds.",
    },
    // Add more expertise...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: const Text(
            "Estate Legal Services",
            style: TextStyle(color: AppColors.white),
          ),
          backgroundColor: AppColors.appBarColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Lottie.asset(
                  'assets/gks/construction_services/construction_lottie.json',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: services.length,
                itemBuilder: (context, subIndex) {
                  final service = services[subIndex];
                  return serviceCard(
                    context: context,
                    serviceType: 'Estate Legal Services',
                    serviceTypeList: ['Basic', 'Standard', 'Premium', 'Custom'],
                    projectSizeList: ['Small', 'Medium', 'Large'],
                    title: service['title'] ?? '',
                    price: service['price'] ?? '0',
                    description: service['description'] ?? '',
                    imagePath: service['imagePath'] ?? '',
                    serviceDetail: service['serviceDetail'] ?? [],
                    cartController: cartController,
                    onTap: () {
                      // Handle the tap action here
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (context) => Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Enquiry for ${service['title']}",
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Add your enquiry form here
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Process the enquiry
                                },
                                child: const Text("Submit Enquiry"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 16),
              SectionHeader(title: 'Estate Legal Services'),
              const SizedBox(height: 16),
              KeyServicesListWidget(
                  items: wlcmMsg,
                  titleStyle: TextStyle(
                      fontWeight: FontWeight.normal, fontSize: contentTitleSize)),
              const SizedBox(height: 16),
              SectionHeader(title: 'Why Choose Us?'),
              ServiceList(items: whyChooseUs),
              const SizedBox(height: 16),
              SectionHeader(title: 'Contract Drafting and Review:'),
              KeyServicesListWidget(
                  items: contractDraftingReview,
                  titleStyle: TextStyle(
                      fontWeight: FontWeight.normal, fontSize: contentTitleSize)),
              const SizedBox(height: 16),
              SectionHeader(title: 'More Services:'),
              KeyServicesListWidget(
                  items: moreServices,
                  titleStyle: TextStyle(
                      fontWeight: FontWeight.normal, fontSize: contentTitleSize)),
              const SizedBox(height: 16),
              SectionHeader(title: 'Purchase Agreement:'),
              SectionHeader(title: 'Documents Required from the Seller ->'),
              ServiceList(items: reqDocSeller),
              const SizedBox(height: 16),
              SectionHeader(title: 'Documents Required from the Buyer ->'),
              ServiceList(items: reqDocBuyer),
              const SizedBox(height: 16),
              SectionHeader(title: 'Other Important Documents Required ->'),
              ServiceList(items: reqDocOther),
              const SizedBox(height: 16),
              SectionHeader(title: 'Lease Agreement:'),
              ServiceList(items: leaseAgreement),
              const SizedBox(height: 16),
              SectionHeader(
                  title:
                  'The legally binding contract outlining the terms and conditions of the lease, including ->'),
              ServiceList(items: termsConditionsOfLease),
              const SizedBox(height: 16),
              SectionHeader(title: 'Mortage Agreement:'),
              SectionHeader(
                  title:
                  'Documents required For the Mortage Agreement in India ->'),
              ServiceList(items: reqDocMortage),
              const SizedBox(height: 16),
              SectionHeader(title: 'Other Important Documents ->'),
              ServiceList(items: reqDocOtherMortage),
              const SizedBox(height: 16),
              SectionHeader(title: 'Closing Document'),
              ServiceList(items: closingDocument),
              const SizedBox(height: 24),
              // CustomCard(),
            ],
          ),
        ));
  }

  Widget serviceCard({
    required BuildContext context,
    required String title,
    required String description,
    required String imagePath,
    required String price,
    required VoidCallback onTap,
    required String serviceType,
    required List<String> serviceTypeList,
    required List<String> projectSizeList,
    required List<Map<String, dynamic>> serviceDetail,
    required CartController cartController,
  }) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey[100]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Service Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),

            // Service Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 10),
                          backgroundColor: AppColors.appBarColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                        ),
                        icon: const Icon(Icons.add, size: 16),
                        label: const Text(
                          "Enquiry Now",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
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