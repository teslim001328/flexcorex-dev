import 'package:flutter/material.dart';
import 'package:flexcorex/themes/colors.dart'; // Assuming this is where your colors are defined

class MealCard extends StatelessWidget {
  const MealCard({
    super.key,
    required this.meal,
  });

  final Map<String, dynamic> meal;

  @override
  Widget build(BuildContext context) {
    final name = meal['name'] as String? ?? 'Unknown Meal';
    final calories = meal['calories'] as int? ?? 0;
    final tags = (meal['tags'] as List<dynamic>?)?.cast<String>() ?? [];
    final instructions = meal['instructions'] as String? ?? 'No instructions provided.';
    final imageUrl = meal['image'] as String? ?? '';

    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Column(
          children: <Widget>[
            if (imageUrl.isNotEmpty)
              Image.network(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            else
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey[200],
                child: const Icon(Icons.image_not_supported, size: 50),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: theme.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: <Widget>[
                      Icon(Icons.local_fire_department, size: 16, color: AppColors.mutedRoseGold),
                      const SizedBox(width: 4.0),
                      Text('$calories kcal', style: theme.textTheme.bodySmall),
                      const SizedBox(width: 16.0),
                      if (tags.isNotEmpty)
                        Expanded(
                          child: Wrap(
                            spacing: 4.0,
                            children: tags.map((tag) => _buildTag(tag, theme)).toList(),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Theme(
                    data: theme.copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: Text(
                        'How to Cook',
                        style: theme.textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          child: Text(
                            instructions,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String tag, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: AppColors.platinumSilver.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        tag,
        style: theme.textTheme.bodySmall!.copyWith(
          color: AppColors.matteBlack,
          fontSize: 10.0,
        ),
      ),
    );
  }
}
