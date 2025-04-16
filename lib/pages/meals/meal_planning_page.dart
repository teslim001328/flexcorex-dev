import 'package:flutter/material.dart';
import 'package:flexcorex/widgets/meal_card.dart';

class MealPlanningPage extends StatefulWidget {
  const MealPlanningPage({super.key});

  @override
  State<MealPlanningPage> createState() => _MealPlanningPageState();
}

class _MealPlanningPageState extends State<MealPlanningPage> {
  final List<Map<String, dynamic>> meals = [
    {
      'name': 'Mediterranean Quinoa Salad',
      'calories': 450,
      'image': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'tags': ['Vegetarian', 'Healthy'],
      'instructions': '1. Cook quinoa. 2. Chop vegetables. 3. Mix with dressing.',
    },
    {
      'name': 'Grilled Salmon with Asparagus',
      'calories': 600,
      'image': 'https://images.unsplash.com/photo-1622543545338-41fda57bf0fa?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'tags': ['Paleo', 'High Protein'],
      'instructions': '1. Grill salmon. 2. Roast asparagus. 3. Season to taste.',
    },
    {
      'name': 'Chicken Stir-Fry',
      'calories': 550,
      'image': 'https://images.unsplash.com/photo-1547493968-3977c3670779?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'tags': ['Quick', 'Balanced'],
      'instructions': '1. Stir-fry chicken and vegetables. 2. Add sauce. 3. Serve over rice.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Planning'),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return MealCard(
            name: meal['name'],
            calories: meal['calories'],
            image: meal['image'],
            tags: meal['tags'],
            instructions: meal['instructions'],
          );
        },
      ),
    );
  }
}