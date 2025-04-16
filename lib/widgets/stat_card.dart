import 'package:flutter/material.dart';
import 'package:flexcorex/themes/colors.dart'; // Assuming this is where your colors are defined

class StatCard extends StatelessWidget {
  StatCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.matteBlack.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.matteBlack.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: constraints.maxWidth * 0.2,
                color: AppColors.platinumSilver,
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.champagneGold,
                ),
              ),
              Text(
                title,
                style: TextStyle(fontSize: constraints.maxWidth * 0.05, color: AppColors.platinumSilver),
              ),
            ],
          ),
        );
      },
    );
  }
}
