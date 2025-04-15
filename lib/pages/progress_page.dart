import 'package:flutter/material.dart';
import 'package:flexcorex/widgets/progress_chart.dart';

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weight Progress',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ProgressChart(),
            SizedBox(height: 20),
            Text(
              'Daily Stats',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatCard('Weight', '75 kg'),
                _buildStatCard('Calories', '1,900'),
                _buildStatCard('Water', '3L'),
                _buildStatCard('Sleep', '7.5h'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Achievements',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildAchievementCard('First Workout', 'Completed your first workout!'),
                  SizedBox(width: 10),
                  _buildAchievementCard('Healthy Eating', 'Maintained a balanced diet for 7 days!'),
                  SizedBox(width: 10),
                  _buildAchievementCard('Hydration Hero', 'Drank 3L of water every day for a week!'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontSize: 16)),
            Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementCard(String title, String description) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(description, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
