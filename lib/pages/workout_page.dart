import 'package:flutter/material.dart';
import 'package:flexcorex/widgets/workout_card.dart';

class WorkoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workouts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            WorkoutCard(
              name: 'Full Body Strength Training',
              duration: '60 minutes',
              intensity: 'High',
              muscleGroups: ['Chest', 'Back', 'Legs', 'Shoulders', 'Arms'],
            ),
            SizedBox(height: 10),
            WorkoutCard(
              name: 'Cardio Blast',
              duration: '45 minutes',
              intensity: 'Medium',
              muscleGroups: ['Heart', 'Lungs'],
            ),
            SizedBox(height: 10),
            WorkoutCard(
              name: 'Yoga Flow',
              duration: '30 minutes',
              intensity: 'Low',
              muscleGroups: ['Core', 'Flexibility'],
            ),
          ],
        ),
      ),
    );
  }
}
