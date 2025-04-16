import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';
import '../../utils/constants.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.lightTheme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Community'),
        ),
        backgroundColor: AppColors.background,
        body: const Center(
          child: Text('Community Page'),
        ),
      ),
    );
  }
}