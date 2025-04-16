import 'package:flutter/material.dart';
import 'package:flexcorex/themes/app_theme.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(0.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildNavItem(Icons.home_rounded, 0, 'Home'),
              _buildNavItem(Icons.restaurant_rounded, 1, 'Meals'),
              _buildNavItem(Icons.fitness_center_rounded, 2, 'Workouts'),
              _buildFlexAIBtn(),
              _buildNavItem(Icons.show_chart_rounded, 4, 'Progress'),
              _buildNavItem(Icons.people_rounded, 5, 'Community'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, String label) {
    return Expanded(
      child: GestureDetector(
        onTap: () => widget.onItemTapped(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              color: widget.selectedIndex == index
                  ? AppTheme.primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: widget.selectedIndex == index 
                    ? AppTheme.primaryColor
                    : Theme.of(context).textTheme.bodySmall!.color,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFlexAIBtn() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.onItemTapped(3); // Assuming FlexAI is at index 3
        },
        child: Container(
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ 
                AppTheme.primaryColor.withOpacity(0.8),
                AppTheme.secondaryColor.withOpacity(0.8),
              ], 
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.champagneGold.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.android,
              size: 30,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
