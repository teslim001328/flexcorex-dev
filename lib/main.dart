import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'themes/app_theme.dart';
import 'providers/theme_provider.dart';
import 'widgets/bottom_nav_bar.dart';
import 'pages/home/home_page.dart';

void main() {
  runApp (
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
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      home: const BottomNavBar(),
    );
  }
}
