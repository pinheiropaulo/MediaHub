import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:media_hub/app/theme/app_colors.dart';

class EpisodeProgressTile extends StatelessWidget {
  const EpisodeProgressTile({
    super.key,
    required this.code,
    required this.title,
    required this.imageUrl,
    required this.isCompleted,
    required this.onChanged,
  });

  final String code;
  final String title;
  final String imageUrl;
  final bool isCompleted;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceContainer,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () => onChanged(!isCompleted),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 96,
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 64,
                  height: 48,
                  fit: BoxFit.cover,
                  placeholder: (_, _) => const SizedBox(
                    width: 64,
                    height: 48,
                    child: ColoredBox(color: AppColors.surfaceContainerHighest),
                  ),
                  errorWidget: (_, _, _) => const SizedBox(
                    width: 64,
                    height: 48,
                    child: ColoredBox(color: AppColors.surfaceContainerHighest),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      code,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColors.primaryContainer,
                      ),
                    ),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
              Checkbox(
                value: isCompleted,
                onChanged: (value) => onChanged(value ?? false),
                side: const BorderSide(color: AppColors.outline, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                fillColor: WidgetStateProperty.resolveWith(
                  (states) => states.contains(WidgetState.selected)
                      ? AppColors.primaryContainer
                      : Colors.transparent,
                ),
                checkColor: AppColors.onPrimaryContainer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
