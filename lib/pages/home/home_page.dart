import 'package:flutter/material.dart';
import 'package:flexcorex/utils/constants.dart';
import 'package:flexcorex/widgets/feature_card.dart';
import 'package:flexcorex/widgets/stat_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Mock data for feature cards
  final List<Map<String, String>> featureCardsData = [
    {
      'title': 'Meal Planning',
      'description': 'Plan your meals for the week',
      'icon': Icons.restaurant_menu.codePoint.toString(),
    },
    {
      'title': 'Today\'s Workout',
      'description': 'Your personalized workout for today',
      'icon': Icons.fitness_center.codePoint.toString(),
    },
    {
      'title': 'Progress Tracker',
      'description': 'Track your fitness journey',
      'icon': Icons.show_chart.codePoint.toString(),
    },
  ];

  // Mock data for stat cards
  final List<Map<String, String>> statCardsData = [
    {
      'title': 'Steps',
      'value': '10,000',
      'icon': Icons.directions_walk.codePoint.toString(),
    },
    {
      'title': 'Calories',
      'value': '2,000',
      'icon': Icons.local_fire_department.codePoint.toString(),
    },
    {
      'title': 'Water',
      'value': '8 glasses',
      'icon': Icons.water_drop.codePoint.toString(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome text
            Text(
              'Welcome back, User!', // Replace 'User' with actual user name
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              AppConstants.appSlogan,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),

            // Feature cards
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: featureCardsData.length,
                itemBuilder: (context, index) {
                  final card = featureCardsData[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: FeatureCard(
                      title: card['title']!,
                      description: card['description']!,
                      icon: IconData(int.parse(card['icon']!), fontFamily: 'MaterialIcons'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Today's overview
            Text('Today\'s Overview', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: statCardsData.length,
              itemBuilder: (context, index) {
                final card = statCardsData[index];
                return StatCard(
                  title: card['title']!,
                  value: card['value']!,
                  icon: IconData(int.parse(card['icon']!), fontFamily: 'MaterialIcons'),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}