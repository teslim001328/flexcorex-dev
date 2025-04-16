import 'package:flutter/material.dart';
import 'package:flexcorex/themes/colors.dart';

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
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: AppColors.matteBlack.withOpacity(0.2),
                blurRadius: 8.0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: constraints.maxWidth * 0.15,
                color: AppColors.platinumSilver,
              ),
              const SizedBox(height: 8.0),
              Text(
                title,
                style: TextStyle(fontSize: constraints.maxWidth * 0.06, color: AppColors.platinumSilver),
              ),
              Text(value, style: TextStyle(fontSize: constraints.maxWidth * 0.08, fontWeight: FontWeight.bold, color: AppColors.champagneGold)),
            ],
          ),
        ),
      
    );
  }
}
