import 'package:flutter/material.dart';
import 'package:flexcorex/themes/app_theme.dart';

class ProgressTrackingPage extends StatefulWidget {
  const ProgressTrackingPage({super.key});

  @override
  State<ProgressTrackingPage> createState() => _ProgressTrackingPageState();
}

class _ProgressTrackingPageState extends State<ProgressTrackingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors(context).background,
      body: Center(
        child: Text(
          'Progress Tracking Page',
          style: AppTheme.textTheme(context).bodyLarge,
        ),
      ),
    );
  }
}