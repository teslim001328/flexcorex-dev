import 'package:flutter/material.dart';
import 'package:flexcorex/pages/home_page.dart';
import 'package:flexcorex/pages/flexai_page.dart';
import 'package:flexcorex/pages/meal_planning_page.dart';
import 'package:flexcorex/pages/workout_page.dart';
import 'package:flexcorex/pages/progress_page.dart';
import 'package:flexcorex/pages/community_page.dart';
import 'package:flexcorex/pages/onboarding_page.dart';
import 'package:flexcorex/themes/app_theme.dart';
import 'package:flexcorex/widgets/bottom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexcorex',
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/flexai': (context) => FlexAIPage(),
        '/meals': (context) => MealPlanningPage(),
        '/workouts': (context) => WorkoutPage(),
        '/progress': (context) => ProgressPage(),
        '/community': (context) => CommunityPage(),
        '/onboarding': (context) => OnboardingPage(),
      },
      home: RootPage(), // Use RootPage to include BottomNavBar
    );
  }
}

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(), // Default to HomePage, can be changed based on needs
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
