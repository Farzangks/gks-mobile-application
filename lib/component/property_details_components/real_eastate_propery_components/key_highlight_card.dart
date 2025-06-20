// lib/widgets/property_card.dart
import 'package:flutter/material.dart';
import 'highlight_chip.dart';

class PropertyCard extends StatelessWidget {
  final String title;
  final String location;
  final String description;
  final List<String> highlights;
  final VoidCallback? onSeeMore;

  const PropertyCard({
    Key? key,
    required this.title,
    required this.location,
    required this.description,
    required this.highlights,
    this.onSeeMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            const Text(
              'Key Highlights',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Highlights Wrap
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: highlights
                  .map((highlight) => HighlightChip(label: highlight))
                  .toList(),
            ),
            const SizedBox(height: 24),

            // Property Description
            Text(
              '$title in $location',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),

            // Location Description
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // See More Button
            InkWell(
              onTap: onSeeMore,
              child: const Text(
                'See More',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
