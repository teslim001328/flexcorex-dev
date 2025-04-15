import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).cardColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          IconButton(
            icon: Icon(Icons.restaurant_menu),
            onPressed: () {
              Navigator.pushNamed(context, '/meals');
            },
          ),
          IconButton(
            icon: Icon(Icons.fitness_center),
            onPressed: () {
              Navigator.pushNamed(context, '/workouts');
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: FloatingActionButton(
              backgroundColor: Colors.amber,
              child: Icon(Icons.android),
              onPressed: () {
                Navigator.pushNamed(context, '/flexai');
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.show_chart),
            onPressed: () {
              Navigator.pushNamed(context, '/progress');
            },
          ),
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () {
              Navigator.pushNamed(context, '/community');
            },
          ),
        ],
      ),
    );
  }
}
