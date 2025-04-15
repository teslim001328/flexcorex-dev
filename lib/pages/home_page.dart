import 'package:flutter/material.dart';
import 'package:flexcorex/widgets/feature_card.dart';
import 'package:flexcorex/widgets/stat_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flexcorex'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back, [User\'s Name]!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FeatureCard(
                    title: 'Meal Planning',
                    description: 'Plan your meals for the week.',
                  ),
                  SizedBox(width: 10),
                  FeatureCard(
                    title: 'Today\'s Workout',
                    description: 'View your personalized workout.',
                  ),
                  SizedBox(width: 10),
                  FeatureCard(
                    title: 'Track Progress',
                    description: 'Monitor your fitness journey.',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Today\'s Overview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StatCard(title: 'Steps Taken', value: '5,234'),
                StatCard(title: 'Calories Burned', value: '1,872'),
                StatCard(title: 'Water Intake', value: '2.5L'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
