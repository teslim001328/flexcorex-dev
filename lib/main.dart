import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'themes/app_theme.dart';
import 'providers/theme_provider.dart';
import 'utils/constants.dart';
import 'widgets/bottom_nav_bar.dart';
import 'pages/home/home_page.dart';
import 'pages/meals/meal_planning_page.dart';
import 'pages/workouts/workout_plans_page.dart';
import 'pages/progress/progress_tracking_page.dart';
import 'pages/community/community_page.dart';
import 'pages/settings/settings_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const FlexcorexApp(),
    ),
  );
}

class FlexcorexApp extends StatelessWidget {
  const FlexcorexApp({super.key});

  @override
  Widget build(BuildContext context) {    
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
        title: AppConstants.appName,
        theme: themeProvider.currentTheme,
        home: const BottomNavBar(),
        routes: {
          '/home': (context) => const HomePage(),
          '/meals': (context) => const MealPlanningPage(),
          '/workouts': (context) => const WorkoutPlansPage(),
          '/progress': (context) => const ProgressTrackingPage(),
          '/community': (context) => const CommunityPage(),
          '/settings': (context) => const SettingsPage(),
        },
      );
    }
}
