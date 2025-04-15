import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  WorkoutCard({
    required this.name,
    required this.duration,
    required this.intensity,
    required this.muscleGroups,
  });
  final String name;
  final String duration;
  final String intensity;
  final List<String> muscleGroups;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('Duration: $duration', style: TextStyle(fontSize: 14)),
            Text('Intensity: $intensity', style: TextStyle(fontSize: 14)),
            Text('Muscle Groups: ${muscleGroups.join(', ')}', style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
