import 'package:flutter/material.dart';
import 'package:flexcorex/themes/app_theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = true; // Default to dark mode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dark Mode',
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: _isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      _isDarkMode = value;
                      // TODO: Implement theme change and save to preferences
                    });
                  },
                  activeColor: AppTheme.accentColor,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Placeholder for save button or other settings
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Save preferences
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}