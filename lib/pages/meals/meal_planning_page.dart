import 'package:flutter/material.dart';

class MealPlanningPage extends StatefulWidget {
  const MealPlanningPage({super.key});

  @override
  State<MealPlanningPage> createState() => _MealPlanningPageState();
}

class MealCard extends StatelessWidget {
  final String name;
  final String calories;
  final String image;
  final List<String> tags;
  final String instructions;

  const MealCard({
    super.key,
    required this.name,
    required this.calories,
    required this.image,
    required this.tags,
    required this.instructions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.local_fire_department, color: Colors.orange),
                    const SizedBox(width: 4),
                    Text('$calories'),
                    const SizedBox(width: 16),
                    ...tags.map((tag) => Chip(label: Text(tag))).toList(),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Instructions:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(instructions),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _MealPlanningPageState extends State<MealPlanningPage> {
  final List<Map<String, dynamic>> meals = [
    {
      'name': 'Mediterranean Quinoa Salad',
      'calories': '450 kcal',
      'image': 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with actual image URL
      'tags': ['Vegetarian', 'Healthy'],
      'instructions': '1. Cook quinoa. 2. Chop vegetables. 3. Mix with dressing.',
    },
    {
      'name': 'Grilled Salmon with Asparagus',
      'calories': '600 kcal',
      'image': 'https://images.unsplash.com/photo-1622543545338-41fda57bf0fa?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with actual image URL
      'tags': ['Paleo', 'High Protein'],
      'instructions': '1. Grill salmon. 2. Roast asparagus. 3. Season to taste.',
    },
    {
      'name': 'Chicken Stir-Fry',
      'calories': '550 kcal',
      'image': 'https://images.unsplash.com/photo-1547493968-3977c3670779?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Replace with actual image URL
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Personalized Meal Plan',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  final meal = meals[index];
                  return MealCard(
                    name: meal['name'],
                    calories: meal['calories'],
                    image: meal['image'],
                    tags: List<String>.from(meal['tags']),
                    instructions: meal['instructions'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}