// quick_actions_screen.dart
import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class QuickActionsScreen extends StatelessWidget {
  const QuickActionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of all quick actions
    final List<Map<String, dynamic>> allQuickActions = [
      {
        'icon': Icons.add,
        'label': 'Add Property',
        'backgroundColor': AppColors.secondaryBtnLigRed,
        'iconColor': AppColors.btnDarkRed,
        'route': '/add_property',
      },
      {
        'icon': Icons.payments_outlined,
        'label': 'Collect Rent',
        'backgroundColor': AppColors.secondaryBtnLigGreen,
        'iconColor': AppColors.btnDarkGreen,
        'route': '/collect_rent',
      },
      {
        'icon': Icons.build_outlined,
        'label': 'Maintenance',
        'backgroundColor': Color(0xFFFFF8E1),
        'iconColor': Colors.amber[700]!,
        'route': '/maintenance',
      },
      {
        'icon': Icons.description_outlined,
        'label': 'Documents',
        'backgroundColor': Color(0xFFE3F2FD),
        'iconColor': Colors.blue[700]!,
        'route': '/documents',
      },
      {
        'icon': Icons.people_outline,
        'label': 'Add Tenant',
        'backgroundColor': Color(0xFFE8F5E9),
        'iconColor': Colors.green[700]!,
        'route': '/tenants',
      },
      // {
      //   'icon': Icons.monetization_on_outlined,
      //   'label': 'Expenses',
      //   'backgroundColor': Color(0xFFEDE7F6),
      //   'iconColor': Colors.deepPurple[700]!,
      //   'route': '/expenses',
      // },
      // {
      //   'icon': Icons.calendar_today_outlined,
      //   'label': 'Schedule Visits',
      //   'backgroundColor': Color(0xFFFCE4EC),
      //   'iconColor': Colors.pink[700]!,
      //   'route': '/schedule',
      // },
      // {
      //   'icon': Icons.analytics_outlined,
      //   'label': 'Reports',
      //   'backgroundColor': Color(0xFFE0F2F1),
      //   'iconColor': Colors.teal[700]!,
      //   'route': '/reports',
      // },
      // {
      //   'icon': Icons.camera_alt_outlined,
      //   'label': 'Property Photos',
      //   'backgroundColor': Color(0xFFFFFDE7),
      //   'iconColor': Colors.yellow[800]!,
      //   'route': '/photos',
      // },
      // {
      //   'icon': Icons.person_search_outlined,
      //   'label': 'Tenant Screening',
      //   'backgroundColor': Color(0xFFE8EAF6),
      //   'iconColor': Colors.indigo[700]!,
      //   'route': '/screening',
      // },
      // {
      //   'icon': Icons.handshake_outlined,
      //   'label': 'Lease Agreements',
      //   'backgroundColor': Color(0xFFF3E5F5),
      //   'iconColor': Colors.purple[700]!,
      //   'route': '/lease',
      // },
      // {
      //   'icon': Icons.support_agent_outlined,
      //   'label': 'Support',
      //   'backgroundColor': Color(0xFFFFEBEE),
      //   'iconColor': Colors.red[700]!,
      //   'route': '/support',
      // },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Actions'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'All Quick Actions',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Access all property management features quickly',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemCount: allQuickActions.length,
                itemBuilder: (context, index) {
                  final action = allQuickActions[index];
                  return _buildQuickActionItem(
                    context,
                    icon: action['icon'],
                    label: action['label'],
                    backgroundColor: action['backgroundColor'],
                    iconColor: action['iconColor'],
                    route: action['route'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionItem(
      BuildContext context, {
        required IconData icon,
        required String label,
        required Color backgroundColor,
        required Color iconColor,
        required String route,
      }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          try {
            Navigator.pushNamed(context, route);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$label coming soon')),
            );
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}