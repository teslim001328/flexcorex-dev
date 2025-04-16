import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../themes/app_theme.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final String type; // 'user' or 'ai'

  const ChatBubble({super.key, required this.text, required this.type});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;
    final isUser = type == 'user';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isUser
            ? (isDarkMode ? AppTheme.dark().primaryColor : AppTheme.light().primaryColor)
            : (isDarkMode ? AppTheme.dark().cardColor : AppTheme.light().cardColor),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(color: isUser ? Colors.white : (isDarkMode ? Colors.white : Colors.black87)),
          ),
        ]),
    );
  }
}