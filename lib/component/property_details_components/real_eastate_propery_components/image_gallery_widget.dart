import 'package:flutter/material.dart';

class ImageGalleryWidget extends StatelessWidget {
  final List<String> images;

  const ImageGalleryWidget({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const SizedBox.shrink();
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          // First image taking 90% of screen width
          if (images.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    images[0],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

          // Remaining images in groups of three
          if (images.length > 1)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: _buildRemainingImages(context),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildRemainingImages(BuildContext context) {
    // Skip the first image as it's already displayed
    final remainingImages = images.skip(1).toList();
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = (screenWidth - 32) / 3; // Account for padding and spacing

    return remainingImages.map((imageUrl) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: SizedBox(
          width: imageWidth,
          height: imageWidth, // Make it square
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList();
  }
}