import 'package:flutter/material.dart';

class PosterCard extends StatelessWidget {
  final String title;
  final double progress;
  final String imageUrl;

  const PosterCard({
    super.key,
    required this.title,
    required this.progress,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: 120, // Largura mapeada do mobile[cite: 4]
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Proporção de imagem 0.65 mapeada do Tailwind[cite: 4]
          AspectRatio(
            aspectRatio: 0.65,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: colorScheme.surfaceContainer,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge
                ?.copyWith(color: colorScheme.onSurface),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: colorScheme.surfaceContainerHighest,
            color: colorScheme.primaryContainer,
            minHeight: 4,
            borderRadius: BorderRadius.circular(2),
          ),
        ],
      ),
    );
  }
}
