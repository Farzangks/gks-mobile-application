import 'package:flutter/material.dart';

class BrochureWidget extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onShare;
  final VoidCallback onDownload;

  const BrochureWidget({
    required this.imageUrl,
    required this.onShare,
    required this.onDownload,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Using Container with fixed height instead of Expanded
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Brochure',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 200, // Set an appropriate height
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  icon: Icons.share,
                  label: "Share",
                  color: Colors.white,
                  textColor: Colors.black,
                  onPressed: onShare,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomButton(
                  icon: Icons.download,
                  label: "Download",
                  color: Colors.black,
                  textColor: Colors.white,
                  onPressed: onDownload,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  const CustomButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.textColor,
    required this.onPressed,
    super.key, // Added key parameter
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: textColor),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(color: textColor, fontSize: 16)),
        ],
      ),
    );
  }
}