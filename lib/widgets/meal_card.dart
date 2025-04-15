import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  MealCard({
    required this.name,
    required this.calories,
    required this.description,
    required this.image,
  });
  final String name;
  final String calories;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(description, style: TextStyle(fontSize: 14)),
            Text('Calories: $calories', style: TextStyle(fontSize: 12)),
            ElevatedButton(
              onPressed: () {},
              child: Text('How to Cook'),
            ),
          ],
        ),
      ),
    );
  }
}
