import 'package:flutter/material.dart';
import 'package:flexcorex/widgets/meal_card.dart';

class MealPlanningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Planning'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            MealCard(
              name: 'Grilled Salmon with Quinoa',
              calories: '450',
              description: 'Healthy and delicious meal rich in omega-3 fatty acids.',
              image: 'https://picsum.photos/200/150',
            ),
            SizedBox(height: 10),
            MealCard(
              name: 'Chicken Breast with Roasted Vegetables',
              calories: '380',
              description: 'Lean protein source with fiber-rich vegetables.',
              image: 'https://picsum.photos/201/150',
            ),
            SizedBox(height: 10),
            MealCard(
              name: 'Tofu Stir-Fry',
              calories: '320',
              description: 'Vegetarian meal with plant-based protein and essential nutrients.',
              image: 'https://picsum.photos/202/150',
            ),
          ],
        ),
      ),
    );
  }
}
