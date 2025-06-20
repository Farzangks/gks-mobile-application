// activity_details_screen.dart
import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/view/real_eastate/project_managment_details_screen.dart';
import 'package:intl/intl.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class ActivityDetailsScreen extends StatelessWidget {
  final Activity activity;

  const ActivityDetailsScreen({
    Key? key,
    required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Share functionality coming soon')),
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              switch (value) {
                case 'archive':
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Archive functionality coming soon')),
                  );
                  break;
                case 'delete':
                  _showDeleteConfirmationDialog(context);
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'archive',
                child: Text('Archive'),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Text('Delete'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Activity Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: _getActivityColor(activity.type).withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        _getActivityIcon(activity.type),
                        color: _getActivityColor(activity.type),
                        size: 40,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    activity.description,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _formatDateAndTime(activity.timestamp),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getActivityColor(activity.type).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      _getActivityTypeString(activity.type),
                      style: TextStyle(
                        color: _getActivityColor(activity.type),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Property Information
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Property Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    title: 'Property',
                    value: activity.propertyName,
                    icon: Icons.apartment,
                    color: AppColors.appBarColor,
                    onTap: () {
                      // Navigate to property details
                      // This would typically fetch the property details and navigate
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Navigation to property details coming soon')),
                      );
                    },
                  ),
                  if (activity.unitNumber != null)
                    _buildInfoCard(
                      title: 'Unit',
                      value: activity.unitNumber!,
                      icon: Icons.door_front_door_outlined,
                      color: Colors.blue[700]!,
                      onTap: () {
                        // Navigate to unit details
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Navigation to unit details coming soon')),
                        );
                      },
                    ),
                ],
              ),
            ),

            // Activity Details section - will vary by activity type
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Activity Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // These details would typically come from extended activity data
                  // For demo purposes, we're creating sample content based on activity type
                  ...(_buildActivitySpecificDetails(activity.type)),
                ],
              ),
            ),

            // Related Documents (if applicable)
            if (activity.type == ActivityType.rentCollected || activity.type == ActivityType.newTenant)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Related Documents',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildDocumentItem(
                      title: activity.type == ActivityType.rentCollected
                          ? 'Receipt'
                          : 'Lease Agreement',
                      type: 'PDF',
                      size: '245 KB',
                      date: activity.timestamp,
                    ),
                  ],
                ),
              ),

            // Comments/Notes Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey[300]!,
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      'No notes added yet.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Add note functionality coming soon')),
                      );
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Note'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.appBarColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                  ),
                ],
              ),
            ),

            // Follow-up Actions Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Follow-up Actions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildFollowUpActions(context, activity.type),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Helper methods
  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDocumentItem({
    required String title,
    required String type,
    required String size,
    required DateTime date,
  }) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.red[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              type,
              style: TextStyle(
                color: Colors.red[700],
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '${size} • ${DateFormat('MMM d, yyyy').format(date)}',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.download_outlined),
              onPressed: () {},
              color: Colors.grey[600],
              iconSize: 20,
            ),
            IconButton(
              icon: const Icon(Icons.visibility_outlined),
              onPressed: () {},
              color: Colors.grey[600],
              iconSize: 20,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildActivitySpecificDetails(ActivityType type) {
    switch (type) {
      case ActivityType.rentCollected:
        return [
          _buildDetailItem(
            title: 'Amount Collected',
            value: '\$1,200.00',
            icon: Icons.monetization_on_outlined,
          ),
          _buildDetailItem(
            title: 'Payment Method',
            value: 'Bank Transfer',
            icon: Icons.account_balance_outlined,
          ),
          _buildDetailItem(
            title: 'Payment Date',
            value: DateFormat('MMM d, yyyy').format(activity.timestamp),
            icon: Icons.calendar_today_outlined,
          ),
          _buildDetailItem(
            title: 'Transaction ID',
            value: 'TRX-${1000 + activity.timestamp.millisecond}',
            icon: Icons.receipt_long_outlined,
          ),
        ];
      case ActivityType.maintenanceRequest:
        return [
          _buildDetailItem(
            title: 'Request Type',
            value: 'Plumbing Issue',
            icon: Icons.plumbing_outlined,
          ),
          _buildDetailItem(
            title: 'Priority',
            value: 'Medium',
            icon: Icons.flag_outlined,
          ),
          _buildDetailItem(
            title: 'Status',
            value: 'Pending',
            icon: Icons.pending_actions_outlined,
          ),
          _buildDetailItem(
            title: 'Estimated Cost',
            value: '\$150 - \$300',
            icon: Icons.monetization_on_outlined,
          ),
        ];
      case ActivityType.newTenant:
        return [
          _buildDetailItem(
            title: 'Tenant Name',
            value: 'Sarah Johnson',
            icon: Icons.person_outline,
          ),
          _buildDetailItem(
            title: 'Lease Start',
            value: DateFormat('MMM d, yyyy').format(activity.timestamp),
            icon: Icons.calendar_today_outlined,
          ),
          _buildDetailItem(
            title: 'Lease Duration',
            value: '12 months',
            icon: Icons.timelapse_outlined,
          ),
          _buildDetailItem(
            title: 'Monthly Rent',
            value: '\$1,200.00',
            icon: Icons.monetization_on_outlined,
          ),
        ];
      default:
        return [
          _buildDetailItem(
            title: 'No details available',
            value: 'Additional information will be shown here',
            icon: Icons.info_outline,
          ),
        ];
    }
  }

  Widget _buildDetailItem({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.grey[600],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFollowUpActions(BuildContext context, ActivityType type) {
    switch (type) {
      case ActivityType.rentCollected:
        return Row(
          children: [
            Expanded(
              child: _buildActionButton(
                icon: Icons.receipt_long_outlined,
                label: 'Send Receipt',
                color: Colors.blue[700]!,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Send receipt functionality coming soon')),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildActionButton(
                icon: Icons.history,
                label: 'Payment History',
                color: Colors.purple[700]!,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Payment history functionality coming soon')),
                  );
                },
              ),
            ),
          ],
        );
      case ActivityType.maintenanceRequest:
        return Row(
          children: [
            Expanded(
              child: _buildActionButton(
                icon: Icons.person_add_outlined,
                label: 'Assign Vendor',
                color: Colors.orange[700]!,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Assign vendor functionality coming soon')),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildActionButton(
                icon: Icons.check_circle_outline,
                label: 'Mark Complete',
                color: Colors.green[700]!,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Mark complete functionality coming soon')),
                  );
                },
              ),
            ),
          ],
        );
      case ActivityType.newTenant:
        return Row(
          children: [
            Expanded(
              child: _buildActionButton(
                icon: Icons.contact_mail_outlined,
                label: 'View Tenant',
                color: Colors.indigo[700]!,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('View tenant functionality coming soon')),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildActionButton(
                icon: Icons.inventory_2_outlined,
                label: 'Inventory',
                color: Colors.teal[700]!,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Inventory functionality coming soon')),
                  );
                },
              ),
            ),
          ],
        );
      default:
        return const Center(
          child: Text('No follow-up actions available'),
        );
    }
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.1),
        foregroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: color.withOpacity(0.3)),
        ),
      ),
    );
  }

  // Helper methods for activity type, icon, and color
  IconData _getActivityIcon(ActivityType type) {
    switch (type) {
      case ActivityType.rentCollected:
        return Icons.payments_outlined;
      case ActivityType.maintenanceRequest:
        return Icons.build_outlined;
      case ActivityType.newTenant:
        return Icons.person_add_outlined;
    }
  }

  Color _getActivityColor(ActivityType type) {
    switch (type) {
      case ActivityType.rentCollected:
        return Colors.green[700]!;
      case ActivityType.maintenanceRequest:
        return Colors.amber[700]!;
      case ActivityType.newTenant:
        return Colors.red[700]!;
    }
  }

  String _getActivityTypeString(ActivityType type) {
    switch (type) {
      case ActivityType.rentCollected:
        return 'RENT PAYMENT';
      case ActivityType.maintenanceRequest:
        return 'MAINTENANCE';
      case ActivityType.newTenant:
        return 'NEW TENANT';
    }
  }

  String _formatDateAndTime(DateTime dateTime) {
    return DateFormat('EEEE, MMMM d, yyyy • h:mm a').format(dateTime);
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Activity Record'),
          content: const Text(
              'Are you sure you want to delete this activity? This action cannot be undone.'
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Return to previous screen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Activity deleted')),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text('DELETE'),
            ),
          ],
        );
      },
    );
  }
}