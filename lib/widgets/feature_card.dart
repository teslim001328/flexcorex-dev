import 'package:flutter/material.dart';

// A reusable widget for feature cards with an icon, title, and description.
class FeatureCard extends StatelessWidget {
  const FeatureCard({
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
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              // Apply rounded corners to the card
              borderRadius: BorderRadius.circular(12),
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
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, size: 32, color: Theme.of(context).colorScheme.onPrimary),
                const SizedBox(height: 8),
                Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                Text(description, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8))),
              ],
            ),
          ),
        );
      },
    );
  }
}
