import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  FeatureCard({required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(description),
          ],
        ),
      ),
    );
  }
}
