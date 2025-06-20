import 'package:flutter/material.dart';


// lib/models/floor_plan.dart
class FloorPlan {
  final String type;
  final double area;
  final int beds;
  final double price;
  final String imageUrl;

  FloorPlan({
    required this.type,
    required this.area,
    required this.price,
    required this.beds,
    required this.imageUrl,
  });
}

// lib/widgets/floor_plan_card.dart

class FloorPlanCard extends StatelessWidget {
  final FloorPlan plan;
  final VoidCallback onVirtualTour;
  final VoidCallback onContact;

  const FloorPlanCard({
    Key? key,
    required this.plan,
    required this.onVirtualTour,
    required this.onContact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;

        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Floor Plan Image
                    Expanded(
                      flex: isSmallScreen ? 1 : 2,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          plan.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Details
                    Expanded(
                      flex: isSmallScreen ? 2 : 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${plan.type} ${plan.area} Sq. Ft.',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Apartment',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${plan.beds} Bed',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '₹ ${plan.price} Lac',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ActionButton(
                      onPressed: onContact,
                      label: 'Contact',
                      icon: Icons.phone,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

// lib/widgets/action_button.dart
class ActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;

  const ActionButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: onPressed,
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: textColor),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}

// lib/widgets/floor_plan_type_selector.dart
class FloorPlanTypeSelector extends StatelessWidget {
  final List<String> types;
  final String selectedType;
  final ValueChanged<String> onTypeSelected;

  const FloorPlanTypeSelector({
    Key? key,
    required this.types,
    required this.selectedType,
    required this.onTypeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: types.map((type) {
          final isSelected = type == selectedType;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(type),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) onTypeSelected(type);
              },
              backgroundColor: Colors.white,
              selectedColor: Colors.black,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}