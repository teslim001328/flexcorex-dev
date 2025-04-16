import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../../widgets/bottom_nav_bar.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final List<String> communityItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        backgroundColor: AppColors.background,
        elevation: 0,
      ),
      backgroundColor: AppColors.background,
      body: ListView.builder(
        itemCount: communityItems.length,
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.matteBlack
                : AppColors.offWhite,
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            shadowColor: Colors.grey.withOpacity(0.5),
            child: ListTile(
              title: Text(
                communityItems[index],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              // You can add more details or actions here.
            ),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 4),
    );
  }
}