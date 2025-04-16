import 'package:flutter/material.dart';
import 'package:flexcorex/themes/colors.dart';

// A reusable widget for feature cards with an icon, title, and description.
class FeatureCard extends StatelessWidget {
  FeatureCard({
    required this.title,
    required this.description,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String description;
  final IconData icon;
  final VoidCallback? onTap;

  // Builds the UI for the FeatureCard widget.
  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder to make the card responsive
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine card width based on available width
        double cardWidth = constraints.maxWidth > 400 ? 300 : constraints.maxWidth * 0.7;

        return GestureDetector(
          onTap: onTap,
          child: Container(
            // Set the width of the card
            width: cardWidth,
            // Add margin around the card
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              // Apply rounded corners to the card
              borderRadius: BorderRadius.circular(15),
              // Add a subtle gradient background
              gradient: LinearGradient(
                colors: [
                  AppColors.deepTeal.withOpacity(0.8),
                  AppColors.darkEmeraldGreen.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              // Add a soft shadow to the card
              boxShadow: [
                BoxShadow(
                  color: AppColors.matteBlack.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: AppColors.platinumSilver),
                const SizedBox(height: 10),
                Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.platinumSilver)),
                const SizedBox(height: 5),
                Text(description, style: TextStyle(color: AppColors.platinumSilver.withOpacity(0.9)), textAlign: TextAlign.center, padding: const EdgeInsets.symmetric(horizontal: 10)),
              ],
            ),
          ),
        );
      },
    );
  }
}
