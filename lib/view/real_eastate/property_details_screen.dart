// property_details_screen.dart
import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/view/real_eastate/project_managment_details_screen.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';

class PropertyDetailsScreen extends StatefulWidget {
  final Property property;

  const PropertyDetailsScreen({
    Key? key,
    required this.property,
  }) : super(key: key);

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar with property image
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.property.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    widget.property.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.image_not_supported, size: 50),
                      ),
                    ),
                  ),
                  // Gradient overlay for better text visibility
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                        ],
                        stops: [0.7, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // Navigate to edit property screen
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Edit property feature coming soon')),
                  );
                },
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  switch (value) {
                    case 'share':
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Share property feature coming soon')),
                      );
                      break;
                    case 'archive':
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Archive property feature coming soon')),
                      );
                      break;
                    case 'delete':
                      _showDeleteConfirmation(context);
                      break;
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'share',
                    child: Text('Share'),
                  ),
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

          // Status and Address Info
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Property Status
                  Row(
                    children: [
                      _buildStatusChip(widget.property.status),
                      const SizedBox(width: 8),
                      Text(
                        '${widget.property.occupancyRate}% Occupied',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Address and Quick Info
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: AppColors.appBarColor,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          widget.property.address,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Quick Stats Cards
                  Row(
                    children: [
                      _buildStatCard(
                        'Units',
                        widget.property.units.length.toString(),
                        Icons.apartment,
                      ),
                      const SizedBox(width: 8),
                      _buildStatCard(
                        'Rent',
                        '\$${_calculateTotalRent()}',
                        Icons.attach_money,
                      ),
                      const SizedBox(width: 8),
                      _buildStatCard(
                        'Tenants',
                        '${_getOccupiedUnitsCount()}',
                        Icons.people,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Quick Actions
                  Row(
                    children: [
                      Expanded(
                        child: _buildQuickActionButton(
                          icon: Icons.payments_outlined,
                          label: 'Collect Rent',
                          color: AppColors.btnDarkGreen,
                          backgroundColor: AppColors.secondaryBtnLigGreen,
                          onTap: () {
                            Navigator.pushNamed(context, '/collect_rent');
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildQuickActionButton(
                          icon: Icons.build_outlined,
                          label: 'Maintenance',
                          color: Colors.amber[700]!,
                          backgroundColor: const Color(0xFFFFF8E1),
                          onTap: () {
                            Navigator.pushNamed(context, '/maintenance');
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildQuickActionButton(
                          icon: Icons.camera_alt_outlined,
                          label: 'Photos',
                          color: Colors.blue[700]!,
                          backgroundColor: const Color(0xFFE3F2FD),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Photos feature coming soon')),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Tab Bar
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              TabBar(
                controller: _tabController,
                labelColor: AppColors.appBarColor,
                unselectedLabelColor: Colors.grey,
                indicatorColor: AppColors.appBarColor,
                tabs: const [
                  Tab(text: 'Units'),
                  Tab(text: 'Finance'),
                  Tab(text: 'Documents'),
                  Tab(text: 'Activity'),
                ],
              ),
            ),
            pinned: true,
          ),

          // Tab Bar View Content
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Units Tab
                _buildUnitsTab(),

                // Finance Tab
                _buildFinanceTab(),

                // Documents Tab
                _buildDocumentsTab(),

                // Activity Tab
                _buildActivityTab(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add New Unit
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Add new unit feature coming soon')),
          );
        },
        backgroundColor: AppColors.appBarColor,
        child: const Icon(Icons.add),
        tooltip: 'Add New Unit',
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            children: [
              Icon(
                icon,
                color: AppColors.appBarColor,
                size: 22,
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(PropertyStatus status) {
    String label;
    Color color;

    switch (status) {
      case PropertyStatus.occupied:
        label = 'Occupied';
        color = AppTheme.occupiedColor;
        break;
      case PropertyStatus.vacant:
        label = 'Vacant';
        color = AppTheme.vacantColor;
        break;
      case PropertyStatus.maintenance:
        label = 'Maintenance';
        color = AppTheme.maintenanceColor;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Tabs content builders
  Widget _buildUnitsTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.property.units.length,
      itemBuilder: (context, index) {
        final unit = widget.property.units[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: CircleAvatar(
              backgroundColor: _getStatusColor(unit.status).withOpacity(0.2),
              child: Text(
                unit.unitNumber,
                style: TextStyle(
                  color: _getStatusColor(unit.status),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              'Unit ${unit.unitNumber}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  unit.tenantName != null ? 'Tenant: ${unit.tenantName}' : 'No tenant',
                  style: TextStyle(
                    color: unit.tenantName != null ? Colors.black87 : Colors.grey,
                  ),
                ),
                Text(
                  'Rent: \$${unit.rent.toStringAsFixed(0)}/month',
                ),
              ],
            ),
            trailing: PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                switch (value) {
                  case 'details':
                  // Navigate to unit details
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Unit details coming soon')),
                    );
                    break;
                  case 'edit':
                  // Edit unit
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Edit unit coming soon')),
                    );
                    break;
                  case 'tenant':
                  // Manage tenant
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Manage tenant coming soon')),
                    );
                    break;
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'details',
                  child: Text('View Details'),
                ),
                const PopupMenuItem(
                  value: 'edit',
                  child: Text('Edit Unit'),
                ),
                const PopupMenuItem(
                  value: 'tenant',
                  child: Text('Manage Tenant'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFinanceTab() {
    // Placeholder for Finance tab
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.insert_chart_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          const Text(
            'Financial insights coming soon',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentsTab() {
    // Placeholder for Documents tab
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.folder_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          const Text(
            'Documents management coming soon',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityTab() {
    // Placeholder for Activity tab
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          const Text(
            'Activity history coming soon',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // Helper methods
  double _calculateTotalRent() {
    return widget.property.units.fold(0, (sum, unit) => sum + unit.rent);
  }

  int _getOccupiedUnitsCount() {
    return widget.property.units
        .where((unit) => unit.status == PropertyStatus.occupied)
        .length;
  }

  Color _getStatusColor(PropertyStatus status) {
    switch (status) {
      case PropertyStatus.occupied:
        return AppTheme.occupiedColor;
      case PropertyStatus.vacant:
        return AppTheme.vacantColor;
      case PropertyStatus.maintenance:
        return AppTheme.maintenanceColor;
    }
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Property'),
          content: Text('Are you sure you want to delete ${widget.property.name}? This action cannot be undone.'),
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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Delete property feature coming soon')),
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

// SliverAppBarDelegate for the TabBar
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}