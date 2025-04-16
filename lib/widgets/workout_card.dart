import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({
    super.key,
    required this.name,
    required this.duration,
    required this.intensity,
    required this.muscleGroups,
  }) : super();

  final String name;
  final String duration;
  final String intensity;
  final String muscleGroups;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: theme.cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.timer, size: 16, color: theme.primaryColor),
              const SizedBox(width: 4),
              Text(
                duration,
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(width: 8),
              if (intensity.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(intensity, style: const TextStyle(fontSize: 12, color: Colors.white))),
              const SizedBox(width: 8),
              Text(muscleGroups)
            ],
          )
        ],
      ),
    );
  }
}
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.mutedRoseGold.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            intensity,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: AppColors.offWhite,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Muscle Groups: ${muscleGroups.join(', ')}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: AppColors.platinumSilver,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
