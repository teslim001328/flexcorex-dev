import 'package:flutter/material.dart';
import 'package:flexcorex/widgets/workout_card.dart';
import 'package:flexcorex/themes/colors.dart';

class WorkoutPlansPage extends StatefulWidget {
  const WorkoutPlansPage({Key? key}) : super(key: key);

  @override
  State<WorkoutPlansPage> createState() => _WorkoutPlansPageState();
}

class _WorkoutPlansPageState extends State<WorkoutPlansPage> {
  String? _selectedFilter;

  final List<Map<String, dynamic>> _workoutPlans = [
    {
      'name': 'Quick Home Circuit',
      'duration': '30 min',
      'intensity': 'Beginner',
      'targetMuscles': ['Full Body'],
      'filter': 'Home',
    },
    {
      'name': 'Leg Day at the Gym',
      'duration': '60 min',
      'intensity': 'Intermediate',
      'targetMuscles': ['Legs', 'Glutes'],
      'filter': 'Gym',
    },
    {
      'name': 'Core and Cardio',
      'duration': '45 min',
      'intensity': 'Intermediate',
      'targetMuscles': ['Core', 'Cardio'],
      'filter': 'Home',
    },
    {
      'name': 'Upper Body Strength',
      'duration': '50 min',
      'intensity': 'Advanced',
      'targetMuscles': ['Arms', 'Chest', 'Back'],
      'filter': 'Gym',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredPlans = _selectedFilter == null
        ? _workoutPlans
        : _workoutPlans.where((plan) => plan['filter'] == _selectedFilter).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 8.0,
            children: ['Home', 'Gym'].map((filter) => ChoiceChip(
              label: Text(filter),
              selected: _selectedFilter == filter,
              onSelected: (selected) {
                setState(() {
                  _selectedFilter = selected ? filter : null;
                });
              },
              selectedColor: AppColors.mutedRoseGold,
            )).toList(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredPlans.length,
            itemBuilder: (context, index) => WorkoutCard(workout: filteredPlans[index]),
          ),
        ),
      ],
    );
  }
}